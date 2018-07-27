package com.framework.service;

import com.framework.entity.SysLoggerEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-02 23:13:37
 */
public interface SysLoggerService {
	
	SysLoggerEntity queryObject(Integer id);
	
	List<SysLoggerEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(SysLoggerEntity sysLogger);
	
	void update(SysLoggerEntity sysLogger);
	
	void delete(Integer id);
	
	void deleteBatch(Integer[] ids);
}
