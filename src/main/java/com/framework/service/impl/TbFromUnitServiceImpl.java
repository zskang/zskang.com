package com.framework.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.framework.dao.TbFromUnitDao;
import com.framework.entity.TbFromUnitEntity;
import com.framework.service.TbFromUnitService;



@Service("tbFromUnitService")
public class TbFromUnitServiceImpl implements TbFromUnitService {
	@Autowired
	private TbFromUnitDao tbFromUnitDao;
	
	@Override
	public TbFromUnitEntity queryObject(Integer id){
		return tbFromUnitDao.queryObject(id);
	}
	
	@Override
	public List<TbFromUnitEntity> queryList(Map<String, Object> map){
		return tbFromUnitDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return tbFromUnitDao.queryTotal(map);
	}
	
	@Override
	public void save(TbFromUnitEntity tbFromUnit){
		tbFromUnitDao.save(tbFromUnit);
	}
	
	@Override
	public void update(TbFromUnitEntity tbFromUnit){
		tbFromUnitDao.update(tbFromUnit);
	}
	
	@Override
	public void delete(Integer id){
		tbFromUnitDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Integer[] ids){
		tbFromUnitDao.deleteBatch(ids);
	}
	
}
