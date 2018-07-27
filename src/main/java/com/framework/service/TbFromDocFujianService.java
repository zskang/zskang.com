package com.framework.service;

import com.framework.entity.TbFromDocFujianEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-04 10:56:24
 */
public interface TbFromDocFujianService {
	
	TbFromDocFujianEntity queryObject(Long id);
	
	List<TbFromDocFujianEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TbFromDocFujianEntity tbFromDocFujian);
	
	void update(TbFromDocFujianEntity tbFromDocFujian);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
