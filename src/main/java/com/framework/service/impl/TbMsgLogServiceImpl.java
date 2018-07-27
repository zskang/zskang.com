package com.framework.service.impl;

import com.framework.dao.TbMsgConfigDao;
import com.framework.dao.TbMsgLogDao;
import com.framework.entity.TbMsgConfigEntity;
import com.framework.entity.TbMsgLogEntity;
import com.framework.service.TbMsgLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service("tbMsgLogService")
public class TbMsgLogServiceImpl implements TbMsgLogService {
	@Autowired
	private TbMsgLogDao tbMsgLogDao;
	
	@Override
	public TbMsgLogEntity queryObject(Long id){
		return tbMsgLogDao.queryObject(id);
	}

	@Override
	public List<TbMsgLogEntity> queryList(Map<String, Object> map){
		return tbMsgLogDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return tbMsgLogDao.queryTotal(map);
	}
	
	@Override
	public void save(TbMsgLogEntity tbMsgLogEntity){
		tbMsgLogDao.save(tbMsgLogEntity);
	}
	
	@Override
	public void update(TbMsgLogEntity tbMsgLogEntity){
		tbMsgLogDao.update(tbMsgLogEntity);
	}


	@Override
	public void delete(Long id){
		tbMsgLogDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		tbMsgLogDao.deleteBatch(ids);
	}
	
}
