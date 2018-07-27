package com.framework.utils;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.jpush.api.JPushClient;
import cn.jpush.api.TestOrder;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.Message;
import cn.jpush.api.push.model.Options;
import cn.jpush.api.push.model.Platform;
import cn.jpush.api.push.model.PushPayload;
import cn.jpush.api.push.model.SMS;
import cn.jpush.api.push.model.audience.Audience;
import cn.jpush.api.push.model.audience.AudienceTarget;
import cn.jpush.api.push.model.notification.AndroidNotification;
import cn.jpush.api.push.model.notification.IosNotification;
import cn.jpush.api.push.model.notification.Notification;

@SuppressWarnings("unused")
public class JPushUtils {
	
	private static final Logger LOG = LoggerFactory.getLogger(JPushUtils.class);
	private static JPushClient jpush = null;
	private static long timeToLive =  60 * 60 * 24 * 10;  
	private static final String ALERT = "推送信息"; 
	
	static {
		jpush=new JPushClient(Constant.MASTERSECRET,Constant.APPKEY);
	}
	
	public static void main(String[] args) {
		sendSingle("402849905c42b4d5015c43463e160007", "测试", Long.parseLong("36"));
	}
//	String toid = request.getParameter("toid");
//	String content=request.getParameter("content");
//
//	int rs=JPushUtils.sendSingle(toid,content,Long.parseLong((String) map.get("id")));

	public static int send(Object tags,String Content,Long id) {
		 int result=0;
		 List<String> strings=new ArrayList<String>();
		 strings.add(tags.toString());
		 PushPayload payload = buildPushObject_android_and_ios(strings,
				 Content,id);
	     try {
	            PushResult presult = jpush.sendPush(payload);
	            System.out.println("发送标示是否成功----"+presult.isResultOK());
	            if(presult.isResultOK()){
	            	result=1;
	            }else{
	            	result=0;
	            }
	      } catch (Exception e) {
	    	  e.printStackTrace();
	    	  result=0;
	      }
	      return result;
	}
	
	public static int sendAll(String Content,Long id) {
		 int result=0;
		 PushPayload payload = pushAll(Content, id);
	     try {
	            PushResult presult = jpush.sendPush(payload);
	            System.out.println("发送标示是否成功----"+presult.isResultOK());
	            if(presult.isResultOK()){
	            	result=1;
	            }else{
	            	result=0;
	            }
	      } catch (Exception e) {
	    	  e.printStackTrace();
	    	  result=0;
	      }
	      return result;
	}
	
	public static int sendSingle(Object tags,String Content,Long id) {
		 int result=0;
		 List<String> strings=new ArrayList<String>();
		 strings.add(tags.toString());
		 PushPayload payload = buildPushObject_android_and_ios(strings,
				 Content,id);
	     try {
	            PushResult presult = jpush.sendPush(payload);
	            System.out.println("----"+presult.isResultOK());
	            if(presult.isResultOK()){
	            	result=1;
	            }else{
	            	result=0;
	            }
	      } catch (Exception e) {
	    	  e.printStackTrace();
	    	  result=0;
	      }
	      return result;
	}
	
    public static PushPayload buildPushObject_android_and_ios(List<String> tags,
    			String title,Long id) {
    	return PushPayload.newBuilder()
                .setPlatform(Platform.android_ios())
                .setAudience(Audience.newBuilder()
                        .addAudienceTarget(AudienceTarget.alias(tags))
                        .build())
//                .setMessage(Message.newBuilder()
//                		.setTitle("亳州扶贫")
//                        .setMsgContent(title)
//                        .addExtra("id",id)
//                        .build())
                .setNotification(Notification.newBuilder()
                        .addPlatformNotification(AndroidNotification.newBuilder()
                                .addExtra("id", id)
                                .setAlert(title)
                                
                                .build())
                        .addPlatformNotification(IosNotification.newBuilder()
                                .addExtra("id", id)
                                .setAlert(title)
                                .setSound("default")
                                .build())
                        .build())
                .setOptions(Options.newBuilder()
            			.setApnsProduction(true)
            			.setTimeToLive(timeToLive)
            			.build())
                .build();
    }
	
    
    public static PushPayload pushAll(String title,Long id) {
			return PushPayload.newBuilder()
					.setPlatform(Platform.all())
					.setAudience(Audience.all())
		            .setMessage(Message.newBuilder()
		            		.setTitle("亳州农村道路畅通工程")
		                    .setMsgContent(title)
		                    .addExtra("id",id)
		                    .build())
		            .setOptions(Options.newBuilder()
		        			.setApnsProduction(true)
		        			.setTimeToLive(timeToLive)
		        			.build())
		            .build();
    }
    
	
}
