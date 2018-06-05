package net.zhenghao.zh.wechat.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Date;
import java.util.Map;

/**
 * 🙃
 * 🙃 请求校验工具类
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/17 11:29
 * SignUtils.java
 */
public class SignUtils {

    private static final Logger LOGGER = LoggerFactory.getLogger(SignUtils.class);

    private static char[] digit = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };

    /**
     * 1）将token、timestamp、nonce三个参数进行字典序排序
     * 2）将三个参数字符串拼接成一个字符串进行sha1加密
     * 3）开发者获得加密后的字符串可与signature对比，标识该请求来源于微信
     * @param token     令牌
     * @param signature 微信加密签名，signature结合了开发者填写的token参数和请求中的timestamp参数、nonce参数。
     * @param timestamp 时间戳
     * @param nonce     随机数
     * @return
     */
    public static boolean checkSignature(String token, String signature, String timestamp, String nonce) {
        String[] arr = new String[] { token, timestamp, nonce };
        // 将token、timestamp、nonce三个参数进行字典序排序
        Arrays.sort(arr);
        StringBuilder content = new StringBuilder();
        for (int i = 0; i < arr.length; i++) {
            content.append(arr[i]);
        }
        MessageDigest md = null;
        String tmpStr = getMessageDigest(content.toString(), "SHA-1");
        content = null;
        return tmpStr.equals(signature.toUpperCase());
    }

    /**
     * 获取Jssdk 的签名
     * @param params
     * @return
     */
    public static String getJssdkSignature(Map<String, String> params) {
        String[] arr = new String[] { "noncestr", "jsapi_ticket", "timestamp", "url" };
        // noncestr、jsapi_ticket、timestamp、url四个字段名进行字典序排序
        Arrays.sort(arr);
        StringBuilder content = new StringBuilder();
        for (int i = 0; i < arr.length; i++) {
            content.append(arr[i]);
            content.append("=");
            content.append(params.get(arr[i]));
            if (i != arr.length - 1) {
                content.append("&");
            }
        }
        String signature = getMessageDigest(content.toString(), "SHA-1");
        content = null;
        return signature.toLowerCase();
    }


    /**
     * 对字符串进行MessageDigest加密
     * @param str 加密内容
     * @param Type 加密类型
     * @return
     */
    public static String getMessageDigest(String str, String Type) {
        MessageDigest md = null;
        String result = null;
        try {
            md = MessageDigest.getInstance(Type);
            // 将三个参数字符串拼接成一个字符串进行sha1加密
            byte[] digest = md.digest(str.getBytes("utf-8"));
            result = byteToStr(digest);
        } catch (NoSuchAlgorithmException e) {
            LOGGER.error(e.getMessage(), e);
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            LOGGER.error(e.getMessage(), e);
            e.printStackTrace();
        }
        return result;
    }
    /**
     * 将字节数组转换为十六进制字符串
     * @param byteArray
     * @return
     */
    public static String byteToStr(byte[] byteArray) {
        StringBuffer strDigest = new StringBuffer();
        for (int i = 0; i < byteArray.length; i++) {
            strDigest.append(byteToHexStr(byteArray[i]));
        }
        return strDigest.toString();
    }

    /**
     * 将字节转换为十六进制字符串
     * @param mByte
     * @return
     */
    public static String byteToHexStr(byte mByte) {
        char[] tempArr = new char[2];
        tempArr[0] = digit[(mByte >>> 4) & 0X0F];
        tempArr[1] = digit[mByte & 0X0F];
        String str = new String(tempArr);
        return str;
    }

    /**
     * 获取精确到秒的时间戳
     * @param date
     * @return
     */
    public static int getSecondTimestampTwo(Date date){
        if (null == date) {
            return 0;
        }
        String timestamp = String.valueOf(date.getTime()/1000);
        return Integer.valueOf(timestamp);
    }
}
