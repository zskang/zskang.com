package com.framework.task;

import com.framework.entity.*;
import com.framework.service.*;
import com.framework.utils.Constant;
import com.framework.utils.DateUtil;
import com.framework.utils.MobileMsgEngine;
import com.framework.utils.StringUtil;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * x
 * 测试定时任务(演示Demo，可删除) testTask为spring bean的名称
 */
@Component("testTask")
public class TestTask {
    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private TbBanliService banliService;


    @Autowired
    private TbMsgConfigService tbMsgConfigService;

    @Autowired
    private TbFromDocService docService;

    @Autowired
    private TbMsgLogService tbMsgLogService;


    public void test(String params) {
       /* logger.info("开始日终定时任务");
        try {
            Thread.sleep(1000L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        Map<String, Object> map = new HashMap<String, Object>();
        List<TbFromDocEntity> tbFromDocEntityList = new ArrayList<TbFromDocEntity>();
        tbFromDocEntityList = this.docService.queryList(map, "4");
        //在到期之前如果没反馈前三天每天提醒。到期的那一天提醒的 短信模板就改成
        //  你好！您有一个市政督办件, 标题是：“”需要在今天办理完毕，如未在APP中填写办理情况，将扣除效能分。
        String c = "";
        for (TbFromDocEntity entity : tbFromDocEntityList) {
            String finlishDate = entity.getFinishdate() + " 23:59:59";
            logger.info(finlishDate);
            Date finlishDate2 = DateUtil.formateStringToDate("yyyy-MM-dd HH:mm:ss", finlishDate);
            int a = differentDaysByMillisecond(new Date(), finlishDate2);
            logger.info("与现在相差天数：" + a);
            String urgencylevelCode = entity.getUrgencylevelCode();
            if (!"1".equals(urgencylevelCode)) {// 日终任务排除 平办文件
                TbMsgConfigEntity tbMsgConfigEntity = tbMsgConfigService.queryObject(Integer.parseInt(urgencylevelCode));
                if (tbMsgConfigEntity != null) {
                    int tqday = tbMsgConfigEntity.getTqday(); //提前预警天数  默认 3天
                    if (tqday > 0 && a <= tqday) {
                        if (a == 0) {
                            //当天  发 警告 短信
                            c = Constant.MSG_TODAY;
                            String sfdtsend = tbMsgConfigEntity.getSfdtsend(); //是否当天还发短信
                            if (sfdtsend.equals("Y")) {
                                sendMsg(entity.getFromDocId() + "", entity.getTitle(), entity.getFinishdate(), entity.getUrgencylevel(), tbMsgConfigEntity.getSffankuisend(), c);
                            }
                        } else {
                            c = Constant.MSG_COMMON;
                            sendMsg(entity.getFromDocId() + "", entity.getTitle(), entity.getFinishdate(), entity.getUrgencylevel(), tbMsgConfigEntity.getSffankuisend(), c);
                        }

                    }

                }

            }
        }*/

        logger.info("定时任务完毕");
    }


    /**
     * 通过时间秒毫秒数判断两个时间的间隔
     *
     * @param date1
     * @param date2
     * @return
     */
    public static int differentDaysByMillisecond(Date date1, Date date2) {
        int days = (int) ((date2.getTime() - date1.getTime()) / (1000 * 3600 * 24));
        return days;
    }

    public void sendMsg(String docid, String title, String Finishdate, String urgencylevel, String Sffankuisend, String Constat) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("docId", docid);
        //查询未反馈的相关责任人
        List<TbBanliEntity> banliEntities = this.banliService.queryList4task(map);
        if ("N".equals(Sffankuisend)) {
            for (TbBanliEntity entity1 : banliEntities) {
                Long userid = entity1.getToUserId();
                if (userid != null) {
                    SysUserEntity userEntity = this.sysUserService.queryObject(userid);
                    if (userEntity != null) {
                        String mobile = userEntity.getMobile();
                        if (StringUtil.isNotBlank(mobile)) {
                            try {
                                String content = Constat.replace("A", urgencylevel);
                                content = content.replace("B", Finishdate);
                                content = content.replace("C", title);
                                String[] res = MobileMsgEngine.send2WebserviceExcode(mobile,
                                        content, "");
                                if (res.length > 0) {
                                    TbMsgLogEntity tbMsgLogEntity = new TbMsgLogEntity();
                                    tbMsgLogEntity.setDocuuid(docid + "");
                                    tbMsgLogEntity.setResult(res[1]);
                                    tbMsgLogEntity.setSendtime(DateUtil.formatDateYYYY_MM_DD_HH_MM_SS(new Date()));
                                    tbMsgLogEntity.setTouserid(userid + "");
                                    tbMsgLogEntity.setTyp("TASK");
                                    tbMsgLogEntity.setExt1(content);
                                    tbMsgLogService.save(tbMsgLogEntity);
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                    }
                }
            }
        }
    }
}
