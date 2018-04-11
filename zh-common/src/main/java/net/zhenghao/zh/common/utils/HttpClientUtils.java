package net.zhenghao.zh.common.utils;

import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 🙃
 * 🙃基于HttpClient连接的封装类
 * 🙃
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/11 14:21
 * HttpClientUtils.java
 */
public class HttpClientUtils {

    public static final String CHARSET = "UTF-8";

    private static CloseableHttpClient client;

    //HttpClient相当于一个浏览器，不停的发送get post请求，线程安全，所以运用单例
    private static CloseableHttpClient getHttpClient() {
        if (null == client) {
            //RequestConfig config = RequestConfig.custom()
            //       .setConnectTimeout(5000).setSocketTimeout(3000).build();
            client = HttpClients.createDefault();
        }
        return client;
    }

    /**
     * HTTP Get 获取内容
     * @param url 请求的url地址 ?之前的地址
     * @param params 请求的参数
     * @return 返回内容
     * @throws IOException
     */
    public static String sendGet(String url, Map<String, Object> params) throws IOException {

        if(params !=null && !params.isEmpty()){
            List<NameValuePair> pairs = new ArrayList<NameValuePair>(params.size());
            for (String key :params.keySet()){
                pairs.add(new BasicNameValuePair(key, params.get(key).toString()));
            }
            url +="?" + EntityUtils.toString(new UrlEncodedFormEntity(pairs), CHARSET);
        }

        HttpGet httpGet = new HttpGet(url);
        client = getHttpClient();
        CloseableHttpResponse response = client.execute(httpGet);
        int statusCode = response.getStatusLine().getStatusCode();
        if(statusCode != HttpStatus.SC_OK){
            httpGet.abort();
            return "HttpClient,error status code :" + statusCode;
        }
        HttpEntity entity = response.getEntity();
        String result = null;
        if (entity != null) {
            result = EntityUtils.toString(entity, "utf-8");
            EntityUtils.consume(entity);
            response.close();
            return result;
        }else{
            return null;
        }
    }

    /**
     * HTTP Post 获取内容
     * @param url url请求的url地址 ?之前的地址
     * @param params 请求的参数
     * @return 页面内容
     * @throws IOException
     */
    public static String sendPost(String url, Map<String, Object> params) throws IOException {

        List<NameValuePair> pairs = null;
        if (params != null && !params.isEmpty()) {
            pairs = new ArrayList<NameValuePair>(params.size());
            for (Map.Entry<String, Object> entry : params.entrySet()) {
                pairs.add(new BasicNameValuePair(entry.getKey(), entry.getValue().toString()));
            }
        }
        HttpPost httpPost = new HttpPost(url);
        if (pairs != null && pairs.size() > 0) {
            httpPost.setEntity(new UrlEncodedFormEntity(pairs, CHARSET));
        }
        client = getHttpClient();
        CloseableHttpResponse response = client.execute(httpPost);
        int statusCode = response.getStatusLine().getStatusCode();
        if (statusCode != HttpStatus.SC_OK) {
            httpPost.abort();
            return "HttpClient,error status code :" + statusCode;
        }
        HttpEntity entity = response.getEntity();
        String result = null;
        if (entity != null) {
            result = EntityUtils.toString(entity, "utf-8");
            EntityUtils.consume(entity);
            response.close();
            return result;
        }else{
            return null;
        }
    }

    public static String doPost(String url, String params) throws Exception {
        HttpPost httpPost = new HttpPost(url);// 创建httpPost
        httpPost.setHeader("Accept", "application/json");
        httpPost.setHeader("Content-Type", "application/json");
        String charSet = "UTF-8";
        StringEntity entity = new StringEntity(params, charSet);
        httpPost.setEntity(entity);
        CloseableHttpResponse response = null;
        client = getHttpClient();
        try {
            response = client.execute(httpPost);
            int statusCode = response.getStatusLine().getStatusCode();
            String result = null;
            if (statusCode == HttpStatus.SC_OK) {
                HttpEntity responseEntity = response.getEntity();
                result = EntityUtils.toString(responseEntity);
                return result;
            }
            else{
                return "HttpClient,error status code :" + statusCode;
            }
        }
        finally {
            if (response != null) {
                try {
                    response.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
