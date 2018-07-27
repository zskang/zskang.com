package com.framework.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.dao.SysOrgDao;
import com.framework.entity.SysOrgEntity;
import com.framework.service.SysOrgService;

/**
 * 系统用户实现类
 */
@Service("sysOrgService")
public class SysOrgServiceImpl implements SysOrgService {

	@Autowired
	private SysOrgDao sysOrgDao;

	@Override
	public SysOrgEntity queryObject(Long id) {
		return sysOrgDao.queryObject(id);
	}

	@Override
	public void save(SysOrgEntity org) {
		sysOrgDao.save(org);
	}

	@Override
	public void update(SysOrgEntity org) {
		sysOrgDao.update(org);
	}

	@Override
	public List<SysOrgEntity> queryList(Map<String, Object> map) {
		return sysOrgDao.queryList(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		return sysOrgDao.queryTotal(map);
	}

	@Override
	public void deleteBatch(Long[] ids) {
		sysOrgDao.deleteBatch(ids);
	}

	@Override
	public List<SysOrgEntity> queryChildOrgList(Long id) {
		return sysOrgDao.queryChildOrgList(id);
	}

	@Override
	public List<SysOrgEntity> queryAllOrgs() {
		return sysOrgDao.queryAllOrgs();
	}

}
