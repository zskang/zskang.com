package com.framework.controller;

import java.io.IOException;
import java.util.*;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.framework.entity.*;
import com.framework.entity.TbTextEntity;
import com.framework.utils.*;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;
import com.framework.service.TbTextService;
import com.framework.entity.TbTaskSendInfoEntity;
import com.framework.service.TbTaskSendInfoService;

import javax.servlet.http.HttpServletResponse;


/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-09-19 16:12:29
 */
@Controller
@RequestMapping("tbtasksendinfo")
public class TbTaskSendInfoController extends AbstractController{
	@Autowired
	private TbTaskSendInfoService tbTaskSendInfoService;

	@Autowired
	private TbTextService tbTextService;
	
	@RequestMapping("/tbtasksendinfo.html")
	public String list(){
		return "tbtasksendinfo/tbtasksendinfo.html";
	}
	
	@RequestMapping("/tbtasksendinfo_add.html")
	public String add(){
		return "tbtasksendinfo/tbtasksendinfo_add.html";
	}


	@RequestMapping("/tbtext.html")
	public String tbtext(){ return "tbtasksendinfo/tbtext.html"; }


	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list1/{type}/{userid}/{month}/{month1}")
	@RequiresPermissions("tbtext:list")
	public R list1(Integer page, Integer limit, @PathVariable String type,@PathVariable("userid") Long userid, @PathVariable String month, @PathVariable String month1) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		if (StringUtil.isNotBlank(month)&&StringUtil.isNotBlank(month1)&&!month.equals("null")&&!month1.equals("null")) {
			map.put("startmonth", month);
			map.put("endmonth", month1);
		}



		if (StringUtil.isNotBlank(type)) {
			map.put("type", type);
		}

		if (ObjectUtil.isNotNull(userid)) {
			map.put("userid", userid);
		}

		//查询列表数据
		List<TbTextEntity> tbTextList = tbTextService.queryList(map);
		int total = tbTextService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(tbTextList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}
	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("tbtasksendinfo:list")
	public R list(Integer page, Integer limit,String month,String month1){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		if (StringUtils.isNotBlank(month)) {

			map.put("startmonth", month);
		}

 		if (StringUtils.isNotBlank(month1)) {

			map.put("endmonth", month1);
		}
		//查询列表数据
		List<TbTaskSendInfoEntity> tbTaskSendInfoList = tbTaskSendInfoService.queryList(map);
		int total = tbTaskSendInfoService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(tbTaskSendInfoList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("tbtasksendinfo:info")
	public R info(@PathVariable("id") Long id){
		TbTaskSendInfoEntity tbTaskSendInfo = tbTaskSendInfoService.queryObject(id);
		
		return R.ok().put("tbTaskSendInfo", tbTaskSendInfo);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("tbtasksendinfo:save")
	public R save(@RequestBody TbTaskSendInfoEntity tbTaskSendInfo){
		tbTaskSendInfoService.save(tbTaskSendInfo);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("tbtasksendinfo:update")
	public R update(@RequestBody TbTaskSendInfoEntity tbTaskSendInfo){
		tbTaskSendInfoService.update(tbTaskSendInfo);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("tbtasksendinfo:delete")
	public R delete(@RequestBody Long[] ids){
		tbTaskSendInfoService.deleteBatch(ids);
		
		return R.ok();
	}

	@ResponseBody
	@RequestMapping("/totext")
	@RequiresPermissions("tbtasksendinfo:delete")
	public R totext(@RequestBody Long[] ids){
		tbTaskSendInfoService.deleteBatch(ids);

		return R.ok();
	}

	private JSONArray getJaFromList(List<TbTaskSendInfoEntity> tbFromDocList) {
		JSONArray json = new JSONArray();
		for (TbTaskSendInfoEntity a : tbFromDocList) {
			JSONObject jo = new JSONObject();
			jo.put("unitname", StringUtil.checkIsNull(a.getUnitname()));
			jo.put("staticname", StringUtil.checkIsNull(a.getStaticname()));
			jo.put("mryscount", StringUtil.checkIsNull(a.getMryscount().toString()));
			jo.put("mzywcount", StringUtil.checkIsNull(a.getMzywcount().toString()));

			json.add(jo);
		}
		return json;
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
///{month}/{month1}
	@ResponseBody
	@RequestMapping("/datasExport")
	@RequiresPermissions("tbfromdoc:update")
	public void partExport(HttpServletResponse response,String month,String month1
	) throws IOException {

		Map<String, Object> map = new HashMap<String, Object>();

		if (StringUtil.isNotBlank(month)&&StringUtil.isNotBlank(month1)&&!month.equals("null")&&!month1.equals("null")) {
			map.put("startmonth", month);
			map.put("endmonth", month1);
		}
		List<TbTaskSendInfoEntity> tbFromDocList = this.tbTaskSendInfoService.queryList(map);//获取业务数据集
		JSONArray ja = getJaFromList(tbFromDocList);
		Map<String, String> headMap = new LinkedHashMap<String, String>();
		headMap.put("unitname", "科室");
		headMap.put("staticname", "姓名");
		headMap.put("mryscount", "每日一事(个)");
		headMap.put("mzywcount", "每周一悟(个)");

		String title = "统计";
		Date d2 = new Date();
		ExcelUtil.downloadExcelFile(title, headMap, ja, response);
		System.out.println("共" + tbFromDocList.size() + "条数据,执行" + (new Date().getTime() - d2.getTime()) + "ms");
	}


}
