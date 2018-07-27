package com.framework.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.framework.dao.TbTaskSendInfoDao;
import com.framework.entity.TbTaskSendInfoEntity;
import com.framework.service.TbTaskSendInfoService;



@Service("tbTaskSendInfoService")
public class TbTaskSendInfoServiceImpl implements TbTaskSendInfoService {
	@Autowired
	private TbTaskSendInfoDao tbTaskSendInfoDao;
	
	@Override
	public TbTaskSendInfoEntity queryObject(Long id){
		return tbTaskSendInfoDao.queryObject(id);
	}
	
	@Override
	public List<TbTaskSendInfoEntity> queryList(Map<String, Object> map){
		return tbTaskSendInfoDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return tbTaskSendInfoDao.queryTotal(map);
	}
	
	@Override
	public void save(TbTaskSendInfoEntity tbTaskSendInfo){
		tbTaskSendInfoDao.save(tbTaskSendInfo);
	}
	
	@Override
	public void update(TbTaskSendInfoEntity tbTaskSendInfo){
		tbTaskSendInfoDao.update(tbTaskSendInfo);
	}
	
	@Override
	public void delete(Long id){
		tbTaskSendInfoDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		tbTaskSendInfoDao.deleteBatch(ids);
	}
	
}
