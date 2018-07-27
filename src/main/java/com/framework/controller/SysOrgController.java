package com.framework.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.framework.entity.SysOrgEntity;
import com.framework.service.SysOrgService;
import com.framework.utils.PageUtils;
import com.framework.utils.R;

/**
 * 组织机构管理
 */
@RestController
@RequestMapping("/sys/org")
public class SysOrgController extends AbstractController {

	@Autowired
	private SysOrgService sysOrgService;

	/**
	 * 选择菜单(添加、修改菜单)
	 */
	@RequestMapping("/select")
	public R select() {
		// 查询列表数据
		List<SysOrgEntity> orgsList = sysOrgService.queryAllOrgs();

		// 添加顶级菜单
		SysOrgEntity root = new SysOrgEntity();
		root.setId(0L);
		root.setName("绍康科技集团");
		root.setPId(-1L);
		root.setOpen(true);
		root.setOrderNum(0);
		orgsList.add(root);
		logger.info(orgsList.toString());
		return R.ok().put("orgsList", orgsList);
	}

	/**
	 * 所有用户列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("org:list")
	public R list(Integer page, Integer limit) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);

		// 查询列表数据
		List<SysOrgEntity> orgList = sysOrgService.queryList(map);
		int total = sysOrgService.queryTotal(map);

		PageUtils pageUtil = new PageUtils(orgList, total, limit, page);

		return R.ok().put("page", pageUtil);
	}

	/**
	 * 获取登录的用户信息
	 */
	@RequestMapping("/info")
	public R info() {
		return R.ok().put("user", getUser());
	}

	@RequestMapping("/info/{id}")
	@RequiresPermissions("org:info")
	public R info(@PathVariable("id") Long id) {
		SysOrgEntity org = sysOrgService.queryObject(id);
		return R.ok().put("org", org);
	}

	@RequestMapping("/getChildOrgList")
	public R getChildOrgList(@PathVariable("id") Long id) {
		List<SysOrgEntity> childOrgList = sysOrgService.queryChildOrgList(id);
		return R.ok().put("childOrgList", childOrgList);
	}

	/**
	 * 保存用户
	 */
	@RequestMapping("/save")
	@RequiresPermissions("org:save")
	public R save(@RequestBody SysOrgEntity org) {
		if (StringUtils.isBlank(org.getName())) {
			return R.error("组织机构名不能为空");
		}

		sysOrgService.save(org);
		return R.ok();
	}

	/**
	 * 修改用户
	 */
	@RequestMapping("/update")
	@RequiresPermissions("sys:user:update")
	public R update(@RequestBody SysOrgEntity org) {
		if (StringUtils.isBlank(org.getName())) {
			return R.error("组织机构名不能为空");
		}
		sysOrgService.update(org);
		return R.ok();
	}

	/**
	 * 删除用户
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("org:delete")
	public R delete(@RequestBody Long[] ids) {
		sysOrgService.deleteBatch(ids);
		return R.ok();
	}
}
