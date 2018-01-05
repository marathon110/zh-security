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
	private final static HTMLFilter htmlFilter = new HTMLFilter();
	
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
		return htmlFilter.filter(input);
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

}
