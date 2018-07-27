package com.framework.dao;

import com.framework.entity.TbFileAttachEntity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-03 09:06:47
 */
public interface TbFileAttachDao extends BaseDao<TbFileAttachEntity> {

    List<TbFileAttachEntity> queryAll(HashMap<String, Object> map);

    void deleteBatchByUUID(Map<String, Object> mp);
}
