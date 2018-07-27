package com.framework.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.framework.dao.TbTaskSendDao;
import com.framework.entity.TbTaskSendEntity;
import com.framework.service.TbTaskSendService;



@Service("tbTaskSendService")
public class TbTaskSendServiceImpl implements TbTaskSendService {
	@Autowired
	private TbTaskSendDao tbTaskSendDao;
	
	@Override
	public TbTaskSendEntity queryObject(Long id){
		return tbTaskSendDao.queryObject(id);
	}
	
	@Override
	public List<TbTaskSendEntity> queryList(Map<String, Object> map){
		return tbTaskSendDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return tbTaskSendDao.queryTotal(map);
	}
	
	@Override
	public void save(TbTaskSendEntity tbTaskSend){
		tbTaskSendDao.save(tbTaskSend);
	}
	
	@Override
	public void update(TbTaskSendEntity tbTaskSend){
		tbTaskSendDao.update(tbTaskSend);
	}
	
	@Override
	public void delete(Long id){
		tbTaskSendDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		tbTaskSendDao.deleteBatch(ids);
	}
	
}
