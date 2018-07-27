package com.framework.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.framework.dao.TbFromDocBanliDao;
import com.framework.entity.TbFromDocBanliEntity;
import com.framework.service.TbFromDocBanliService;



@Service("tbFromDocBanliService")
public class TbFromDocBanliServiceImpl implements TbFromDocBanliService {
	@Autowired
	private TbFromDocBanliDao tbFromDocBanliDao;
	
	@Override
	public TbFromDocBanliEntity queryObject(Long id){
		return tbFromDocBanliDao.queryObject(id);
	}
	
	@Override
	public List<TbFromDocBanliEntity> queryList(Map<String, Object> map){
		return tbFromDocBanliDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return tbFromDocBanliDao.queryTotal(map);
	}
	
	@Override
	public void save(TbFromDocBanliEntity tbFromDocBanli){
		tbFromDocBanliDao.save(tbFromDocBanli);
	}
	
	@Override
	public void update(TbFromDocBanliEntity tbFromDocBanli){
		tbFromDocBanliDao.update(tbFromDocBanli);
	}
	
	@Override
	public void delete(Long id){
		tbFromDocBanliDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		tbFromDocBanliDao.deleteBatch(ids);
	}
	
}
