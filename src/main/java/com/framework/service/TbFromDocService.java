package com.framework.service;

import com.framework.entity.TbFromDocEntity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-01 11:56:00
 */
public interface TbFromDocService {

    TbFromDocEntity queryObject(Long fromDocId);

    List<TbFromDocEntity> queryList(Map<String, Object> map, String type);

    int queryTotal(Map<String, Object> map, String type);

    void save(TbFromDocEntity tbFromDoc);

    void update(TbFromDocEntity tbFromDoc);

    void delete(String uuid);

    void deleteBatch(String[] uuids);

    void saveFile2Db(String uuid);

    String queryMaxRegistNumber();
    // String queryMaxRegistNumber(HashMap<String, Object> map);

    TbFromDocEntity queryObjectByUUID(String uuid);

    void deleteBatchByUUid(String[] uuids);

}
