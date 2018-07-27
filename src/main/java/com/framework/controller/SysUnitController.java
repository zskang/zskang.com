package com.framework.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.framework.entity.SysRoleEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.framework.entity.SysUnitEntity;
import com.framework.service.SysUnitService;
import com.framework.utils.PageUtils;
import com.framework.utils.R;


/**
 * 系统机构表
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-06-30 19:25:19
 */
@Controller
@RequestMapping("sysunit")
public class SysUnitController {
	@Autowired
	private SysUnitService sysUnitService;
	
	@RequestMapping("/sysunit.html")
	public String list(){
		return "sysunit/sysunit.html";
	}
	
	@RequestMapping("/sysunit_add.html")
	public String add(){
		return "sysunit/sysunit_add.html";
	}
	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("sysunit:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<SysUnitEntity> sysUnitList = sysUnitService.queryList(map);
		int total = sysUnitService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(sysUnitList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}

	@RequestMapping("/select")
	public R select() {
		// 查询列表数据
		List<SysUnitEntity> list = sysUnitService.queryList(new HashMap<String, Object>());

		return R.ok().put("list", list);
	}
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("sysunit:info")
	public R info(@PathVariable("id") Long id){
		SysUnitEntity sysUnit = sysUnitService.queryObject(id);
		
		return R.ok().put("sysUnit", sysUnit);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("sysunit:save")
	public R save(@RequestBody SysUnitEntity sysUnit){
		sysUnitService.save(sysUnit);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("sysunit:update")
	public R update(@RequestBody SysUnitEntity sysUnit){
		sysUnitService.update(sysUnit);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("sysunit:delete")
	public R delete(@RequestBody Long[] ids){
		sysUnitService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
