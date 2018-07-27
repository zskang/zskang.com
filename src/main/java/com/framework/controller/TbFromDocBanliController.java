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

import com.framework.entity.TbFromDocBanliEntity;
import com.framework.service.TbFromDocBanliService;
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
@RequestMapping("tbfromdocbanli")
public class TbFromDocBanliController {
	@Autowired
	private TbFromDocBanliService tbFromDocBanliService;
	
	@RequestMapping("/tbfromdocbanli.html")
	public String list(){
		return "tbfromdocbanli/tbfromdocbanli.html";
	}
	
	@RequestMapping("/tbfromdocbanli_add.html")
	public String add(){
		return "tbfromdocbanli/tbfromdocbanli_add.html";
	}
	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("tbfromdocbanli:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<TbFromDocBanliEntity> tbFromDocBanliList = tbFromDocBanliService.queryList(map);
		int total = tbFromDocBanliService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(tbFromDocBanliList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("tbfromdocbanli:info")
	public R info(@PathVariable("id") Long id){
		TbFromDocBanliEntity tbFromDocBanli = tbFromDocBanliService.queryObject(id);
		
		return R.ok().put("tbFromDocBanli", tbFromDocBanli);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("tbfromdocbanli:save")
	public R save(@RequestBody TbFromDocBanliEntity tbFromDocBanli){
		tbFromDocBanliService.save(tbFromDocBanli);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("tbfromdocbanli:update")
	public R update(@RequestBody TbFromDocBanliEntity tbFromDocBanli){
		tbFromDocBanliService.update(tbFromDocBanli);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("tbfromdocbanli:delete")
	public R delete(@RequestBody Long[] ids){
		tbFromDocBanliService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
