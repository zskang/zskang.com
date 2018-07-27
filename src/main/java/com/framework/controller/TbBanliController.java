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

import com.framework.entity.TbBanliEntity;
import com.framework.service.TbBanliService;
import com.framework.utils.PageUtils;
import com.framework.utils.R;


/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-05 11:38:18
 */
@Controller
@RequestMapping("tbbanli")
public class TbBanliController {
	@Autowired
	private TbBanliService tbBanliService;
	
	@RequestMapping("/tbbanli.html")
	public String list(){
		return "tbbanli/tbbanli.html";
	}
	
	@RequestMapping("/tbbanli_add.html")
	public String add(){
		return "tbbanli/tbbanli_add.html";
	}
	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("tbbanli:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<TbBanliEntity> tbBanliList = tbBanliService.queryList(map);
		int total = tbBanliService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(tbBanliList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("tbbanli:info")
	public R info(@PathVariable("id") Long id){
		TbBanliEntity tbBanli = tbBanliService.queryObject(id);
		
		return R.ok().put("tbBanli", tbBanli);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("tbbanli:save")
	public R save(@RequestBody TbBanliEntity tbBanli){
		tbBanliService.save(tbBanli);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("tbbanli:update")
	public R update(@RequestBody TbBanliEntity tbBanli){
		tbBanliService.update(tbBanli);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("tbbanli:delete")
	public R delete(@RequestBody Long[] ids){
		tbBanliService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
