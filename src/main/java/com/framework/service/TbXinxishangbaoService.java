package com.framework.service;

import com.framework.entity.TbXinxishangbaoEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-13 13:06:56
 */
public interface TbXinxishangbaoService {
	
	TbXinxishangbaoEntity queryObject(Long id);
	
	List<TbXinxishangbaoEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TbXinxishangbaoEntity tbXinxishangbao);
	
	void update(TbXinxishangbaoEntity tbXinxishangbao);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
