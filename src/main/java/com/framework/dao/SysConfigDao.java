package com.framework.dao;

import org.apache.ibatis.annotations.Param;

import com.framework.entity.SysConfigEntity;

import java.util.Map;

/**
 * 系统配置信息
 */
public interface SysConfigDao extends BaseDao<SysConfigEntity> {
	/**
	 * 根据key，查询value
	 */
	String queryByKey(String paramKey);

	/**
	 * 根据key，更新value
	 */
	int updateValueByKey(@Param("key") String key, @Param("value") String value);

	SysConfigEntity getEntityByParams(Map<String, Object> mp);
}
