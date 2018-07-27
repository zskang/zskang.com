package com.framework.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.framework.dao.TbMsgConfigDao;
import com.framework.entity.TbMsgConfigEntity;
import com.framework.service.TbMsgConfigService;



@Service("tbMsgConfigService")
public class TbMsgConfigServiceImpl implements TbMsgConfigService {
	@Autowired
	private TbMsgConfigDao tbMsgConfigDao;
	
	@Override
	public TbMsgConfigEntity queryObject(Integer id){
		return tbMsgConfigDao.queryObject(id);
	}
	
	@Override
	public List<TbMsgConfigEntity> queryList(Map<String, Object> map){
		return tbMsgConfigDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return tbMsgConfigDao.queryTotal(map);
	}
	
	@Override
	public void save(TbMsgConfigEntity tbMsgConfig){
		tbMsgConfigDao.save(tbMsgConfig);
	}
	
	@Override
	public void update(TbMsgConfigEntity tbMsgConfig){
		tbMsgConfigDao.update(tbMsgConfig);
	}
	
	@Override
	public void delete(Integer id){
		tbMsgConfigDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Integer[] ids){
		tbMsgConfigDao.deleteBatch(ids);
	}
	
}
