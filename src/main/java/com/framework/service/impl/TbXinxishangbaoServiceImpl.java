package com.framework.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.framework.dao.TbXinxishangbaoDao;
import com.framework.entity.TbXinxishangbaoEntity;
import com.framework.service.TbXinxishangbaoService;



@Service("tbXinxishangbaoService")
public class TbXinxishangbaoServiceImpl implements TbXinxishangbaoService {
	@Autowired
	private TbXinxishangbaoDao tbXinxishangbaoDao;
	
	@Override
	public TbXinxishangbaoEntity queryObject(Long id){
		return tbXinxishangbaoDao.queryObject(id);
	}
	
	@Override
	public List<TbXinxishangbaoEntity> queryList(Map<String, Object> map){
		return tbXinxishangbaoDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return tbXinxishangbaoDao.queryTotal(map);
	}
	
	@Override
	public void save(TbXinxishangbaoEntity tbXinxishangbao){
		tbXinxishangbaoDao.save(tbXinxishangbao);
	}
	
	@Override
	public void update(TbXinxishangbaoEntity tbXinxishangbao){
		tbXinxishangbaoDao.update(tbXinxishangbao);
	}
	
	@Override
	public void delete(Long id){
		tbXinxishangbaoDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		tbXinxishangbaoDao.deleteBatch(ids);
	}
	
}
