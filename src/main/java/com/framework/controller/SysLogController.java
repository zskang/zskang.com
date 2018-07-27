package com.framework.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.framework.entity.SysLogEntity;
import com.framework.service.SysLogService;
import com.framework.utils.PageUtils;
import com.framework.utils.R;


/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-09-07 00:40:30
 */
@Controller
@RequestMapping("syslog")
public class SysLogController {
	@Autowired
	private SysLogService sysLogService;
	
	@RequestMapping("/syslog.html")
	public String list(){
		return "syslog/syslog.html";
	}
	
	@RequestMapping("/syslog_add.html")
	public String add(){
		return "syslog/syslog_add.html";
	}
	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("syslog:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<SysLogEntity> sysLogList = sysLogService.queryList(map);
		int total = sysLogService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(sysLogList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("syslog:info")
	public R info(@PathVariable("id") Integer id){
		SysLogEntity sysLog = sysLogService.queryObject(id);
		
		return R.ok().put("sysLog", sysLog);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("syslog:save")
	public R save(@RequestBody SysLogEntity sysLog){
		sysLogService.save(sysLog);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("syslog:update")
	public R update(@RequestBody SysLogEntity sysLog){
		sysLogService.update(sysLog);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("syslog:delete")
	public R delete(@RequestBody Integer[] ids){
		sysLogService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
