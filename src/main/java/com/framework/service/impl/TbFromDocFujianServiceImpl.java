package com.framework.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.framework.dao.TbFromDocFujianDao;
import com.framework.entity.TbFromDocFujianEntity;
import com.framework.service.TbFromDocFujianService;



@Service("tbFromDocFujianService")
public class TbFromDocFujianServiceImpl implements TbFromDocFujianService {
	@Autowired
	private TbFromDocFujianDao tbFromDocFujianDao;
	
	@Override
	public TbFromDocFujianEntity queryObject(Long id){
		return tbFromDocFujianDao.queryObject(id);
	}
	
	@Override
	public List<TbFromDocFujianEntity> queryList(Map<String, Object> map){
		return tbFromDocFujianDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return tbFromDocFujianDao.queryTotal(map);
	}
	
	@Override
	public void save(TbFromDocFujianEntity tbFromDocFujian){
		tbFromDocFujianDao.save(tbFromDocFujian);
	}
	
	@Override
	public void update(TbFromDocFujianEntity tbFromDocFujian){
		tbFromDocFujianDao.update(tbFromDocFujian);
	}
	
	@Override
	public void delete(Long id){
		tbFromDocFujianDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		tbFromDocFujianDao.deleteBatch(ids);
	}
	
}
