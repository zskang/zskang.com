package com.framework.service;

import com.framework.entity.TbFromUnitEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-01 10:00:12
 */
public interface TbFromUnitService {
	
	TbFromUnitEntity queryObject(Integer id);
	
	List<TbFromUnitEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TbFromUnitEntity tbFromUnit);
	
	void update(TbFromUnitEntity tbFromUnit);
	
	void delete(Integer id);
	
	void deleteBatch(Integer[] ids);
}
