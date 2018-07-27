package com.framework.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.framework.dao.TbTaskDao;
import com.framework.entity.TbTaskEntity;
import com.framework.service.TbTaskService;



@Service("tbTaskService")
public class TbTaskServiceImpl implements TbTaskService {
	@Autowired
	private TbTaskDao tbTaskDao;
	
	@Override
	public TbTaskEntity queryObject(Long id){
		return tbTaskDao.queryObject(id);
	}
	
	@Override
	public List<TbTaskEntity> queryList(Map<String, Object> map){
		return tbTaskDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return tbTaskDao.queryTotal(map);
	}
	
	@Override
	public void save(TbTaskEntity tbTask){
		tbTaskDao.save(tbTask);
	}
	
	@Override
	public void update(TbTaskEntity tbTask){
		tbTaskDao.update(tbTask);
	}
	
	@Override
	public void delete(Long id){
		tbTaskDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		tbTaskDao.deleteBatch(ids);
	}


	
}
