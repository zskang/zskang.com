package com.framework.service;

import com.framework.entity.TbTempUserEntity;

import java.util.List;
import java.util.Map;

/**
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-09-09 01:30:34
 */
public interface TbTempUserService {

    TbTempUserEntity queryObject(Long userid);

    List<TbTempUserEntity> queryList(Map<String, Object> map);

    int queryTotal(Map<String, Object> map);

    void save(TbTempUserEntity tbTempUser);

    void update(TbTempUserEntity tbTempUser);

    void delete(Long id);

    void deleteBatch(Long[] userids);

    void deleteByDocid(Map<String, Object> map);
}
