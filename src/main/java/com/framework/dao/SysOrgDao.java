package com.framework.dao;

import java.util.List;

import com.framework.entity.SysOrgEntity;

/**
 * 系统用户
 */
public interface SysOrgDao extends BaseDao<SysOrgEntity> {

	List<SysOrgEntity> queryChildOrgList(Long id);

	List<SysOrgEntity> queryAllOrgs();
	
}
