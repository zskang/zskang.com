package com.framework.service;

import com.framework.entity.TbSendDocEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-08-10 15:50:32
 */
public interface TbSendDocService {
	
	TbSendDocEntity queryObject(Long id);
	
	List<TbSendDocEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TbSendDocEntity tbSendDoc);
	
	void update(TbSendDocEntity tbSendDoc);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

    String queryMaxRegistNumber(Map<String, Object> map);
}
