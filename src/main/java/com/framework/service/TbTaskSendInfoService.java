package com.framework.service;

import com.framework.entity.TbTaskSendInfoEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-09-19 16:12:29
 */
public interface TbTaskSendInfoService {
	
	TbTaskSendInfoEntity queryObject(Long id);
	
	List<TbTaskSendInfoEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TbTaskSendInfoEntity tbTaskSendInfo);
	
	void update(TbTaskSendInfoEntity tbTaskSendInfo);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
