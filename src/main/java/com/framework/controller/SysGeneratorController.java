package com.framework.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.velocity.exception.ParseErrorException;
import org.apache.velocity.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.framework.service.SysGeneratorService;
import com.framework.utils.PageUtils;
import com.framework.utils.R;

/**
 * 代码生成器
 */
@Controller
@RequestMapping("/sys/generator")
public class SysGeneratorController {
	@Autowired
	private SysGeneratorService sysGeneratorService;

	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("sys:generator:list")
	public R list(String tableName, Integer page, Integer limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tableName", tableName);
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		// 查询列表数据
		List<Map<String, Object>> list = sysGeneratorService.queryList(map);
		int total = sysGeneratorService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(list, total, limit, page);

		return R.ok().put("page", pageUtil);
	}

	/**
	 * 生成代码
	 * 
	 * @throws Exception
	 * @throws ParseErrorException
	 * @throws ResourceNotFoundException
	 */
	@RequestMapping("/code")
	@RequiresPermissions("sys:generator:code")
	public void code(String tables, HttpServletResponse response)
			throws ResourceNotFoundException, ParseErrorException, Exception {
		String[] tableNames = new String[] {};
		tableNames = JSON.parseArray(tables).toArray(tableNames);

		byte[] data = sysGeneratorService.generatorCode(tableNames);

		response.reset();
		response.setHeader("Content-Disposition", "attachment; filename=\"zskangframework.zip\"");
		response.addHeader("Content-Length", "" + data.length);
		response.setContentType("application/octet-stream; charset=UTF-8");

		IOUtils.write(data, response.getOutputStream());
	}
}
