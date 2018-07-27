package com.framework.service;

import java.util.List;
import java.util.Map;

import com.framework.entity.SysOrgEntity;

/**
 * 系统用户
 */
public interface SysOrgService {

	/**
	 * 根据 ID，查询信息
	 * 
	 * @param userId
	 * @return
	 */
	SysOrgEntity queryObject(Long userId);

	/**
	 * 查询 列表
	 */
	List<SysOrgEntity> queryList(Map<String, Object> map);

	/**
	 * 查询总数
	 */
	int queryTotal(Map<String, Object> map);

	/**
	 * 保存
	 */
	void save(SysOrgEntity org);

	/**
	 * 修改
	 */
	void update(SysOrgEntity user);

	/**
	 * 删除
	 */
	void deleteBatch(Long[] userIds);

	/**
	 * 根据parentid 获取当前机构下的子机构信息
	 * 
	 * @param id
	 *            用户ID
	 */
	List<SysOrgEntity> queryChildOrgList(Long id);

	List<SysOrgEntity> queryAllOrgs();
}
