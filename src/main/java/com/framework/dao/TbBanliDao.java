package com.framework.dao;

import com.framework.entity.TbBanliEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-05 11:38:18
 */
public interface TbBanliDao extends BaseDao<TbBanliEntity> {

    void deleteBatchBydocId(Map<String, Object> map);

    List<TbBanliEntity> queryList4task(Map<String, Object> map); 

    List<TbBanliEntity> queryList2(Map<String, Object> map);

    int queryTotal2(Map<String, Object> map);

    void updateByMap(Map map);
}
