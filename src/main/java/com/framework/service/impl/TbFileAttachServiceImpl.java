package com.framework.service.impl;

import com.framework.dao.TbFileAttachDao;
import com.framework.entity.TbFileAttachEntity;
import com.framework.service.TbFileAttachService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/7/007.
 */
@Service("tbFileAttachService")
public class TbFileAttachServiceImpl implements TbFileAttachService {

    @Autowired
    private TbFileAttachDao fujDao;

    @Override
    public TbFileAttachEntity queryObject(Integer id) {
        return fujDao.queryObject(id);
    }

    @Override
    public List<TbFileAttachEntity> queryList(Map<String, Object> map) {
        return fujDao.queryList(map);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return fujDao.queryTotal(map);
    }

    @Override
    public void save(TbFileAttachEntity tbFileAttach) {
        fujDao.save(tbFileAttach);
    }

    @Override
    public void update(TbFileAttachEntity tbFileAttach) {
        fujDao.update(tbFileAttach);
    }

    @Override
    public void delete(Long id) {
        fujDao.delete(id);
    }

    @Override
    public void deleteBatch(Long[] ids) {
        fujDao.deleteBatch(ids);
    }

    @Override
    public List<TbFileAttachEntity> queryAll(HashMap<String, Object> map) {
        return fujDao.queryAll(map);
    }

    @Override
    public void deleteBatchByUUID(String uuid) {
      Map<String,Object> mp= new  HashMap<String, Object>();
        mp.put("uuid",uuid);
       fujDao.deleteBatchByUUID(mp);
    }
}
