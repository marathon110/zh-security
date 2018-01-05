package net.zhenghao.zh.common.xss;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * XSS过滤
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2017年11月29日 下午4:09:55
 * XssFilter.java
 */
public class XssFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		XssHttpServletRequestWrapper xssRequest = new XssHttpServletRequestWrapper(
				(HttpServletRequest)request);
		chain.doFilter(xssRequest, response);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
