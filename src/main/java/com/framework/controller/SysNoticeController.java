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

import com.framework.entity.SysNoticeEntity;
import com.framework.service.SysNoticeService;
import com.framework.utils.PageUtils;
import com.framework.utils.R;


/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-06-30 19:46:28
 */
@Controller
@RequestMapping("sysnotice")
public class SysNoticeController {
	@Autowired
	private SysNoticeService sysNoticeService;
	
	@RequestMapping("/sysnotice.html")
	public String list(){
		return "sysnotice/sysnotice.html";
	}
	
	@RequestMapping("/sysnotice_add.html")
	public String add(){
		return "sysnotice/sysnotice_add.html";
	}
	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("sysnotice:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<SysNoticeEntity> sysNoticeList = sysNoticeService.queryList(map);
		int total = sysNoticeService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(sysNoticeList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("sysnotice:info")
	public R info(@PathVariable("id") Integer id){
		SysNoticeEntity sysNotice = sysNoticeService.queryObject(id);
		
		return R.ok().put("sysNotice", sysNotice);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("sysnotice:save")
	public R save(@RequestBody SysNoticeEntity sysNotice){
		sysNoticeService.save(sysNotice);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("sysnotice:update")
	public R update(@RequestBody SysNoticeEntity sysNotice){
		sysNoticeService.update(sysNotice);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("sysnotice:delete")
	public R delete(@RequestBody Integer[] ids){
		sysNoticeService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
