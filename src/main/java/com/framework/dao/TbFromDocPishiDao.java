package com.framework.dao;

import com.framework.entity.TbFromDocPishiEntity;

import java.util.Map;

/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-04 10:56:24
 */
public interface TbFromDocPishiDao extends BaseDao<TbFromDocPishiEntity> {

    void deleteBatchBydocId(Map<String, Object> map);
}
