package com.framework.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.framework.dao.SysUnitDao;
import com.framework.entity.SysUnitEntity;
import com.framework.service.SysUnitService;



@Service("sysUnitService")
public class SysUnitServiceImpl implements SysUnitService {
	@Autowired
	private SysUnitDao sysUnitDao;
	
	@Override
	public SysUnitEntity queryObject(Long id){
		return sysUnitDao.queryObject(id);
	}
	
	@Override
	public List<SysUnitEntity> queryList(Map<String, Object> map){
		return sysUnitDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return sysUnitDao.queryTotal(map);
	}
	
	@Override
	public void save(SysUnitEntity sysUnit){
		sysUnitDao.save(sysUnit);
	}
	
	@Override
	public void update(SysUnitEntity sysUnit){
		sysUnitDao.update(sysUnit);
	}
	
	@Override
	public void delete(Long id){
		sysUnitDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		sysUnitDao.deleteBatch(ids);
	}
	
}
