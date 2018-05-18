package net.zhenghao.zh.wechat.jwt;

import com.auth0.jwt.interfaces.Claim;

import java.io.UnsupportedEncodingException;
import java.util.Map;

/**
 * 🙃
 * 🙃
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/5/18 14:41
 * JwtTokenDemo.java
 */
public class JwtTokenDemo {
    public static void main(String[] args) throws UnsupportedEncodingException {
        /*String token = JwtToken.createToken();

        System.out.println("Token:" + token);

        Map<String, Claim> claimMap = JwtToken.verifyToken(token);
        System.out.println(claimMap.get("name").asString());
        System.out.println(claimMap.get("age").asString());
        System.out.println(claimMap.get("org").asString());*/

        String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJvcmciOiLku4rml6XlpLTmnaEiLCJuYW1lIjoi6LW15q2j5rWpIiwiZXhwIjoxNTI2NjI2NDA5LCJpYXQiOjE1MjY2MjYzNDksImFnZSI6IjI1In0.IgZbGNXAiDi0Id4cLlaE0ZBkEHa2ZYf0YG0Re5s4Bts";
        Map<String, Claim> claimMap = JwtToken.verifyToken(token);
        System.out.println(claimMap.get("name").asString());
        System.out.println(claimMap.get("age").asString());
        System.out.println(claimMap.get("org").asString());
    }
}
