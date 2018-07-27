package com.framework.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.framework.dao.TbTempUserDao;
import com.framework.entity.TbTempUserEntity;
import com.framework.service.TbTempUserService;


@Service("tbTempUserService")
public class TbTempUserServiceImpl implements TbTempUserService {
    @Autowired
    private TbTempUserDao tbTempUserDao;

    @Override
    public TbTempUserEntity queryObject(Long userid) {
        return tbTempUserDao.queryObject(userid);
    }

    @Override
    public List<TbTempUserEntity> queryList(Map<String, Object> map) {
        return tbTempUserDao.queryList(map);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return tbTempUserDao.queryTotal(map);
    }

    @Override
    public void save(TbTempUserEntity tbTempUser) {
        tbTempUserDao.save(tbTempUser);
    }

    @Override
    public void update(TbTempUserEntity tbTempUser) {
        tbTempUserDao.update(tbTempUser);
    }

    @Override
    public void delete(Long id) {
        tbTempUserDao.delete(id);
    }

    @Override
    public void deleteBatch(Long[] userids) {
        tbTempUserDao.deleteBatch(userids);
    }

    @Override
    public void deleteByDocid(Map<String, Object> map) {
        tbTempUserDao.deleteByDocid(map);
    }

}
