package com.framework.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.framework.entity.*;
import com.framework.service.*;
import com.framework.utils.*;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;
import java.util.zip.ZipOutputStream;


/**
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-01 11:56:00
 */
@Controller
@RequestMapping("tbfromdoc")
public class TbFromDocController extends AbstractController {
    @Autowired
    private TbFromDocService tbFromDocService;
    @Autowired
    private TbBanliService banliService;
    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private TbFromDocPishiService pishiService;

    @Autowired
    private TbMsgLogService tbMsgLogService;

    @Autowired
    private TbMsgConfigService tbMsgConfigService;


    @Autowired
    private TbFileAttachService tbFileAttachService;
    @Autowired
    private SysUserRoleService sysUserRoleService;
    @Autowired
    private SysRoleService sysRoleService;
    @Autowired
    private TbTempUserService tmpService;


    @RequestMapping("/tbfromdoc.html")
    public String list() {
        return "tbfromdoc/tbfromdoc.html";
    }

    @RequestMapping("/tbfromdoc_add.html")
    public String add() {
        return "tbfromdoc/tbfromdoc_add.html";
    }

    @RequestMapping("/tbfromdoc_update.html")
    public String toupdate() {
        return "tbfromdoc/tbfromdoc_update.html";
    }

    @RequestMapping("/tbfromdoc_print.html")
    public String print() {
        return "tbfromdoc/tbfromdoc_print.html";
    }

    @RequestMapping("/selectUsers.html")
    public String selectUsers() {
        return "tbfromdoc/selectUsers.html";
    }


    @RequestMapping("/selectedUsers_history.html")
    public String selectUsers_history() {
        return "tbfromdoc/selectedUsers_history.html";
    }

    @RequestMapping("/tbfromdoc_zhipai.html")
    public String zhipai() {
        return "tbfromdoc/tbfromdoc_zhipai.html";
    }

    @RequestMapping("/tbfromdoc_attach.html")
    public String attach() {
        return "tbfromdoc/tbfromdoc_attach.html";
    }

    @RequestMapping("/tbfromdoc_uploadfile.html")
    public String toupload() {
        return "tbfromdoc/tbfromdoc_uploadfile.html";
    }


    @RequestMapping("/tbfromdoc_detail.html")
    public String detail() {
        return "tbfromdoc/tbfromdoc_detail.html";
    }


    @RequestMapping("/tbfromdoc_attach_update.html")
    public String attach_update() {
        return "tbfromdoc/tbfromdoc_attach_update.html";
    }


    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("tbfromdoc:list")
    public R list(Integer page, Integer limit, String title) {
        Map<String, Object> map = new HashMap<String, Object>();
        // List<TbFromDocEntity> tbFromDocList = tbFromDocService.queryList(map, "0");
        // updateFileNo(tbFromDocList);
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        if (StringUtils.isNotBlank(title)) {
            String key = com.framework.utils.Escape.unescape(title);
            map.put("title", "%" + key + "%");
        }
        //查询列表数据
        long userid = getUserId();
        map.put("userid", userid);
        //根据id 找到这个人的角色
        String type = "";
        List<Long> roleIdList = this.sysUserRoleService.queryRoleIdList(userid);

        logger.info(roleIdList.toString());
        Long roleid = roleIdList.get(0);
        if (roleid == 999) {
            //管理员 看到所有
            type = "0";
        }
        if (roleid == 1003 || roleid == 1007 || roleid == 1006) {
            //
            type = "1";
        }
        if (roleid == 1004 || roleid == 1005) {
            //
            type = "2";
        }
        List<TbFromDocEntity> tbFromDocList = tbFromDocService.queryList(map, type);
        int total = tbFromDocService.queryTotal(map, type);
        PageUtils pageUtil = new PageUtils(tbFromDocList, total, limit, page);
        return R.ok().put("page", pageUtil);
    }

