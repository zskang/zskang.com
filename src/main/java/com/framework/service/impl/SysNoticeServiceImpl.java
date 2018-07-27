package com.framework.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.framework.dao.SysNoticeDao;
import com.framework.entity.SysNoticeEntity;
import com.framework.service.SysNoticeService;



@Service("sysNoticeService")
public class SysNoticeServiceImpl implements SysNoticeService {
	@Autowired
	private SysNoticeDao sysNoticeDao;
	
	@Override
	public SysNoticeEntity queryObject(Integer id){
		return sysNoticeDao.queryObject(id);
	}
	
	@Override
	public List<SysNoticeEntity> queryList(Map<String, Object> map){
		return sysNoticeDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return sysNoticeDao.queryTotal(map);
	}
	
	@Override
	public void save(SysNoticeEntity sysNotice){
		sysNoticeDao.save(sysNotice);
	}
	
	@Override
	public void update(SysNoticeEntity sysNotice){
		sysNoticeDao.update(sysNotice);
	}
	
	@Override
	public void delete(Integer id){
		sysNoticeDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Integer[] ids){
		sysNoticeDao.deleteBatch(ids);
	}
	
}
