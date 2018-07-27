package com.framework.dao;

import com.framework.entity.TbSendDocEntity;

import java.util.Map;

/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-08-10 15:50:32
 */
public interface TbSendDocDao extends BaseDao<TbSendDocEntity> {
    String queryMaxRegistNumber(Map<String, Object> map);
}
