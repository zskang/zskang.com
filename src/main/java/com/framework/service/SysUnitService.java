package com.framework.service;

import com.framework.entity.SysUnitEntity;

import java.util.List;
import java.util.Map;

/**
 * 系统机构表
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-06-30 19:25:19
 */
public interface SysUnitService {
	
	SysUnitEntity queryObject(Long id);
	
	List<SysUnitEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(SysUnitEntity sysUnit);
	
	void update(SysUnitEntity sysUnit);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

}
