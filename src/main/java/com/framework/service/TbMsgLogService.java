package com.framework.service;

import com.framework.entity.TbMsgLogEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-22 21:50:50
 */
public interface TbMsgLogService {
	
	TbMsgLogEntity queryObject(Long id);
	
	List<TbMsgLogEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TbMsgLogEntity tbMsgLog);
	
	void update(TbMsgLogEntity tbMsgLog);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
