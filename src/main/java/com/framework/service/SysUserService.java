package com.framework.service;

import com.framework.entity.SysUserEntity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 系统用户
 */
public interface SysUserService {
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
	 * 根据用户ID，查询用户
	 * @param userId
	 * @return
	 */
	SysUserEntity queryObject(Long userId);

	/**
	 * 查询用户列表
	 */
	List<SysUserEntity> queryList(Map<String, Object> map);

	/**
	 * 查询总数
	 */
	int queryTotal(Map<String, Object> map);

	/**
	 * 保存用户
	 */
	long save(SysUserEntity user);

	/**
	 * 修改用户
	 */
	void update(SysUserEntity user);

	/**
	 * 删除用户
	 */
	void deleteBatch(Long[] userIds);

	/**
	 * 修改密码
	 * @param userId 用户ID
	 * @param password 原密码
	 * @param newPassword 新密码
	 */
	int updatePassword(Long userId, String password, String newPassword);

	List<SysUserEntity> queryLds();

	Long getKeZhang(HashMap<String, Object> map);

    Long queryObjectByName(Map<String, Object> maps);

    List<SysUserEntity> queryList4zhipai(Map<String, Object> map);

	int queryTotal4zhipai(Map<String, Object> map);
}
