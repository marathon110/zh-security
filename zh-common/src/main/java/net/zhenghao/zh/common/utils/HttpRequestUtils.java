package net.zhenghao.zh.common.utils;

import org.apache.commons.lang.StringUtils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

/**
 * Http请求工具类
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date  :2017年12月18日 上午9:23:34
 * HttpRequestUtils.java
 */
public class HttpRequestUtils {

	static boolean proxySet = false;
	
	static String proxyHost = "127.0.0.1";
	
	static int proxyPort = 8087;
	
	/**
	 * 获取指定编码格式的字符串
	 * @param source 原字符串
	 * @param encode 编码格式
	 * @return 在该编码格式下的字符串
	 */
	public static String urlEncode(String source, String encode) {
		String result = source;
		try {
			result = URLEncoder.encode(source, encode);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "0";
		}
		return result;
	}
	
	/**
	 * 获取GBK格式的字符串
	 * @param source
	 * @return 在该GBK格式下的字符串
	 */
	public static String urlEncodeGBK(String source) {
		String result = source;
		try {
			result = URLEncoder.encode(source, "GBK");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "0";
		}
		return result;
	}
	
	/**
	 * 发起get http请求获取返回结果
	 * @param req_url 请求地址
	 * @return
	 */
	public static String httpRequest(String req_url) {
		StringBuffer sb = new StringBuffer();
		try {
			URL url = new URL(req_url);
			HttpURLConnection httpUrlConn = (HttpURLConnection) url.openConnection();
			
			/**
			 * get请求用不到conn.getOutputStream()，因为参数直接追加在地址后面，因此默认是false。
			 * post请求（比如：文件上传）需要往服务区传输大量的数据，这些数据是放在http的body里面的，
			 * 因此需要在建立连接以后，往服务端写数据。
			 * 因为总是使用conn.getInputStream()获取服务端的响应，因此默认值是true。
			 */
			httpUrlConn.setDoOutput(false);//从连接中读取数据httpUrlConnection.setDoOutput(true);以后就可以使用conn.getOutputStream().write()
			httpUrlConn.setDoInput(true);//向连接中写入数据httpUrlConnection.setDoInput(true);以后就可以使用conn.getInputStream().read();
			httpUrlConn.setUseCaches(false);// 禁止缓存 
			
			httpUrlConn.setRequestMethod("GET");
			httpUrlConn.connect();
			
			//将返回的输入流转换成字符串
			InputStream inputStream = httpUrlConn.getInputStream();
			InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
			BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
			
			String str = null;
			while ((str = bufferedReader.readLine()) != null) {
				sb.append(str);
			}
			bufferedReader.close();
			inputStreamReader.close();
			//释放资源
			inputStream.close();
			inputStream = null;
			httpUrlConn.disconnect();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.err.println("GET连接失败:"+e.getStackTrace());
		}
		return sb.toString();
	}
	
