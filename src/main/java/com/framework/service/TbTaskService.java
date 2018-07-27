package com.framework.service;

import com.framework.entity.TbTaskEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-09-18 15:44:38
 */
public interface TbTaskService {
	
	TbTaskEntity queryObject(Long id);
	
	List<TbTaskEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TbTaskEntity tbTask);
	
	void update(TbTaskEntity tbTask);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

}
