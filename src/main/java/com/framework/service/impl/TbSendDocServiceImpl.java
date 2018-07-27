package com.framework.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.framework.dao.TbSendDocDao;
import com.framework.entity.TbSendDocEntity;
import com.framework.service.TbSendDocService;



@Service("tbSendDocService")
public class TbSendDocServiceImpl implements TbSendDocService {
	@Autowired
	private TbSendDocDao tbSendDocDao;
	
	@Override
	public TbSendDocEntity queryObject(Long id){
		return tbSendDocDao.queryObject(id);
	}
	
	@Override
	public List<TbSendDocEntity> queryList(Map<String, Object> map){
		return tbSendDocDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return tbSendDocDao.queryTotal(map);
	}
	
	@Override
	public void save(TbSendDocEntity tbSendDoc){
		tbSendDocDao.save(tbSendDoc);
	}
	
	@Override
	public void update(TbSendDocEntity tbSendDoc){
		tbSendDocDao.update(tbSendDoc);
	}
	
	@Override
	public void delete(Long id){
		tbSendDocDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		tbSendDocDao.deleteBatch(ids);
	}

	@Override
	public String queryMaxRegistNumber(Map<String, Object> map) {
		return tbSendDocDao.queryMaxRegistNumber(map);
	}

}
