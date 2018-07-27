package com.framework.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.framework.dao.SysRoleMenuDao;
import com.framework.service.SysRoleMenuService;

/**
 * 角色与菜单对应关系实现类
 */
@Service("sysRoleMenuService")
public class SysRoleMenuServiceImpl implements SysRoleMenuService {
	@Autowired
	private SysRoleMenuDao sysRoleMenuDao;

	/**
	 * 根据角色ID和菜单ID列表，持久化角色与菜单对应关系
	 * @param roleId 角色ID
	 * @param menuIdList 菜单ID列表
	 */
	@Override
	@Transactional
	public void saveOrUpdate(Long roleId, List<Long> menuIdList) {
		if (menuIdList.size() == 0) {
			return;
		}
		// 先删除角色与菜单关系
		sysRoleMenuDao.delete(roleId);

		// 保存角色与菜单关系
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("roleId", roleId);
		map.put("menuIdList", menuIdList);
		sysRoleMenuDao.save(map);
	}

	/**
	 * 根据角色ID，获取菜单ID列表
	 * @param roleId 角色ID
	 * @return
	 */
	@Override
	public List<Long> queryMenuIdList(Long roleId) {
		return sysRoleMenuDao.queryMenuIdList(roleId);
	}
}
