package com.framework.dao;

import com.framework.entity.TbTempUserEntity;

import java.util.Map;

/**
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-09-09 01:30:34
 */
public interface TbTempUserDao extends BaseDao<TbTempUserEntity> {

    void deleteByDocid(Map<String, Object> map);
}
