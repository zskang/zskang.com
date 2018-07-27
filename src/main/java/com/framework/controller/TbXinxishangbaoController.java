package com.framework.controller;

import com.framework.entity.TbXinxishangbaoEntity;
import com.framework.service.TbXinxishangbaoService;
import com.framework.utils.PageUtils;
import com.framework.utils.R;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-13 13:06:56
 */
@Controller
@RequestMapping("tbxinxishangbao")
public class TbXinxishangbaoController {
	@Autowired
	private TbXinxishangbaoService tbXinxishangbaoService;
	
	@RequestMapping("/tbxinxishangbao.html")
	public String list(){
		return "tbxinxishangbao/tbxinxishangbao.html";
	}
	
	@RequestMapping("/tbxinxishangbao_add.html")
	public String add(){
		return "tbxinxishangbao/tbxinxishangbao_add.html";
	}

	@RequestMapping("/xxsb_attach.html")
	public String xxsb_attach() {
		return "tbxinxishangbao/xxsb_attach.html";
	}
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("tbxinxishangbao:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<TbXinxishangbaoEntity> tbXinxishangbaoList = tbXinxishangbaoService.queryList(map);
		int total = tbXinxishangbaoService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(tbXinxishangbaoList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("tbxinxishangbao:info")
	public R info(@PathVariable("id") Long id){
		TbXinxishangbaoEntity tbXinxishangbao = tbXinxishangbaoService.queryObject(id);
		
		return R.ok().put("tbXinxishangbao", tbXinxishangbao);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("tbxinxishangbao:save")
	public R save(@RequestBody TbXinxishangbaoEntity tbXinxishangbao){
		tbXinxishangbaoService.save(tbXinxishangbao);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("tbxinxishangbao:update")
	public R update(@RequestBody TbXinxishangbaoEntity tbXinxishangbao){
		tbXinxishangbaoService.update(tbXinxishangbao);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("tbxinxishangbao:delete")
	public R delete(@RequestBody Long[] ids){
		tbXinxishangbaoService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
