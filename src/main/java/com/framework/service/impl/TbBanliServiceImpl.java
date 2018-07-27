package com.framework.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.framework.dao.TbBanliDao;
import com.framework.entity.TbBanliEntity;
import com.framework.service.TbBanliService;


@Service("tbBanliService")
public class TbBanliServiceImpl implements TbBanliService {
    @Autowired
    private TbBanliDao tbBanliDao;

    @Override
    public TbBanliEntity queryObject(Long id) {
        return tbBanliDao.queryObject(id);
    }

    @Override
    public List<TbBanliEntity> queryList(Map<String, Object> map) {
        return tbBanliDao.queryList(map);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return tbBanliDao.queryTotal(map);
    }

    @Override
    public void save(TbBanliEntity tbBanli) {
        tbBanliDao.save(tbBanli);
    }

    @Override
    public void update(TbBanliEntity tbBanli) {
        tbBanliDao.update(tbBanli);
    }

    @Override
    public void delete(Long id) {
        tbBanliDao.delete(id);
    }

    @Override
    public void deleteBatch(Long[] ids) {
        tbBanliDao.deleteBatch(ids);
    }

    @Override
    public void deleteBatchBydocId(Long fromDocId) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("doc_id", fromDocId);
        this.tbBanliDao.deleteBatchBydocId(map);
    }

    @Override
    public List<TbBanliEntity> queryList4task(Map<String, Object> map) {
        return  this.tbBanliDao.queryList4task(map);
    }

    @Override
    public List<TbBanliEntity> queryList2(Map<String, Object> map) {
        return tbBanliDao.queryList2(map);
    }

    @Override
    public int queryTotal2(Map<String, Object> map) {

        return tbBanliDao.queryTotal2(map);
    }

    @Override
    public void updateByMap(Map map) {
        tbBanliDao.updateByMap(map);
    }

}
