package com.framework.service;

import com.framework.entity.TbTaskSendEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-09-19 12:48:24
 */
public interface TbTaskSendService {
	
	TbTaskSendEntity queryObject(Long id);
	
	List<TbTaskSendEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TbTaskSendEntity tbTaskSend);
	
	void update(TbTaskSendEntity tbTaskSend);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
