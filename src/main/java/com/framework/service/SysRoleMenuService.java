package com.framework.service;

import java.util.List;

/**
 * 角色与菜单对应关系
 */
public interface SysRoleMenuService {
	/**
	 * 根据角色ID和菜单ID列表，持久化角色与菜单对应关系
	 * @param roleId 角色ID
	 * @param menuIdList 菜单ID列表
	 */
	void saveOrUpdate(Long roleId, List<Long> menuIdList);

	/**
	 * 根据角色ID，获取菜单ID列表
	 * @param roleId 角色ID
	 * @return
	 */
	List<Long> queryMenuIdList(Long roleId);
}
