package com.framework.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.framework.dao.TbFromDocPishiDao;
import com.framework.entity.TbFromDocPishiEntity;
import com.framework.service.TbFromDocPishiService;



@Service("tbFromDocPishiService")
public class TbFromDocPishiServiceImpl implements TbFromDocPishiService {
	@Autowired
	private TbFromDocPishiDao tbFromDocPishiDao;
	
	@Override
	public TbFromDocPishiEntity queryObject(Long id){
		return tbFromDocPishiDao.queryObject(id);
	}
	
	@Override
	public List<TbFromDocPishiEntity> queryList(Map<String, Object> map){
		return tbFromDocPishiDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return tbFromDocPishiDao.queryTotal(map);
	}
	
	@Override
	public void save(TbFromDocPishiEntity tbFromDocPishi){
		tbFromDocPishiDao.save(tbFromDocPishi);
	}
	
	@Override
	public void update(TbFromDocPishiEntity tbFromDocPishi){
		tbFromDocPishiDao.update(tbFromDocPishi);
	}
	
	@Override
	public void delete(Long id){
		tbFromDocPishiDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		tbFromDocPishiDao.deleteBatch(ids);
	}

	@Override
	public void deleteBatchBy(Long fromDocId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("doc_id", fromDocId);
		this.tbFromDocPishiDao.deleteBatchBydocId(map);
	}

}