    private void updateFileNo(List<TbFromDocEntity> tbFromDocList) {
        String no_2 = "";
        Integer no_ = 0;
        for (TbFromDocEntity entity : tbFromDocList) {
            no_++;
            logger.info(no_);
            if (no_ > 0 && no_ < 10) {
                no_2 = "00" + no_;
            }
            if (no_ >= 10 && no_ < 100) {
                no_2 = "0" + no_;
            }
            if (no_ >= 100 && no_ < 1000) {
                no_2 = no_ + "";
            }

            logger.info(no_2);
            entity.setFilenumber(no_2);
            this.tbFromDocService.update(entity);
        }
    }

    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{uuid}")
    @RequiresPermissions("tbfromdoc:info")
    public R info(@PathVariable("uuid") String uuid) {
        TbFromDocEntity tbFromDoc = tbFromDocService.queryObjectByUUID(uuid);
        return R.ok().put("tbFromDoc", tbFromDoc);
    }

    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/readinfo/{uuid}")
    @RequiresPermissions("tbfromdoc:info")
    public R readinfo(@PathVariable("uuid") String uuid) {
        TbFromDocEntity tbFromDoc = tbFromDocService.queryObjectByUUID(uuid);
        SysUserEntity userEntity = this.getUser();
        Map map = new HashMap();
        TbFromDocEntity tbFromDocEntity = this.tbFromDocService.queryObjectByUUID(uuid);
        map.put("docId", tbFromDocEntity.getFromDocId());
        map.put("toUserId", userEntity.getUserId());
        map.put("state", 1);
        this.banliService.updateByMap(map);
        return R.ok().put("tbFromDoc", tbFromDoc);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("tbfromdoc:save")
    public R save(@RequestBody TbFromDocEntity tbFromDoc) {
        if (StringUtils.isBlank(tbFromDoc.getFiletype())) {
            return R.error("文件类型不能为空");
        }
        if (StringUtils.isBlank(tbFromDoc.getYears())) {
            return R.error("年份不能为空");
        }

        String a = tbFromDoc.getUrgencylevel();
        if (a == null) {
            return R.error("紧急程度不能为空");
        }

        if (StringUtils.isBlank(tbFromDoc.getTitle())) {
            return R.error("来文标题不能为空");
        }
        if (StringUtils.isBlank(tbFromDoc.getSubjectword())) {
            return R.error("主题词不能为空");
        }

        if (StringUtils.isBlank(tbFromDoc.getFinishdate())) {
            return R.error("完成时间不能为空");
        }
//        }
//        Calendar c = Calendar.getInstance(TimeZone.getTimeZone("GMT+08:00"));
//        int year = c.get(Calendar.YEAR);    //获取年
//        HashMap<String, Object> map = new HashMap<String, Object>();
//        map.put("year", year);
        String filesequence = this.tbFromDocService.queryMaxRegistNumber();
        if (filesequence == null) {
            filesequence = "000";
        }
        filesequence = AddOne4registNumber(filesequence);
        logger.info(filesequence);
        tbFromDoc.setFilesequence(filesequence);//
        UUID Uuid = UUID.randomUUID();
        tbFromDoc.setUuid(Uuid.toString());
        SysUserEntity userEntity = this.sysUserService.queryObject(getUser().getUserId());
        tbFromDoc.setRegisnumber(userEntity.getXm());
        tbFromDocService.save(tbFromDoc);
        return R.ok();
    }

    private String AddOne4registNumber(String registNumber) {
        String destNum = "001";
        if (StringUtils.isNotBlank(registNumber)) {
            Integer num_ = Integer.parseInt(registNumber);
            num_++;
            logger.info(num_);
            if (num_ > 0 && num_ < 10) {
                destNum = "00" + num_;
            }
            if (num_ >= 10&& num_ < 100  ) {
                destNum =  "0"+num_;
            }
            if (num_ >= 100  ) {
                destNum =  num_.toString();
            }
        }
        return destNum;
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/zhipai")
    @RequiresPermissions("tbfromdoc:update")
    public R zhipai(@RequestBody TbFromDocEntity tbFromDoc) {
        if (!StringUtil.isNotBlank(tbFromDoc.getLdArr())) {
            return R.error("请选择领导！");
        }
        tbFromDocService.update(tbFromDoc);
        tbFileAttachService.deleteBatchByUUID(tbFromDoc.getUuid());
        tbFromDocService.saveFile2Db(tbFromDoc.getUuid());
        this.pishiService.deleteBatchBy(tbFromDoc.getFromDocId());
        String pishiArr = tbFromDoc.getLdArr();
        if (StringUtil.isNotBlank(pishiArr)) {
            String[] ps = pishiArr.split(",");
            for (String str : ps) {
                TbFromDocPishiEntity entity = new TbFromDocPishiEntity();
                entity.setFromDocId(tbFromDoc.getFromDocId());
                Map<String, Object> maps = new HashMap<String, Object>();
                maps.put("name", str);
                Long uid = this.sysUserService.queryObjectByName(maps);
                if (uid > 0L) {
                    entity.setUserId(uid);
                    entity.setCreateTime(DateUtil.format(new Date(), "yyyy-MM-dd HH:mm:ss"));
                    this.pishiService.save(entity);
                }
            }
        }
        return R.ok();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("tbmsglog:update")
    public R update(@RequestBody TbFromDocEntity tbFromDoc) {
        if (StringUtils.isBlank(tbFromDoc.getFiletype())) {
            return R.error("文件类型不能为空");
        }
        if (StringUtils.isBlank(tbFromDoc.getYears())) {
            return R.error("年份不能为空");
        }

        String a = tbFromDoc.getUrgencylevel();
        if (a == null) {
            return R.error("紧急程度不能为空");
        }

        if (StringUtils.isBlank(tbFromDoc.getTitle())) {
            return R.error("来文标题不能为空");
        }
        if (StringUtils.isBlank(tbFromDoc.getSubjectword())) {
            return R.error("主题词不能为空");
        }

        if (StringUtils.isBlank(tbFromDoc.getFinishdate())) {
            return R.error("完成时间不能为空");
        }
        tbFromDocService.update(tbFromDoc);
        return R.ok();
    }


    @ResponseBody
    @RequestMapping("/uploadFile")
    @RequiresPermissions("tbfromdoc:update")
    public R uploadFile(@RequestBody TbFromDocEntity tbFromDoc) {
        tbFileAttachService.deleteBatchByUUID(tbFromDoc.getUuid());
        tbFromDocService.saveFile2Db(tbFromDoc.getUuid());
        return R.ok();
    }

    private Long getKeZhangBy(Long centerunit) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("unitid", centerunit);
        map.put("role_id", "1006");
        return sysUserService.getKeZhang(map);
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("tbfromdoc:delete")
    public R delete(@RequestBody String[] uuids) {
        for (String uuid : uuids) {
            //TbFromDocEntity entity = this.tbFromDocService.queryObjectByUUID(uuid);
            //  if (entity != null) {
            //       Map<String, Object> map = new HashMap<String, Object>();
            //        map.put("docId", entity.getFromDocId());
            //         List<TbBanliEntity> list = this.banliService.queryList(map);
            //         if (list.size() == 0) {
            tbFromDocService.delete(uuid);
            //          } else {
            //              return R.error("文件[" + entity.getSubjectword() + "]已经指派，不能删除！");
            //         }
            //       }
        }
        //  tbFromDocService.deleteBatchByUUid(uuids);
        return R.ok();
    }


    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete1")
    @RequiresPermissions("tbfromdoc:delete")
    public R delete(@RequestBody String uuids) {
        //TbFromDocEntity entity = this.tbFromDocService.queryObjectByUUID(uuid);
        //  if (entity != null) {
        //       Map<String, Object> map = new HashMap<String, Object>();
        //        map.put("docId", entity.getFromDocId());
        //         List<TbBanliEntity> list = this.banliService.queryList(map);
        //         if (list.size() == 0) {
        tbFromDocService.delete(uuids);
        //          } else {
        //              return R.error("文件[" + entity.getSubjectword() + "]已经指派，不能删除！");
        //         }
        //       }
        //  tbFromDocService.deleteBatchByUUid(uuids);
        return R.ok();
    }


    @ResponseBody
    @RequestMapping("/saveBanliRelation/{params}")
    @RequiresPermissions("tbfromdoc:update")
    public R saveBanliRelation(@PathVariable String params) {
        logger.info(params);
        String userids = "";
        if (StringUtils.isNotBlank(params)) {
            String[] chars = params.split("&");
            String ids = "";
            if (chars.length > 0) {
                String uuid = chars[0];
                String unitId = chars[1];
                if (StringUtils.isNotBlank(chars[2])) {
                    ids = chars[2];
                }
                if (StringUtils.isNotBlank(uuid) && StringUtils.isNotBlank(unitId) && !"null".equals(unitId)) {
                    TbFromDocEntity entity = this.tbFromDocService.queryObjectByUUID(uuid);
                    if (entity != null) {
                        long formDocId = entity.getFromDocId();
                        if (StringUtils.isNotBlank(ids)) {
                            String[] id_ = ids.split(",");
                            for (String id : id_) {
                                HashMap map = new HashMap();
                                map.put("docId", formDocId);
                                map.put("fromUserId", getUser().getUserId());
                                map.put("toUserId", id);
                                int countt = this.banliService.queryList(map).size();
                                if (countt > 0) {
                                    continue;
                                }
                                TbBanliEntity blEntity = new TbBanliEntity();
                                blEntity.setDocId(formDocId);
                                blEntity.setFromUserId(getUser().getUserId() + "");
                                blEntity.setToUserId(Long.valueOf(id));
                                blEntity.setDoTime(DateUtil.format(new Date(), "yyyy-MM-dd HH:mm:ss"));
                                blEntity.setDoType("3");//指派
                                this.banliService.save(blEntity);
                                SysUserEntity userEntity = this.sysUserService.queryObject(Long.valueOf(id));
                                String name = userEntity.getXm();
                                if ("陈亮".equals(name) || "张殿纪".equals(name) || "方显启".equals(name) || "耿成华".equals(name)) {
                                    logger.info(name + ", 是领导，忽略发短信！");
                                } else {
                                    userids += id + ",";
                                }
                            }
                            //查询当前紧急程度配置 决定是否发短信
                            TbMsgConfigEntity tbMsgConfigEntity = tbMsgConfigService.queryObject(Integer.parseInt(entity.getUrgencylevel()));
                            if (tbMsgConfigEntity != null) {
                                String sfzpsend = tbMsgConfigEntity.getSfzpsend();
                                if ("Y".equals(sfzpsend)) {
                                    String dbdj = StringUtil.getStrByUrgencylevel(entity.getUrgencylevel());
                                    String content = Constant.MSG_COMMON.replace("A", dbdj);
                                    content = content.replace("B", entity.getFinishdate());
                                    content = content.replace("C", entity.getTitle());
                                    // logger.info(content);
                                    if (StringUtil.isNotBlank(userids)) {
                                        String[] uid = userids.split(",");
                                        for (String uiidd : uid) {
                                            SysUserEntity userEntity = this.sysUserService.queryObject(Long.valueOf(uiidd));
                                            if (userEntity != null && StringUtil.isNotBlank(userEntity.getMobile())) {
                                                try {
                                                    String phones = userEntity.getMobile();
                                                    String[] res = MobileMsgEngine.getMobileMsgEngine().send2WebserviceExcode(phones, content, "");
                                                    if (res.length > 0) {
                                                        TbMsgLogEntity tbMsgLogEntity = new TbMsgLogEntity();
                                                        tbMsgLogEntity.setDocuuid(formDocId + "");
                                                        tbMsgLogEntity.setResult(res[1]);
                                                        tbMsgLogEntity.setSendtime(DateUtil.formatDateYYYY_MM_DD_HH_MM_SS(new Date()));
                                                        tbMsgLogEntity.setTouserid(uiidd);
                                                        tbMsgLogEntity.setTyp("ZHIPAI");
                                                        tbMsgLogEntity.setExt1(content);
                                                        tbMsgLogService.save(tbMsgLogEntity);
                                                    }
                                                    JPushUtils.sendSingle(uiidd, content, Long.parseLong("1"));
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                        }
                        return R.ok();
                    }
                }
            }
        }
        return R.error("操作失败!");
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

    @ResponseBody
    @RequestMapping("/dozhipai/{uuid}")
    @RequiresPermissions("tbfromdoc:save")
    public R dozhipai(@PathVariable("uuid") String uuid) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("docId", uuid);
        String userids = "";
        TbFromDocEntity entity = this.tbFromDocService.queryObjectByUUID(uuid);
        List<TbTempUserEntity> lists = this.tmpService.queryList(map);
        for (TbTempUserEntity tbTempUserEntity : lists) {
            HashMap map1 = new HashMap();
            map1.put("docId", entity.getFromDocId());
            map1.put("fromUserId", getUser().getUserId());
            map1.put("toUserId", tbTempUserEntity.getUserid());
            int countt = this.banliService.queryList4task(map1).size();
            if (countt > 0) {
                continue;
            }
            TbBanliEntity blEntity = new TbBanliEntity();
            blEntity.setDocId(entity.getFromDocId());
            blEntity.setFromUserId(getUser().getUserId() + "");
            blEntity.setToUserId(Long.valueOf(tbTempUserEntity.getUserid()));
            blEntity.setDoTime(DateUtil.format(new Date(), "yyyy-MM-dd HH:mm:ss"));
            blEntity.setDoType("3");//指派
            this.banliService.save(blEntity);
            SysUserEntity userEntity = this.sysUserService.queryObject(Long.valueOf(tbTempUserEntity.getUserid()));
            String name = userEntity.getXm();
            if ("陈亮".equals(name) || "张殿纪".equals(name) || "方显启".equals(name) || "耿成华".equals(name)) {
                logger.info(name + ", 是领导，忽略发短信！");
            } else {
                userids += tbTempUserEntity.getUserid() + ",";
            }
        }

        //查询当前紧急程度配置 决定是否发短信
        TbMsgConfigEntity tbMsgConfigEntity = tbMsgConfigService.queryObject(Integer.parseInt(entity.getUrgencylevel()));
        if (tbMsgConfigEntity != null) {
            String sfzpsend = tbMsgConfigEntity.getSfzpsend();
            if ("Y".equals(sfzpsend)) {
                String dbdj = StringUtil.getStrByUrgencylevel(entity.getUrgencylevel());
                String content = Constant.MSG_COMMON.replace("A", dbdj);
                content = content.replace("B", entity.getFinishdate());
                content = content.replace("C", entity.getTitle());
                // logger.info(content);
                if (StringUtil.isNotBlank(userids)) {
                    String[] uid = userids.split(",");
                    for (String uiidd : uid) {
                        SysUserEntity userEntity = this.sysUserService.queryObject(Long.valueOf(uiidd));
                        if (userEntity != null && StringUtil.isNotBlank(userEntity.getMobile())) {
                            try {
                                String phones = userEntity.getMobile();
                                String[] res = MobileMsgEngine.getMobileMsgEngine().send2WebserviceExcode(phones, content, "");
                                if (res.length > 0) {
                                    TbMsgLogEntity tbMsgLogEntity = new TbMsgLogEntity();
                                    tbMsgLogEntity.setDocuuid(entity.getFromDocId() + "");
                                    tbMsgLogEntity.setResult(res[1]);
                                    tbMsgLogEntity.setSendtime(DateUtil.formatDateYYYY_MM_DD_HH_MM_SS(new Date()));
                                    tbMsgLogEntity.setTouserid(uiidd);
                                    tbMsgLogEntity.setTyp("ZHIPAI");
                                    tbMsgLogEntity.setExt1(content);
                                    tbMsgLogService.save(tbMsgLogEntity);
                                }
                                JPushUtils.sendSingle(uiidd, content, Long.parseLong("1"));
                            } catch (Exception e) {
                                e.printStackTrace();
                                return R.error("发送失败， 请联系管理员！");
                            }
                        }
                    }
                }
            }
        }

        for (TbTempUserEntity tbTempUserEntity : lists) {
            this.tmpService.delete(tbTempUserEntity.getId());
        }

        return R.ok();
    }


    private Long[] getAttachIdsByDoc(String uuid) {
        Long[] attachIds = new Long[]{};
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("ywid", uuid);
        List<TbFileAttachEntity> list = this.tbFileAttachService.queryAll(map);
        for (int i = 0; i < list.size() - 1; i++) {
            TbFileAttachEntity entity = list.get(i);
            attachIds[i] = Long.valueOf(entity.getId());
        }
        logger.info(attachIds.length);
        return attachIds;
    }

    @ResponseBody
    @RequestMapping("/datasExport")
    @RequiresPermissions("tbfromdoc:update")
    public void partExport(HttpServletResponse response) throws IOException {

        Map<String, Object> map = new HashMap<String, Object>();

        List<TbFromDocEntity> tbFromDocList = this.tbFromDocService.queryList(map, "0");//获取业务数据集
        JSONArray ja = getJaFromList(tbFromDocList);
        Map<String, String> headMap = new LinkedHashMap<String, String>();
        headMap.put("subjectword", "主题词");
        headMap.put("title", "题名");
        headMap.put("filesequence", "序号");
        headMap.put("transactnumber", "办文编号");
        headMap.put("years", "年度");
        headMap.put("secretlevel", "密级");
        headMap.put("filetype", "文件类型");
        headMap.put("filenumber", "文号");
        headMap.put("urgencylevel", "紧急程度");
        headMap.put("fromdepartment", "来文机关");
        headMap.put("count", "文件份数");
        headMap.put("storageperiod", "保管期限");
        headMap.put("pagenumber", "页数");
        headMap.put("receiveddate", "收文时间");
        headMap.put("entityclassnumber", "实体分类号");
        headMap.put("finishdate", "完成时限");
        headMap.put("zhipai", "指派人");
        String title = "来文记录表";
        Date d2 = new Date();
        ExcelUtil.downloadExcelFile(title, headMap, ja, response);
        System.out.println("共" + tbFromDocList.size() + "条数据,执行" + (new Date().getTime() - d2.getTime()) + "ms");
    }

    private JSONArray getJaFromList(List<TbFromDocEntity> tbFromDocList) {
        JSONArray json = new JSONArray();
        for (TbFromDocEntity a : tbFromDocList) {
            JSONObject jo = new JSONObject();
            jo.put("subjectword", StringUtil.checkIsNull(a.getSubjectword()));
            jo.put("title", StringUtil.checkIsNull(a.getTitle()));
            jo.put("filesequence", StringUtil.checkIsNull(a.getFilesequence()));
            jo.put("transactnumber", StringUtil.checkIsNull(a.getTransactnumber()));
            jo.put("years", StringUtil.checkIsNull(a.getYears()));
            jo.put("secretlevel", StringUtil.checkIsNull(a.getSecretlevel()));
            jo.put("filetype", StringUtil.checkIsNull(a.getFiletype()));
            jo.put("filenumber", StringUtil.checkIsNull(a.getFilenumber()));
            jo.put("urgencylevel", StringUtil.checkIsNull(a.getUrgencylevel()));
            jo.put("fromdepartment", StringUtil.checkIsNull(a.getFromdepartment()));
            jo.put("count", StringUtil.checkIsNull(a.getCount()));
            jo.put("storageperiod", StringUtil.checkIsNull(a.getStorageperiod()));
            jo.put("pagenumber", StringUtil.checkIsNull(a.getPagenumber()));
            jo.put("receiveddate", StringUtil.checkIsNull(a.getReceiveddate()));
            jo.put("entityclassnumber", StringUtil.checkIsNull(a.getEntityclassnumber()));
            jo.put("finishdate", StringUtil.checkIsNull(a.getFinishdate()));

            jo.put("zhipai", StringUtil.checkIsNull(getZhipaiLishier(a.getFromDocId())));
            json.add(jo);
        }
        return json;
    }

    private String getZhipaiLishier(Long fromDocId) {
        String zps = "";
        Map<String, Object> map = new HashMap<String, Object>();
        TbFromDocEntity tbFromDocEntity = this.tbFromDocService.queryObject(fromDocId);
        if (StringUtil.isNotBlank(tbFromDocEntity.getUuid())) {
            map.put("uuid", tbFromDocEntity.getUuid());
        }
        List<SysUserEntity> userList = new ArrayList<SysUserEntity>();
        userList = sysUserService.queryList4zhipai(map);
        for (SysUserEntity sysUserEntity : userList) {
            zps += sysUserEntity.getXm() + ",";
        }
        if (StringUtil.isNotBlank(zps)) {
            zps = zps.substring(0, zps.length() - 1);
        }
        return zps;
    }

    @ResponseBody
    @RequestMapping("/checkQx")
    @RequiresPermissions("tbfromdoc:update")
    public R checkQx() {
        SysUserEntity sysUserEntity = getUser();
        if (sysUserEntity.getUserId() != 1L) {
            return R.error("当前操作人员无删除权限!");
        } else {
            return R.ok();
        }
    }

    /**
     * 打包压缩下载文件
     */
    @RequestMapping(value = "/downLoadZipFile/{uuid}")
    @RequiresPermissions("tbfromdoc:update")
    public void downLoadZipFile(HttpServletResponse response, @PathVariable String uuid) throws IOException {
        TbFromDocEntity entity = this.tbFromDocService.queryObjectByUUID(uuid);
        String zipFileName = entity.getTitle() + "--" + DateUtil.formatDateYYYYMMDDHHMMSS(new Date()) + ".zip";
        response.setContentType("APPLICATION/OCTET-STREAM");
        response.setHeader("Content-Disposition", "attachment; filename=" + zipFileName);
        ZipOutputStream out = new ZipOutputStream(response.getOutputStream());
        try {
            ZipUtils.doCompress("/bzfp/zxb/static_res/jyjuploadfiles/" + uuid + File.separator, out);
            response.flushBuffer();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }


}
