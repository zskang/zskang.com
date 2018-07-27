package com.framework.utils;

import org.apache.commons.httpclient.util.HttpURLConnection;
import org.apache.xerces.dom.DocumentImpl;
import org.codehaus.xfire.client.Client;

import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Properties;

/**
 * Created by zskang on 2017/7/14.
 */
public class MobileMsgEngine {

    private static MobileMsgEngine inst = new MobileMsgEngine();

    public static MobileMsgEngine getMobileMsgEngine() {
        return inst;
    }

//    @SuppressWarnings("unchecked")
//    private boolean findMsgAndSend() {
//        IDto dto = Sgwf_mobile_msgDto.getSgwf_mobile_msgDto();
//        try {
//            List<Sgwf_mobile_msgPOJO> pojos = (List) BasicDao.getBasicDao().queryByCondition(null, dto, "WHERE IS_SENDED=?",
//                    new Object[]{Sgwf_mobile_msgPOJO.EnumIs_sended.A否.getValue()}, "", -1, 1, null);
//            for (Sgwf_mobile_msgPOJO sgwf_mobile_msgPOJO : pojos) {
//                // 如果java实在调试不通，注释掉这里，用c语言从数据库读取数据然后发送！
//                send2Webservice(sgwf_mobile_msgPOJO.getContent(), sgwf_mobile_msgPOJO.getMobile_code());
//                BasicDao.getBasicDao().update(null, "UPDATE SGWF_MOBILE_MSG SET IS_SENDED=? WHERE ID=?",
//                        new Object[]{Sgwf_mobile_msgPOJO.EnumIs_sended.A是.getValue(), sgwf_mobile_msgPOJO.getId()});
//                return true;
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } catch (Throwable e) {
//            e.printStackTrace();
//        }
//        return false;
//    }


    //扶贫短信帐号05605539181密码010203
    //教育短信05674852136密码123456

    public static void send2Webservice(String content, String mobile) throws Exception {
        if (mobile == null) {
            mobile = "手机号码";
        }
        Properties properties = PropertiesUtils.getPropertiesByName("config");
        String sms_url = properties.getProperty("sms_url");
        String sms_epid = properties.getProperty("epid");
        String sms_user = properties.getProperty("sms_user");
        String sms_password = properties.getProperty("password");

        String urlStr = sms_url + "?epid=" + sms_epid + "&User_Name=" + sms_user + "&password="
                + sms_password + "&phone=" + java.net.URLEncoder.encode(mobile, "UTF-8") + "&content=" + java.net.URLEncoder.encode(content, "UTF-8") + "";
        URL url = new URL(urlStr);
        HttpURLConnection huc = (HttpURLConnection) url.openConnection();
        String result = "";
        try {
            huc.setRequestMethod("GET");
            huc.connect();
            InputStream is = huc.getInputStream();
            int code = huc.getResponseCode();
            if (code == HttpURLConnection.HTTP_OK) {
                byte[] buffer = new byte[4096];
                int bytes = 0;
                while (true) {
                    bytes = is.read(buffer);
                    if (bytes <= 0) {
                        break;
                    }
                    result += new String(buffer);

                }
                int idx = result.indexOf("<string xmlns=\"http://access.xx95.net:8886\">");
                if (idx != -1) {
                    result = result.substring(idx + "<string xmlns=\"http://access.xx95.net:8886\">".length());
                    result = result.substring(0, result.indexOf("<"));
                    handleResponse(result);
                }
            } else {
                throw new Exception("HTTP调用失败，返回码" + code);
            }

        } finally {
            try {
                huc.disconnect();
            } catch (Throwable ex) {
            }
        }

    }


    public static String[] send2WebserviceExcode( String mobile, String content,String ExtendCode) throws Exception {
        Properties properties = PropertiesUtils.getPropertiesByName("config");
        String sms_url = properties.getProperty("sms_url");
        String sms_epid = properties.getProperty("epid");
        String sms_user = properties.getProperty("user_name");
        String sms_password = properties.getProperty("pass_word");
        System.out.println(sms_url);
        String[] resultArry = new String[2];
        if (mobile == null) {
            mobile = "手机号码";
        }
        String urlStr = sms_url + "?epid=" + sms_epid + "&User_Name=" + sms_user + "&password="
                + sms_password + "&phone=" + java.net.URLEncoder.encode(mobile, "UTF-8") + "&content=" + java.net.URLEncoder.encode(content, "UTF-8") + "&ExtendCode=" + java.net.URLEncoder.encode(ExtendCode, "UTF-8") + "";
        URL url = new URL(urlStr);
        sun.net.www.protocol.http.HttpURLConnection huc = (sun.net.www.protocol.http.HttpURLConnection) url.openConnection();
        String result = "";
        try {
            huc.setRequestMethod("GET");
            huc.connect();
            InputStream is = huc.getInputStream();
            int code = huc.getResponseCode();
            if (code == HttpURLConnection.HTTP_OK) {
                byte[] buffer = new byte[4096];
                int bytes = 0;
                while (true) {
                    bytes = is.read(buffer);
                    if (bytes <= 0) {
                        break;
                    }
                    result += new String(buffer);
                }

                int idx = result.indexOf("<string xmlns=\"http://access.xx95.net:8886/\">");
                if (idx != -1) {
                    result = result.substring(idx + "<string xmlns=\"http://access.xx95.net:8886/\">".length());
                    result = result.substring(0, result.indexOf("<"));
                    //handleResponse(result);
                    resultArry[0] = "00".equals(result) ? "00000" : result;
                    if ("00".equals(result)) {
                        resultArry[1] = "发送成功";
                    } else if ("01".equals(result)) {
                        resultArry[1] = "发送短信失败！返回码" + result + ",错误描述：号码或内容为空、号码超过上限";

                    } else if ("02".equals(result)) {
                        resultArry[1] = "发送短信失败！返回码" + result + ",错误描述：登陆失败";

                    } else if ("07".equals(result)) {
                        resultArry[1] = "发送短信失败！返回码" + result + ",错误描述：企业id无效";

                    } else if ("10".equals(result)) {
                        resultArry[1] = "发送短信失败！返回码" + result + ",错误描述：余额不足";


                    } else if ("11".equals(result)) {
                        resultArry[1] = "发送短信失败！返回码" + result + ",错误描述：未知错误";

                    } else if ("-99".equals(result)) {
                        resultArry[1] = "发送短信失败！返回码" + result + ",错误描述：服务器接受失败";


                    } else {
                        resultArry[1] = "发送短信失败！返回码" + result + "，错误描述：内容有屏蔽字:" + result;

                    }

                } else {

                    resultArry[0] = "00F";
                    resultArry[1] = "发送短信失败！返回码" + result;
                }


            } else {

                resultArry[0] = "00F";
                resultArry[1] = "发送短信失败！HTTP调用失败，返回码" + result;
            }

        } finally {
            try {
                huc.disconnect();
            } catch (Throwable ex) {
            }
        }
        return resultArry;
    }

    public static void send2Webservice1(String mobile, String content) throws Exception, MalformedURLException {
        // 发送到webservice:
        // 定义一个Client对象，指定web服务的wsdl的地址
        Properties properties = PropertiesUtils.getPropertiesByName("config");
        String sms_url = properties.getProperty("sms_url");
        String sms_epid = properties.getProperty("epid");
        String sms_user = properties.getProperty("user_name");
        String sms_password = properties.getProperty("pass_word");
        System.out.println(sms_url);
        Client c = new Client(new URL(sms_url));
        // 调用Client对象的invoke方法，指定web服务的方法名，和参数，返回值是一个Object型的数组。
        // 下面代码调用getVersionTime方法，这个方法没有参数用所以后一个参数使用new Object[0]。
        System.out.println(mobile);
        System.out.println(content);
        System.out.println(sms_epid);
        System.out.println(sms_user);
        System.out.println(sms_password);
        Object[] results = c.invoke("SendSms", new Object[]{sms_epid, sms_user, sms_password, mobile, content});
        DocumentImpl doc = (DocumentImpl) results[0];
        String result = doc.getFirstChild().getFirstChild().getFirstChild().getTextContent();
        handleResponse(result);
    }

    private static void handleResponse(String result) throws Exception {
        if ("00".equals(result)) {

        } else if ("01".equals(result)) {
            throw new Exception("发送短信失败！返回码" + result + "，错误描述：号码或内容为空、号码超过上限");
        } else if ("02".equals(result)) {
            throw new Exception("发送短信失败！返回码" + result + "，错误描述：登陆失败");
        } else if ("07".equals(result)) {
            throw new Exception("发送短信失败！返回码" + result + "，错误描述：企业id无效");
        } else if ("10".equals(result)) {
            throw new Exception("发送短信失败！返回码" + result + "，错误描述：余额不足");
        } else if ("11".equals(result)) {
            throw new Exception("发送短信失败！返回码" + result + "，错误描述：未知错误");
        } else if ("-99".equals(result)) {
            throw new Exception("发送短信失败！返回码" + result + "，错误描述：服务器接受失败");
        } else {
            throw new Exception("发送短信失败！返回码" + result + "，错误描述：内容有屏蔽字:" + result);
        }
    }

}
