package com.framework.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.framework.dao.TbTextDao;
import com.framework.entity.TbTextEntity;
import com.framework.service.TbTextService;



@Service("tbTextService")
public class TbTextServiceImpl implements TbTextService {
	@Autowired
	private TbTextDao tbTextDao;
	
	@Override
	public TbTextEntity queryObject(Long id){
		return tbTextDao.queryObject(id);
	}
	
	@Override
	public List<TbTextEntity> queryList(Map<String, Object> map){
		return tbTextDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return tbTextDao.queryTotal(map);
	}
	
	@Override
	public void save(TbTextEntity tbText){
		tbTextDao.save(tbText);
	}
	
	@Override
	public void update(TbTextEntity tbText){
		tbTextDao.update(tbText);
	}
	
	@Override
	public void delete(Long id){
		tbTextDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		tbTextDao.deleteBatch(ids);
	}

}
