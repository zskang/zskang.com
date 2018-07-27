package com.framework.service;

import com.framework.entity.TbTextEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-15 08:31:10
 */
public interface TbTextService {
	
	TbTextEntity queryObject(Long id);
	
	List<TbTextEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TbTextEntity tbText);
	
	void update(TbTextEntity tbText);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
