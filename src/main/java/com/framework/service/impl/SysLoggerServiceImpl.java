package com.framework.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.framework.dao.SysLoggerDao;
import com.framework.entity.SysLoggerEntity;
import com.framework.service.SysLoggerService;



@Service("sysLoggerService")
public class SysLoggerServiceImpl implements SysLoggerService {
	@Autowired
	private SysLoggerDao sysLoggerDao;
	
	@Override
	public SysLoggerEntity queryObject(Integer id){
		return sysLoggerDao.queryObject(id);
	}
	
	@Override
	public List<SysLoggerEntity> queryList(Map<String, Object> map){
		return sysLoggerDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return sysLoggerDao.queryTotal(map);
	}
	
	@Override
	public void save(SysLoggerEntity sysLogger){
		sysLoggerDao.save(sysLogger);
	}
	
	@Override
	public void update(SysLoggerEntity sysLogger){
		sysLoggerDao.update(sysLogger);
	}
	
	@Override
	public void delete(Integer id){
		sysLoggerDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Integer[] ids){
		sysLoggerDao.deleteBatch(ids);
	}
	
}
