package com.framework.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.framework.dao.SysUserDao;
import com.framework.entity.SysUserEntity;
import com.framework.service.SysUserRoleService;
import com.framework.service.SysUserService;

/**
 * 系统用户实现类
 */
@Service("sysUserService")
public class SysUserServiceImpl implements SysUserService {
    @Autowired
    private SysUserDao sysUserDao;
    @Autowired
    private SysUserRoleService sysUserRoleService;

    /**
     * 查询用户的所有权限
     *
     * @param userId 用户ID
     */
    @Override
    public List<String> queryAllPerms(Long userId) {
        return sysUserDao.queryAllPerms(userId);
    }

    /**
     * 查询用户的所有菜单ID
     */
    @Override
    public List<Long> queryAllMenuId(Long userId) {
        return sysUserDao.queryAllMenuId(userId);
    }

    /**
     * 根据用户名，查询系统用户
     */
    @Override
    public SysUserEntity queryByUserName(String username) {
        return sysUserDao.queryByUserName(username);
    }

    /**
     * 根据用户ID，查询用户
     *
     * @param userId
     * @return
     */
    @Override
    public SysUserEntity queryObject(Long userId) {
        return sysUserDao.queryObject(userId);
    }

    /**
     * 查询用户列表
     */
    @Override
    public List<SysUserEntity> queryList(Map<String, Object> map) {
        return sysUserDao.queryList(map);
    }

    /**
     * 查询总数
     */
    @Override
    public int queryTotal(Map<String, Object> map) {
        return sysUserDao.queryTotal(map);
    }

    /**
     * 保存用户
     */
    @Override
    @Transactional
    public long save(SysUserEntity user) {
        user.setCreateTime(new Date());
        // sha256加密
        user.setPassword(new Sha256Hash(user.getPassword()).toHex());
        sysUserDao.save(user);

        // 保存用户与角色关系
        sysUserRoleService.saveOrUpdate(user.getUserId(), user.getRoleIdList());
        return user.getUserId();
    }

    /**
     * 修改用户
     */
    @Override
    @Transactional
    public void update(SysUserEntity user) {
        if (StringUtils.isBlank(user.getPassword())) {
            user.setPassword(null);
        } else {
            user.setPassword(new Sha256Hash(user.getPassword()).toHex());
        }
        sysUserDao.update(user);

        // 保存用户与角色关系
        sysUserRoleService.saveOrUpdate(user.getUserId(), user.getRoleIdList());
    }

    /**
     * 删除用户
     */
    @Override
    @Transactional
    public void deleteBatch(Long[] userId) {
        sysUserDao.deleteBatch(userId);
    }

    /**
     * 修改密码
     *
     * @param userId      用户ID
     * @param password    原密码
     * @param newPassword 新密码
     */
    @Override
    public int updatePassword(Long userId, String password, String newPassword) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("userId", userId);
        map.put("password", password);
        map.put("newPassword", newPassword);
        return sysUserDao.updatePassword(map);
    }

    @Override
    public List<SysUserEntity> queryLds() {
        return sysUserDao.queryLds();
    }

    @Override
    public Long getKeZhang(HashMap<String, Object> map) {
        SysUserEntity user = sysUserDao.getKeZhang(map);
        return user.getUserId();
    }

    @Override
    public Long queryObjectByName(Map<String, Object> maps) {
        SysUserEntity u = sysUserDao.queryObjectByName(maps);
        if (u != null) {
            return u.getUserId();
        }
        return 0L;
    }

    @Override
    public List<SysUserEntity> queryList4zhipai(Map<String, Object> map) {
        return sysUserDao.queryList4zhipai(map);
    }

    @Override
    public int queryTotal4zhipai(Map<String, Object> map) {
        return sysUserDao.queryTotal4zhipai(map);
    }
}
