package com.framework.service;

import com.framework.entity.SysNoticeEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-06-30 19:46:28
 */
public interface SysNoticeService {
	
	SysNoticeEntity queryObject(Integer id);
	
	List<SysNoticeEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(SysNoticeEntity sysNotice);
	
	void update(SysNoticeEntity sysNotice);
	
	void delete(Integer id);
	
	void deleteBatch(Integer[] ids);
}