	/**
	 * 发送http请求取得返回的输入流
	 * @param req_url
	 * @return
	 */
	public static InputStream httpRequestIO(String req_url) {
		InputStream inputStream = null;
		try {
			URL url = new URL(req_url);
			HttpURLConnection httpUrlConn = (HttpURLConnection) url.openConnection();
			httpUrlConn.setDoInput(true);  
			httpUrlConn.setRequestMethod("GET");  
			httpUrlConn.connect();  
            // 获得返回的输入流  
            inputStream = httpUrlConn.getInputStream(); 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return inputStream;
	}
	
	/**
	 * 向指定URL发送GET方法的请求
	 * @param url 发送请求的URL
	 * @param param 请求参数,格式为:name1=value1&name2=value2
	 * @return 响应结果
	 */
	public static String sendGet(String url, String param) {
		StringBuffer sb = new StringBuffer();
		BufferedReader in = null;
		String urlNameString = url;
		try {
			if (StringUtils.isNotBlank(param)) {
				urlNameString = url + "?" + param;
			}
			URL realUrl = new URL(urlNameString);
			//打开和URL之间的连接
			URLConnection connection = realUrl.openConnection();
			connection.setRequestProperty("accept", "*/*");
			connection.setRequestProperty("connection", "Keep-Alive");
			connection.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
			//建立实际的连接
			connection.connect();
			//获取所有响应头字段
			//Map<String, List<String>> map = connection.getHeaderFields();
			//遍历所有的响应头字段
			//for (String key : map.keySet()) {
			//	System.out.println(key + "——>" + map.get(key));
			//}
			// 定义 BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream(), "utf-8"));
            String line;
            while ((line = in.readLine()) != null) {
            	sb.append(line);
            }
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("发送GET请求出现异常！" + e.getStackTrace());
			sb.append("发送GET请求出现异常！" + e.getMessage());
		} finally {
			try {
				if (in != null) {
					in.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		
		return sb.toString();
	}
	
	/**
	 * 向指定 URL 发送POST方法的请求
	 * @param url 发送请求的 URL
	 * @param param 请求参数，json串。
	 * @param isproxy 是否使用代理模式,没有代理服务器填入false!
	 * @return 响应结果
	 */
	public static String sendPost(String url, String param,boolean isproxy) {
		OutputStreamWriter out = null;
        BufferedReader in = null;
        StringBuffer sb = new StringBuffer();
        try {
        	URL realUrl = new URL(url);
            HttpURLConnection conn = null;
            if (isproxy) {//使用代理模式
				@SuppressWarnings("static-access")
				Proxy proxy = new Proxy(Proxy.Type.DIRECT.HTTP, new InetSocketAddress(proxyHost, proxyPort));
				conn = (HttpURLConnection) realUrl.openConnection(proxy);
			} else {
				conn = (HttpURLConnection) realUrl.openConnection();
			}
            
            //发送POST请求必须设置如下两行
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setRequestMethod("POST");// POST方法
            // 设置通用的请求属性
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            conn.setRequestProperty("Content-Type", "application/json");

            conn.connect();
            // 获取URLConnection对象对应的输出流
            out = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
            // 发送请求参数
            out.write(param);
            // flush输出流的缓冲
            out.flush();
            // 定义BufferedReader输入流来读取URL的响应
            in = new BufferedReader(
                    new InputStreamReader(conn.getInputStream(), "utf-8"));
            String line;
            while ((line = in.readLine()) != null) {
            	sb.append(line);
            }
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("发送 POST 请求出现异常！"+e);
			sb.append("发送POST请求出现异常！" + e.getMessage());
            //e.printStackTrace();
		} finally {
			try{
                if(out!=null){
                    out.close();
                }
                if(in!=null){
                    in.close();
                }
            }
            catch(IOException ex){
                ex.printStackTrace();
            }
		}
        return sb.toString();
	}
	
	/**
	 * Proxy proxy = new Proxy(Proxy.Type.HTTP,new InetSocketAddress(proxyAddress , proxyPort));//使用指定的代理服务器打开连接  
	 * 代理服务器的功能就是代理网络用户去取得网络信息。我们使用网络浏览器直接连接其他Internet站点取得网络信息时，
	 * 通常需要发送Request请求来等到响应。代理服务器是介于浏览器和Web服务器之间的一台服务器，有了它之后，
	 * 浏览器不是直接到Web服务器去取得网页数据而是向代理服务器发出请求，Request请求会先送到代理服务器，
	 * 由代理服务器来取回浏览器所需要的信息并送回给网络浏览器。而且，大部分代理服务器都具有缓冲的功能，
	 * 就好像一个大的Cache，它有很大的存储空间，它不断将新取得的数据储存到它本机的存储器上，
	 * 如果浏览器所请求的数据在它本机的存储器上已经存在而且是最新的，那么它就不重新从Web服务器取数据，
	 * 而直接将存储器上的数据传送给用户的浏览器，这样就能显著提高浏览速度和效率。归纳起来代理服务器主要提供如下两个功能： 
	 * 1:突破自身IP限制，对外隐藏自身IP地址。突破IP限制包括访问国外受限站点，访问国内特定单位、团体的内部资源。 
	 * 2:提高访问速度，代理服务器提供的缓冲功能可以避免每个用户都直接访问远程主机，从而提高客户端访问速度。
	 */
}