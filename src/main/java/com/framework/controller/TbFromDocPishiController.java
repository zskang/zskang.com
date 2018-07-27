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

import com.framework.entity.TbFromDocPishiEntity;
import com.framework.service.TbFromDocPishiService;
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
@RequestMapping("tbfromdocpishi")
public class TbFromDocPishiController {
	@Autowired
	private TbFromDocPishiService tbFromDocPishiService;
	
	@RequestMapping("/tbfromdocpishi.html")
	public String list(){
		return "tbfromdocpishi/tbfromdocpishi.html";
	}
	
	@RequestMapping("/tbfromdocpishi_add.html")
	public String add(){
		return "tbfromdocpishi/tbfromdocpishi_add.html";
	}
	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("tbfromdocpishi:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<TbFromDocPishiEntity> tbFromDocPishiList = tbFromDocPishiService.queryList(map);
		int total = tbFromDocPishiService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(tbFromDocPishiList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("tbfromdocpishi:info")
	public R info(@PathVariable("id") Long id){
		TbFromDocPishiEntity tbFromDocPishi = tbFromDocPishiService.queryObject(id);
		
		return R.ok().put("tbFromDocPishi", tbFromDocPishi);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("tbfromdocpishi:save")
	public R save(@RequestBody TbFromDocPishiEntity tbFromDocPishi){
		tbFromDocPishiService.save(tbFromDocPishi);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("tbfromdocpishi:update")
	public R update(@RequestBody TbFromDocPishiEntity tbFromDocPishi){
		tbFromDocPishiService.update(tbFromDocPishi);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("tbfromdocpishi:delete")
	public R delete(@RequestBody Long[] ids){
		tbFromDocPishiService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
