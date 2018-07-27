package com.framework.utils;

import com.sms.webservice.client.SmsReturnObj;
import com.sms.webservice.client.SmsWebClient;

/**
 * Created by zskang on 2017/7/13.
 */
public class MessageUtil {


    public static void initClient() {
        if (!SmsWebClient.enable()) {
            int ret = 0;
            try {
                ret = SmsWebClient.init("http://access.xx95.net:8886/Connect_Service.asmx", "05674852136", "123456");
            } catch (Exception ex) {
                ex.printStackTrace();
                System.out.println("短信平台接口初始化过程中异常！");
            }

            if (ret == -1 || !SmsWebClient.enable()) {
                System.out.println("短信平台接口初始化失败！");
                return;
            }
        }
    }

    public static void sendMessage(java.lang.String mobilephone,
                                   java.lang.String content,
                                   int operId,
                                   java.lang.String tosend_time,
                                   int sms_id,
                                   short backlist_filter,
                                   short fbdword_filter,
                                   short priority,
                                   java.lang.String valid_time) {
        //单个手机号码发送
        try {
            SmsReturnObj retObj = SmsWebClient.webSendMessage(mobilephone, content, operId, tosend_time, sms_id, backlist_filter, fbdword_filter, priority, valid_time);
            if (retObj.getReturnCode() != 1) {
                System.out.println("短信发送失败，原因为：" + retObj.getReturnMsg());
            } else {
                System.out.println("短信发送成功！返回结果为：" + retObj.getReturnMsg());
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("短信发送过程发生异常!");
        }
    }

    public static void sendMorephoneMessage(String phones,String content) {
        //多个手机号码发送
        try {
            SmsReturnObj retObj = SmsWebClient.webSendMessage(phones, content, 10030, "", 1, (short) 0, (short) 0, (short) 0, "");
            if (retObj.getReturnCode() != 1) {
                System.out.println("短信发送失败，原因为：" + retObj.getReturnMsg());
            } else {
                System.out.println("短信发送成功！返回结果为：" + retObj.getReturnMsg());
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("短信发送过程发生异常!");
        }
    }
}
