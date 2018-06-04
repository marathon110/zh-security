package net.zhenghao.zh.wechat.interceptor;

import com.auth0.jwt.interfaces.Claim;
import net.zhenghao.zh.wechat.jwt.JwtToken;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * 🙃
 * 🙃 微信Token认证登录拦截
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/5/23 15:04
 * TokenInterceptor.java
 */
public class TokenInterceptor implements HandlerInterceptor {

    /**
     * Handler执行之前调用这个方法
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String token = request.getHeader("token");
        System.out.println("token=>" + token);
        Map<String, Claim> claimMap = JwtToken.verifyToken(token);
        if(StringUtils.isBlank(token) || claimMap == null) {
            //如果request.getHeader("X-Requested-With") 返回的是"XMLHttpRequest"说明就是ajax请求，需要特殊处理 否则直接重定向就可以了
            if("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))){
                //告诉ajax我是重定向
                response.setHeader("REDIRECT", "REDIRECT");
                //告诉ajax我重定向的路径
                response.setHeader("CONTENTPATH", request.getContextPath() +"/wechat_web/auth.html");
                response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                return false;
            }else{
                response.sendRedirect(request.getContextPath() + "/wechat_web/auth.html");
                return false;
            }

        }

        String openid = claimMap.get("openid").asString();
        System.out.println("openid=>" + openid);
        request.setAttribute("openid", openid);
        return true;
    }

    /**
     * Handler执行之后，ModelAndView返回之前调用这个方法
     * @param request
     * @param response
     * @param handler
     * @param modelAndView
     * @throws Exception
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    /**
     * Handler执行完成之后调用这个方法
     * @param request
     * @param response
     * @param handler
     * @param ex
     * @throws Exception
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
