package com.framework.service;

import com.framework.entity.TbFileAttachEntity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-03 09:06:47
 */
public interface TbFileAttachService {
	
	TbFileAttachEntity queryObject(Integer id);
	
	List<TbFileAttachEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TbFileAttachEntity tbFileAttach);
	
	void update(TbFileAttachEntity tbFileAttach);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

	List<TbFileAttachEntity> queryAll(HashMap<String, Object> map);

	void deleteBatchByUUID(String uuid);
}
