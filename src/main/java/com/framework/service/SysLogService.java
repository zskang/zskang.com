package com.framework.service;

import com.framework.entity.SysLogEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-09-07 00:40:30
 */
public interface SysLogService {
	
	SysLogEntity queryObject(Integer id);
	
	List<SysLogEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(SysLogEntity sysLog);
	
	void update(SysLogEntity sysLog);
	
	void delete(Integer id);
	
	void deleteBatch(Integer[] ids);
}
