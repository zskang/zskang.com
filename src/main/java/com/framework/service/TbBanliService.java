package com.framework.service;

import com.framework.entity.TbBanliEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-05 11:38:18
 */
public interface TbBanliService {
	
	TbBanliEntity queryObject(Long id);
	
	List<TbBanliEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TbBanliEntity tbBanli);
	
	void update(TbBanliEntity tbBanli);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

	void deleteBatchBydocId(Long fromDocId);

    List<TbBanliEntity> queryList4task(Map<String, Object> map);

    List<TbBanliEntity> queryList2(Map<String, Object> map);

	int queryTotal2(Map<String, Object> map);

    void updateByMap(Map map);
}
