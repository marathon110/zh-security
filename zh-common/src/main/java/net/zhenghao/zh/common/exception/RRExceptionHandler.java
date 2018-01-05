package net.zhenghao.zh.common.exception;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.authz.UnauthorizedException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.ExceptionHandler;

import net.zhenghao.zh.common.entity.R;

/**
 * 异常处理器
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2018年1月3日 下午2:16:46
 * RRExceptionHandler.java
 */
public class RRExceptionHandler {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	/**
	 * 自定义异常
	 * @param e
	 * @return
	 */
	@ExceptionHandler(RRException.class)
	public R handlerRRException(RRException e) {
		R r = new R();
		r.put("code", e.getCode());
		r.put("msg", e.getMessage());
		return r;
	}
	
	@ExceptionHandler(DuplicateKeyException.class)
	public R handlerDuplicateKeyException(DuplicateKeyException e) {
		logger.error(e.getMessage(), e);
		return R.error("数据库中已存在该记录");
	}
	
	@ExceptionHandler({UnauthorizedException.class, AuthorizationException.class})
	public R handlerAuthorizationException(AuthorizationException e) {
		logger.error(e.getMessage(), e);
		return R.error("没有权限，请联系管理员授权");
	}
	
	@ExceptionHandler({UnauthenticatedException.class,  AuthenticationException.class})
	public R handleUnauthenticatedException(AuthenticationException e) {
		logger.error(e.getMessage(), e);
		return R.error(401, "登录认证过期");
	}

	@ExceptionHandler(Exception.class)
	public R handleException(Exception e){
		logger.error(e.getMessage(), e);
		return R.error();
	}
}
