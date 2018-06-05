package net.zhenghao.zh.wechat.jwt;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.UnsupportedEncodingException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 🙃
 * 🙃
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/5/18 14:16
 * JwtToken.java
 */
public class JwtToken {

    private static Logger LOGGER = LoggerFactory.getLogger(JwtToken.class);

    /**
     * 公用密匙-保存在服务器端，客户端不会知道密匙，以防被攻击
     */
    public static String SECRET = "zhaozhenghao";

    /**
     * 生成Token
     * @return
     */
    public static String createToken(String openid) throws UnsupportedEncodingException {

        //签发事件
        Date iatDate = new Date();

        //过期事件-1分钟过期
        Calendar nowTime = Calendar.getInstance();
        nowTime.add(Calendar.DATE, 1);
        Date expiresDate = nowTime.getTime();

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("alg", "HS256");
        map.put("typ", "JWT");
        String token = JWT.create()
                .withHeader(map)//header
                .withClaim("openid", openid)//payload
                .withExpiresAt(expiresDate)//设置过期时间-过期时间要大于签发时间
                .withIssuedAt(iatDate)//设置签发时间
                .sign(Algorithm.HMAC256(SECRET));//加密
        return token;
    }

    /**
     * 解密Token
     * @param token
     * @return
     */
    public static Map<String, Claim> verifyToken(String token) throws UnsupportedEncodingException {
        if(StringUtils.isBlank(token)) {
            return null;
        }
        JWTVerifier verifier = JWT.require(Algorithm.HMAC256(SECRET)).build();
        DecodedJWT jwt = null;
        try {
            jwt = verifier.verify(token);
            return jwt.getClaims();
        } catch (Exception e) {
            LOGGER.error("登录凭证已过期，请重新登录");
            return null;
        }
    }
}
