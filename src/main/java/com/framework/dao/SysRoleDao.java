package com.framework.dao;

import com.framework.entity.SysRoleEntity;

/**
 * 角色管理
 */
public interface SysRoleDao extends BaseDao<SysRoleEntity> {

	long getNextRoleId();

}
