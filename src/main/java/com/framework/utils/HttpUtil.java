package com.framework.utils;

import com.alibaba.fastjson.JSONObject;
import org.apache.log4j.Logger;

import javax.net.ssl.*;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.URL;

public class HttpUtil {

	static final Logger logger=Logger.getLogger(HttpUtil.class);
	
	final static HostnameVerifier DO_NOT_VERIFY = new HostnameVerifier() {
        public boolean verify(String hostname, SSLSession session) {
            return true;
        }
    };
    
	/**
	 * 发起https请求并获取结果
	 * 
	 * @param requestUrl
	 *            请求地址
	 * @param requestMethod
	 *            请求方式（GET、POST）
	 * @param outputStr
	 *            提交的数据
	 * @return JSONObject(通过JSONObject.get(key)的方式获取json对象的属性值)
	 */
	public static JSONObject httpRequest(String requestUrl,String requestMethod, String outputStr,String Authorization) {
		JSONObject jsonObject = null;
		StringBuffer buffer = new StringBuffer();
		try {
			// 创建SSLContext对象，并使用我们指定的信任管理器初始化
			URL url = new URL(requestUrl);
			HttpURLConnection httpUrlConn = null;
			trustAllHosts();
			HttpsURLConnection https = (HttpsURLConnection)url.openConnection();
            if (url.getProtocol().toLowerCase().equals("https")) {
                https.setHostnameVerifier(DO_NOT_VERIFY);
                httpUrlConn = https;
            } else {
            	httpUrlConn = (HttpURLConnection)url.openConnection();
            }

            logger.info("requestUrl="+requestUrl);
            logger.info("outputStr="+outputStr);
            logger.info("Authorization="+Authorization);
            
			httpUrlConn.setDoOutput(true);
			httpUrlConn.setDoInput(true);
			httpUrlConn.setUseCaches(false);
			httpUrlConn.setRequestProperty("Accept", "application/json");
			httpUrlConn.setRequestProperty("Content-Type", "application/json;charset=utf-8");
			httpUrlConn.addRequestProperty("Authorization", Authorization);
			// 设置请求方式（GET/POST）
			httpUrlConn.setRequestMethod(requestMethod);
			if ("GET".equalsIgnoreCase(requestMethod))
				httpUrlConn.connect();

			// 当有数据需要提交时
			if (null != outputStr) {
				OutputStream outputStream = httpUrlConn.getOutputStream();
				// 注意编码格式，防止中文乱码
				outputStream.write(outputStr.getBytes("UTF-8"));
				outputStream.close();
			}

			// 将返回的输入流转换成字符串
			InputStream inputStream = httpUrlConn.getInputStream();
			InputStreamReader inputStreamReader = new InputStreamReader(
					inputStream, "utf-8");
			BufferedReader bufferedReader = new BufferedReader(
					inputStreamReader);

			String str = null;
			while ((str = bufferedReader.readLine()) != null) {
				buffer.append(str);
			}
			bufferedReader.close();
			inputStreamReader.close();
			// 释放资源
			inputStream.close();
			inputStream = null;
			httpUrlConn.disconnect();
			jsonObject = JSONObject.parseObject(buffer.toString());
			logger.info("调用云主机返回结果="+buffer.toString());
			// jsonObject = JSONObject.fromObject(buffer.toString());
		} catch (ConnectException ce) {
			ce.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonObject;
	}

	private static void trustAllHosts() {
	    final String TAG = "trustAllHosts";
	    // Create a trust manager that does not validate certificate chains
	    TrustManager[] trustAllCerts = new TrustManager[] { new X509TrustManager() {
	 
	        public java.security.cert.X509Certificate[] getAcceptedIssuers() {
	            return new java.security.cert.X509Certificate[] {};
	        }
	 
			@Override
			public void checkClientTrusted(
					java.security.cert.X509Certificate[] arg0, String arg1)
					throws java.security.cert.CertificateException {
				// TODO Auto-generated method stub
				
			}

			@Override
			public void checkServerTrusted(
					java.security.cert.X509Certificate[] arg0, String arg1)
					throws java.security.cert.CertificateException {
				// TODO Auto-generated method stub
				
			}
	    } };
	 
	    // Install the all-trusting trust manager
	    try {
	        SSLContext sc = SSLContext.getInstance("TLS");
	        sc.init(null, trustAllCerts, new java.security.SecureRandom());
	        HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}
