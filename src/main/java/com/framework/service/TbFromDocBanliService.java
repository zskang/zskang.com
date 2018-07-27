package com.framework.service;

import com.framework.entity.TbFromDocBanliEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-04 10:56:24
 */
public interface TbFromDocBanliService {
	
	TbFromDocBanliEntity queryObject(Long id);
	
	List<TbFromDocBanliEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TbFromDocBanliEntity tbFromDocBanli);
	
	void update(TbFromDocBanliEntity tbFromDocBanli);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
