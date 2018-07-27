package com.framework.service;

import com.framework.entity.TbFromDocPishiEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-04 10:56:24
 */
public interface TbFromDocPishiService {
	
	TbFromDocPishiEntity queryObject(Long id);
	
	List<TbFromDocPishiEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TbFromDocPishiEntity tbFromDocPishi);
	
	void update(TbFromDocPishiEntity tbFromDocPishi);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

	void deleteBatchBy(Long fromDocId);
}
