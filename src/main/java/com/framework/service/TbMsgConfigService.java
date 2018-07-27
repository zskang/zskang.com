package com.framework.service;

import com.framework.entity.TbMsgConfigEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-25 14:30:01
 */
public interface TbMsgConfigService {
	
	TbMsgConfigEntity queryObject(Integer id);
	
	List<TbMsgConfigEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TbMsgConfigEntity tbMsgConfig);
	
	void update(TbMsgConfigEntity tbMsgConfig);
	
	void delete(Integer id);
	
	void deleteBatch(Integer[] ids);
}
