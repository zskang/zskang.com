package com.framework.utils;
/**
 * Created by zg on 2017/7/9/009.
 */

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ClassPathResource {
    public static String sendSMS(String phone, String content) {
        Map<String, String> params = new HashMap<String, String>();
        params.put("account", "05674852136");
        params.put("password", "123456");
        params.put("sms_content", content);
        params.put("phones", phone);
        String result = "Error";
        //  String requestUrl = "http://112.122.11.191/api.ered?reqCode=smsSendLess";
        String requestUrl = "http://access.xx95.net:8886/Connect_Service.asmx?WSDL";
        try {
            result = HttpXmlUtil.doPost(requestUrl, params);
            System.out.print(result);
        } catch (Exception e) {
            e.printStackTrace();
            return result;
        }
        return result;
    }

    public static boolean isMobileNO(String mobiles) {
        Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$");
        Matcher m = p.matcher(mobiles);
        System.out.println(m.matches() + "---");
        return true;
    }

    public static void main(String[] args) throws IOException {
        System.out.println(ClassPathResource.isMobileNO("18055150696"));
    }
}


