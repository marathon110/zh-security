package net.zhenghao.zh.common.xss;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ReadListener;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;

/**
 * XSS过滤处理
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2017年11月29日 下午4:11:31
 * XssHttpServletRequestWrapper.java
 */
public class XssHttpServletRequestWrapper extends HttpServletRequestWrapper {

	//没被包装过的HttpServletRequest(特殊场景，需要自己过滤)
	HttpServletRequest orgRequest;
	//html过滤
	//private final static HTMLFilter htmlFilter = new HTMLFilter();
	
	public XssHttpServletRequestWrapper(HttpServletRequest request) {
		super(request);
		orgRequest = request;
	}

	@Override
	public ServletInputStream getInputStream() throws IOException {
		// TODO Auto-generated method stub
		//看url的参数是不是json类型,不是则直接报错,所以普通的url直接在浏览器上敲出来会报空指针
		//非json类型,直接返回   equalsIgnoreCase忽略大小写
		if (!super.getHeader(HttpHeaders.CONTENT_TYPE).equalsIgnoreCase(MediaType.APPLICATION_JSON_VALUE)) {
			return super.getInputStream();
		}
		
		//为空,直接返回
		String json = IOUtils.toString(super.getInputStream(), "utf-8");
		if (StringUtils.isBlank(json)) {
			return super.getInputStream();
		}
		
		//xss过滤
		json = xssEncode(json);
		final ByteArrayInputStream bis = new ByteArrayInputStream(json.getBytes("utf-8"));
		return new ServletInputStream() {
			
			@Override
			public int read() throws IOException {
				// TODO Auto-generated method stub
				return bis.read();
			}
			
			@Override
			public void setReadListener(ReadListener readListener) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public boolean isReady() {
				// TODO Auto-generated method stub
				return true;
			}
			
			@Override
			public boolean isFinished() {
				// TODO Auto-generated method stub
				return true;
			}
		};
	}

	@Override
	public String getParameter(String name) {
		// TODO Auto-generated method stub
		String value = super.getParameter(xssEncode(name));
		if (StringUtils.isNotBlank(value)) {
			value = xssEncode(value);
		}
		return value;
	}

	@Override
	public Map<String, String[]> getParameterMap() {
		// TODO Auto-generated method stub
		Map<String, String[]> map = new LinkedHashMap<>();
		Map<String, String[]> parameters = super.getParameterMap();
		for (String key : parameters.keySet()) {
			String[] values = parameters.get(key);
			for (int i = 0; i < values.length; i++) {
				values[i] = xssEncode(values[i]);
			}
			map.put(key, values);
		}
		return map;
	}

	@Override
	public String[] getParameterValues(String name) {
		// TODO Auto-generated method stub
		String[] parameters = super.getParameterValues(name);
		if (parameters == null || parameters.length == 0) {
			return null;
		}
		
		for (int i = 0; i < parameters.length; i++) {
			parameters[i] = xssEncode(parameters[i]);
		}
		return parameters;
	}
	
	@Override
    public String getHeader(String name) {
        String value = super.getHeader(xssEncode(name));
        if (StringUtils.isNotBlank(value)) {
            value = xssEncode(value);
        }
        return value;
    }
	
	private String xssEncode(String input) {
		//return htmlFilter.filter(input);
		return Jsoup.clean(input, Whitelist.relaxed());//content:要处理的内容
	}
	
	/**
	 * 获取最原始的request
	 * @return
	 */
	public HttpServletRequest getOrgRequest() {
		return orgRequest;
	}
	
	/**
     * 获取最原始的request
     */
    public static HttpServletRequest getOrgRequest(HttpServletRequest request) {
        if (request instanceof XssHttpServletRequestWrapper) {
            return ((XssHttpServletRequestWrapper) request).getOrgRequest();
        }

        return request;
    }
    
    /**
     * 问题场景：在网页页面的富文本编辑框添加内容是我们常见的操作，在编辑框中可以给内容填色、变字体等等之后，把内容保存到数据库。
     * 但是稍微专业的人会通过firebug/fiddler等工具拦截请求，进行修改数据(添加<script>alert(1);</script><input>等标签)，
     * 提交到数据库保存，之后加载显示数据时浏览器就执行这些标签。所以我们要在后台处理非正常手段输入的标签内容 
     * 
     * jsoup 使用一个 Whitelist 类用来对 HTML 文档进行过滤，该类提供几个常用方法：  
     * none():只允许包含文本信息  
     * basic():允许的标签包括：a, b, blockquote, br, cite, code, dd, dl, dt, em, i, li, ol, p, pre, q, small, strike, strong, sub, sup, u, ul, 以及合适的属性  
     * simpleText():只允许 b, em, i, strong, u 这些标签  
     * basicWithImages():在 basic() 的基础上增加了图片  
     * relaxed():这个过滤器允许的标签最多，包括：a, b, blockquote, br, caption, cite, code, col, colgroup, dd, dl, dt, em, h1, h2, h3, h4, h5, h6, i, img, li, ol, p, pre, q, small, strike, strong, sub, sup, table, tbody, td, tfoot, th, thead, tr, u, ul  
     * 如果这五个过滤器都无法满足你的要求呢，例如你允许用户插入 flash 动画，没关系，Whitelist 提供扩展功能，
     * 例如 whitelist.addTags("embed","object","param","span","div"); 也可调用 addAttributes 为某些元素增加属性。  
     * 用法：Jsoup.clean(content, Whitelist.relaxed());//content:要处理的内容  
     * 
     * 此外，jsoup还有很多强大的功能 参考：  http://871421448.iteye.com/blog/1545996  jsoup 官方网站：http://jsoup.org  
     */

}
