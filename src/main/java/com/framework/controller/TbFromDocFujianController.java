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

import com.framework.entity.TbFromDocFujianEntity;
import com.framework.service.TbFromDocFujianService;
import com.framework.utils.PageUtils;
import com.framework.utils.R;


/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-04 10:56:24
 */
@Controller
@RequestMapping("tbfromdocfujian")
public class TbFromDocFujianController {
	@Autowired
	private TbFromDocFujianService tbFromDocFujianService;
	
	@RequestMapping("/tbfromdocfujian.html")
	public String list(){
		return "tbfromdocfujian/tbfromdocfujian.html";
	}
	
	@RequestMapping("/tbfromdocfujian_add.html")
	public String add(){
		return "tbfromdocfujian/tbfromdocfujian_add.html";
	}
	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("tbfromdocfujian:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<TbFromDocFujianEntity> tbFromDocFujianList = tbFromDocFujianService.queryList(map);
		int total = tbFromDocFujianService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(tbFromDocFujianList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("tbfromdocfujian:info")
	public R info(@PathVariable("id") Long id){
		TbFromDocFujianEntity tbFromDocFujian = tbFromDocFujianService.queryObject(id);
		
		return R.ok().put("tbFromDocFujian", tbFromDocFujian);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("tbfromdocfujian:save")
	public R save(@RequestBody TbFromDocFujianEntity tbFromDocFujian){
		tbFromDocFujianService.save(tbFromDocFujian);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("tbfromdocfujian:update")
	public R update(@RequestBody TbFromDocFujianEntity tbFromDocFujian){
		tbFromDocFujianService.update(tbFromDocFujian);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("tbfromdocfujian:delete")
	public R delete(@RequestBody Long[] ids){
		tbFromDocFujianService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
