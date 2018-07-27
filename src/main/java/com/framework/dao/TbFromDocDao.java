package com.framework.dao;

import com.framework.entity.TbFromDocEntity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-01 11:56:00
 */
public interface TbFromDocDao extends BaseDao<TbFromDocEntity> {

    String queryMaxRegistNumber();

    String queryMaxRegistNumber(HashMap<String, Object> map);

    TbFromDocEntity queryObjectByUUID(Map<String, Object> map);

    void deleteBatchByUUid(String[] uuids);

    int queryTotal4kz(Map<String, Object> map);

    int queryTotal4ld(Map<String, Object> map);

    List<TbFromDocEntity> queryList4Batch();

}
