package com.framework.dao;

import com.framework.entity.SysUserEntity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 系统用户
 */
public interface SysUserDao extends BaseDao<SysUserEntity> {
	/**
	 * 查询用户的所有权限
	 * @param userId 用户ID
	 */
	List<String> queryAllPerms(Long userId);

	/**
	 * 查询用户的所有菜单ID
	 */
	List<Long> queryAllMenuId(Long userId);

	/**
	 * 根据用户名，查询系统用户
	 */
	SysUserEntity queryByUserName(String username);

	/**
	 * 修改密码
	 */
	int updatePassword(Map<String, Object> map);

	List<SysUserEntity> queryLds();

	SysUserEntity getKeZhang(HashMap<String, Object> map);

	SysUserEntity queryObjectByName(Map<String, Object> maps);

    List<SysUserEntity> queryList4zhipai(Map<String, Object> map);

	int queryTotal4zhipai(Map<String, Object> map);
}
