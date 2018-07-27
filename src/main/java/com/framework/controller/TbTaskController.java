package com.framework.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.framework.entity.TbTaskSendEntity;
import com.framework.utils.StringUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.framework.entity.TbTaskEntity;
import com.framework.service.TbTaskService;
import com.framework.utils.PageUtils;
import com.framework.utils.R;
import com.framework.service.TbTaskSendService;

/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-09-18 15:44:38
 */
@Controller
@RequestMapping("tbtask")
public class TbTaskController {
	@Autowired
	private TbTaskService tbTaskService;

	@Autowired
	private TbTaskSendService tbTaskSendService;
	
	@RequestMapping("/tbtask.html")
	public String list(){
		return "tbtask/tbtask.html";
	}
	
	@RequestMapping("/tbtask_add.html")
	public String add(){
		return "tbtask/tbtask_add.html";
	}

	@RequestMapping("/xxsb_attach.html")
	public String xxsb_attach() {
		return "tbtask/xxsb_attach.html";
	}

	@RequestMapping("/taskhuizhi.html")
	public String zhipai() {
		return "tbtask/huizhi.html";
	}
	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("tbtask:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<TbTaskEntity> tbTaskList = tbTaskService.queryList(map);
		int total = tbTaskService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(tbTaskList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}


	/**
	 * 回执
	 */
	@ResponseBody
	@RequestMapping("/huizhi/{id}")
	@RequiresPermissions("tbtask:info")
	public R huizhi(Integer page, Integer limit,@PathVariable("id") Long id){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

//		if (StringUtil.isNotBlank(id)) {
			map.put("taskid", id);
//		}
		//查询列表数据
		List<TbTaskSendEntity> tbTaskSendList = tbTaskSendService.queryList(map);
		int total = tbTaskSendService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(tbTaskSendList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}


	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("tbtask:info")
	public R info(@PathVariable("id") Long id){
		TbTaskEntity tbTask = tbTaskService.queryObject(id);
		
		return R.ok().put("tbTask", tbTask);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("tbtask:save")
	public R save(@RequestBody TbTaskEntity tbTask){
		tbTaskService.save(tbTask);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("tbtask:update")
	public R update(@RequestBody TbTaskEntity tbTask){
		tbTaskService.update(tbTask);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("tbtask:delete")
	public R delete(@RequestBody Long[] ids){
		tbTaskService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
