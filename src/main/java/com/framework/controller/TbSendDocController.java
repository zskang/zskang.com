package com.framework.controller;

import java.io.IOException;
import java.util.*;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.framework.entity.SysUserEntity;
import com.framework.entity.TbFromDocEntity;
import com.framework.utils.*;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.framework.entity.TbSendDocEntity;
import com.framework.service.TbSendDocService;

import javax.servlet.http.HttpServletResponse;


/**
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-08-10 15:50:32
 */
@Controller
@RequestMapping("tbsenddoc")
public class TbSendDocController extends AbstractController {
    @Autowired
    private TbSendDocService tbSendDocService;

    @RequestMapping("/tbsenddoc.html")
    public String list() {
        return "tbsenddoc/tbsenddoc.html";
    }

    @RequestMapping("/tbsenddoc_add.html")
    public String add() {
        return "tbsenddoc/tbsenddoc_add.html";
    }


    @RequestMapping("/tbsenddoc_detail.html")
    public String detail() {
        return "tbsenddoc/tbsenddoc_detail.html";
    }


    @RequestMapping("/tbsenddoc_fuckall.html")
    public String fuckall() {
        return "tbsenddoc/tbsenddoc_fuckall.html";
    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("tbsenddoc:list")
    public R list(Integer page, Integer limit, String wh, String tm) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        //查询列表数据
        if (StringUtils.isNotBlank(wh)) {
            String wh1 = com.framework.utils.Escape.unescape(wh);
            map.put("wh", "%" + wh1 + "%");
        }
        if (StringUtils.isNotBlank(tm)) {
            String tm1 = com.framework.utils.Escape.unescape(tm);
            map.put("tm", "%" + tm1 + "%");
        }
        List<TbSendDocEntity> tbSendDocList = tbSendDocService.queryList(map);
        int total = tbSendDocService.queryTotal(map);
        PageUtils pageUtil = new PageUtils(tbSendDocList, total, limit, page);
        return R.ok().put("page", pageUtil);
    }

    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("tbsenddoc:info")
    public R info(@PathVariable("id") Long id) {
        TbSendDocEntity tbSendDoc = tbSendDocService.queryObject(id);

        return R.ok().put("tbSendDoc", tbSendDoc);
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
            if (num_ > 10 && num_ < 100) {
                destNum = "0" + num_;
            }
        }
        return destNum;
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("tbsenddoc:save")
    public R save(@RequestBody TbSendDocEntity tbSendDoc) {
        tbSendDoc.setCreatetime(DateUtil.formatDateYYYY_MM_DD_HH_MM_SS(new Date()));
        tbSendDoc.setCreator(getUser().getUserId() + "");
        tbSendDoc.setUnitid(getUser().getUnitid() + "");
        tbSendDoc.setStatus("已保存");

        if (StringUtil.isBlank(tbSendDoc.getWh())) {
            return R.error("文号不能为空！");
        }
        if (StringUtil.isBlank(tbSendDoc.getFwsj())) {
            return R.error("发文时间不能为空！");
        }
        if (StringUtil.isBlank(tbSendDoc.getDjsj())) {
            return R.error("登记时间不能为空！");
        }
        if (StringUtil.isBlank(tbSendDoc.getDjh())) {
            return R.error("序号不能为空！");
        }
        if (StringUtil.isBlank(tbSendDoc.getTiming())) {
            return R.error("题名不能为空！");
        }
        if (StringUtil.isBlank(tbSendDoc.getZrz())) {
            return R.error("责任者不能为空！");
        }
        if (StringUtil.isBlank(tbSendDoc.getQfr())) {
            return R.error("签发人不能为空！");
        }
        if (StringUtil.isBlank(tbSendDoc.getBgqx())) {
            return R.error("保管期限不能为空！");
        }

        tbSendDocService.save(tbSendDoc);

        return R.ok();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("tbsenddoc:update")
    public R update(@RequestBody TbSendDocEntity tbSendDoc) {

        if (StringUtil.isBlank(tbSendDoc.getWh())) {
            return R.error("文号不能为空！");
        }
        if (StringUtil.isBlank(tbSendDoc.getFwsj())) {
            return R.error("发文时间不能为空！");
        }
        if (StringUtil.isBlank(tbSendDoc.getDjsj())) {
            return R.error("登记时间不能为空！");
        }
        if (StringUtil.isBlank(tbSendDoc.getDjh())) {
            return R.error("序号不能为空！");
        }
        if (StringUtil.isBlank(tbSendDoc.getTiming())) {
            return R.error("题名不能为空！");
        }
        if (StringUtil.isBlank(tbSendDoc.getZrz())) {
            return R.error("责任者不能为空！");
        }
        if (StringUtil.isBlank(tbSendDoc.getQfr())) {
            return R.error("签发人不能为空！");
        }
        if (StringUtil.isBlank(tbSendDoc.getBgqx())) {
            return R.error("保管期限不能为空！");
        }

        tbSendDocService.update(tbSendDoc);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("tbsenddoc:delete")
    public R delete(@RequestBody Long[] ids) {
        tbSendDocService.deleteBatch(ids);
        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/ddd/{doctype}")
    @RequiresPermissions("tbsenddoc:list")
    public R getXh(@PathVariable String doctype) {
        Calendar c = Calendar.getInstance(TimeZone.getTimeZone("GMT+08:00"));
        int year = c.get(Calendar.YEAR);    //获取年
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("nd", year);
        map.put("doctype", doctype);
        String xh = AddOne4registNumber(this.tbSendDocService.queryMaxRegistNumber(map));
        return R.ok().put("msg", xh);
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete1")
    @RequiresPermissions("tbsenddoc:delete")
    public R delete(@RequestBody long id) {
        tbSendDocService.delete(id);
        return R.ok();
    }

    @ResponseBody
    @RequestMapping("/datasExport")
    @RequiresPermissions("tbfromdoc:update")
    public void partExport(HttpServletResponse response) throws IOException {
        Map<String, Object> map = new HashMap<String, Object>();
        List<TbSendDocEntity> tbSendDocList = this.tbSendDocService.queryList(map);//获取业务数据集
        JSONArray ja = getJaFromList(tbSendDocList);
        Map<String, String> headMap = new LinkedHashMap<String, String>();
        headMap.put("nd", "年度");
        headMap.put("fwsj", "发文时间");
        headMap.put("wh", "文号");
        headMap.put("timing", "题名");
        headMap.put("zrz", "责任人");
        headMap.put("qfr", "签发人");
        headMap.put("bgqx", "保管期限");
        String title = "发文记录表";
        Date d2 = new Date();
        ExcelUtil.downloadExcelFile(title, headMap, ja, response);
        System.out.println("共" + tbSendDocList.size() + "条数据,执行" + (new Date().getTime() - d2.getTime()) + "ms");
    }

    private JSONArray getJaFromList(List<TbSendDocEntity> tbFromDocList) {
        JSONArray json = new JSONArray();
        for (TbSendDocEntity a : tbFromDocList) {
            JSONObject jo = new JSONObject();
            jo.put("nd", StringUtil.checkIsNull(a.getNd()));
            jo.put("fwsj", StringUtil.checkIsNull(a.getFwsj()));
            jo.put("wh", StringUtil.checkIsNull(a.getWh()));
            jo.put("timing", StringUtil.checkIsNull(a.getTiming()));
            jo.put("zrz", StringUtil.checkIsNull(a.getZrz()));
            jo.put("qfr", StringUtil.checkIsNull(a.getQfr()));
            jo.put("bgqx", StringUtil.checkIsNull(a.getBgqx()));
            json.add(jo);
        }
        return json;
    }
}
