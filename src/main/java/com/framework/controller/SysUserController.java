package com.framework.controller;

import com.framework.entity.SysUnitEntity;
import com.framework.entity.SysUserEntity;
import com.framework.entity.TbMsgLogEntity;
import com.framework.entity.TbTempUserEntity;
import com.framework.service.*;
import com.framework.service.impl.TbTempUserServiceImpl;
import com.framework.utils.*;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

/**
 * 系统用户
 */
@RestController
@RequestMapping("/sys/user")
public class SysUserController extends AbstractController {
    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private TbTempUserService tmpuseService;

    @Autowired
    private SysUserRoleService sysUserRoleService;

    @Autowired
    private SysUnitService sysUnitService;

    @Autowired
    private TbMsgLogService tbMsgLogService;

    /**
     * 所有用户列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("sys:user:list")
    public R list(Integer page, Integer limit, String xm, String username, String mobile, String status, String roleId, String unitid) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        if (StringUtils.isNotBlank(xm)) {
            String xm_ = com.framework.utils.Escape.unescape(xm);
            map.put("xm", "%" + xm_ + "%");
        }
        if (StringUtils.isNotBlank(username)) {
            String username_ = com.framework.utils.Escape.unescape(username);
            map.put("username", "%" + username_ + "%");
        }
        if (StringUtils.isNotBlank(roleId)) {
            String roleId_ = com.framework.utils.Escape.unescape(roleId);
            map.put("roleId", roleId);
        }
        if (StringUtils.isNotBlank(mobile)) {
            String mobile_ = com.framework.utils.Escape.unescape(mobile);
            map.put("mobile", "%" + mobile_ + "%");
        }
        if (StringUtils.isNotBlank(status) && !"undefined".equals(status)) {
            String status_ = com.framework.utils.Escape.unescape(status);
            map.put("status", status);
        }
        if (StringUtils.isNotBlank(unitid)) {
            String unitid_ = com.framework.utils.Escape.unescape(unitid);
            map.put("unitid", unitid_);
        }
        // 查询列表数据
        List<SysUserEntity> userList = sysUserService.queryList(map);
        int total = sysUserService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(userList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    @RequestMapping("/listByUnit/{unitId}")
    @RequiresPermissions("sys:user:list")
    public R listByUnit(Integer page, Integer limit, @PathVariable("unitId") String unitId, String xm) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        int total = 0;
        List<SysUserEntity> userList = new ArrayList<SysUserEntity>();
        logger.info(unitId);
        if (StringUtils.isNotBlank(xm)) {
            String key = com.framework.utils.Escape.unescape(xm);
            map.put("xm", "%" + key + "%");
        }
        if ("ALL".equals(unitId) || "null".equals(unitId)) {
            userList = sysUserService.queryList(map);
            total = sysUserService.queryTotal(map);
        } else {
            if (StringUtils.isNotBlank(unitId)) {
                map.put("unitid", unitId);
                // 查询列表数据
                userList = sysUserService.queryList(map);
                total = sysUserService.queryTotal(map);
            }
        }
        PageUtils pageUtil = new PageUtils(userList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    @RequestMapping("/listByUnit4HasSelected/{uuid}")
    @RequiresPermissions("sys:user:list")
    public R listByUnit4HasSelected(Integer page, Integer limit, @PathVariable("uuid") String uuid) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        int total = 0;
        if (StringUtil.isNotBlank(uuid)) {
            map.put("docId", uuid);
        }
        List<TbTempUserEntity> userList = new ArrayList<TbTempUserEntity>();
        userList = tmpuseService.queryList(map);
        total = tmpuseService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(userList, total, limit, page);
        return R.ok().put("page", pageUtil);

    }


    @RequestMapping("/listByUnit4zhipai/{unitId}/{uuid}")
    @RequiresPermissions("sys:user:list")
    public R listByUnit4zhipai(Integer page, Integer limit, @PathVariable("unitId") String unitId,
                               @PathVariable("uuid") String uuid, String xm) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        int total = 0;
        List<SysUserEntity> userList = new ArrayList<SysUserEntity>();
        logger.info(unitId);
        if (StringUtils.isNotBlank(xm)) {
            String key = com.framework.utils.Escape.unescape(xm);
            map.put("xm", "%" + key + "%");
        }
        if (StringUtil.isNotBlank(uuid)) {
            map.put("uuid", uuid);
        }
        if ("ALL".equals(unitId) || "null".equals(unitId)) {
            userList = sysUserService.queryList4zhipai(map);
            total = sysUserService.queryTotal4zhipai(map);
        } else {
            if (StringUtils.isNotBlank(unitId)) {
                map.put("unitid", unitId);
                // 查询列表数据
                userList = sysUserService.queryList4zhipai(map);
                total = sysUserService.queryTotal4zhipai(map);
            }
        }
        PageUtils pageUtil = new PageUtils(userList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    @RequestMapping("/select")
    @RequiresPermissions("sys:user:list")
    public R select() {
        // 查询列表数据
        List<SysUnitEntity> list = sysUnitService.queryList(new HashMap<String, Object>());

        return R.ok().put("list", list);
    }

    @RequestMapping("/selectld")
    @RequiresPermissions("sys:user:list")
    public R selectld() {
        List<SysUserEntity> list = sysUserService.queryLds();
        logger.info(list.size());
        return R.ok().put("list", list);
    }

    @RequestMapping("/selectuserbyunitid/{unitid}")
    @RequiresPermissions("sys:user:list")
    public R select1(@PathVariable("unitid") Long unitid) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("unitid", unitid);
        List<SysUserEntity> list = sysUserService.queryList(map);
        return R.ok().put("list", list);
    }

    /**
     * 获取登录的用户信息
     */
    @RequestMapping("/info")
    public R info() {
        return R.ok().put("user", getUser());
    }

    /**
     * 修改登录用户密码
     */
    @RequestMapping("/password")
    public R password(String password, String newPassword) {
        if (StringUtils.isBlank(newPassword)) {
            return R.error("新密码不为能空");
        }

        // sha256加密
        password = new Sha256Hash(password).toHex();
        // sha256加密
        newPassword = new Sha256Hash(newPassword).toHex();

        // 更新密码
        int count = sysUserService.updatePassword(getUserId(), password, newPassword);
        if (count == 0) {
            return R.error("原密码不正确");
        }

        // 退出
        ShiroUtils.logout();

        return R.ok();
    }

    /**
     * 用户信息
     */
    @RequestMapping("/info/{userId}")
    @RequiresPermissions("sys:user:info")
    public R info(@PathVariable("userId") Long userId) {
        SysUserEntity user = sysUserService.queryObject(userId);

        // 获取用户所属的角色列表
        List<Long> roleIdList = sysUserRoleService.queryRoleIdList(userId);
        user.setRoleIdList(roleIdList);

        return R.ok().put("user", user);
    }

    /**
     * 保存用户
     */
    @RequestMapping("/save")
    @RequiresPermissions("sys:user:save")
    public R save(@RequestBody SysUserEntity user) {
        if (StringUtils.isBlank(user.getUsername())) {
            return R.error("用户名不能为空");
        }
        if (StringUtils.isBlank(user.getPassword())) {
            return R.error("密码不能为空");
        }
        if (StringUtils.isBlank(user.getMobile())) {
            return R.error("手机号码不能为空！");
        }// else {
        // if (!ClassPathResource.isMobileNO(user.getMobile())) {
        //     return R.error("手机号码不合法！请填写正确的手机号码！");
        // }
        // }

        sysUserService.save(user);

        return R.ok();
    }

    @RequestMapping("/sendMsgs")
    @RequiresPermissions("sys:user:update")
    public R sendMsgs(@RequestBody String params) throws Exception {
        if (StringUtil.isNotBlank(params)) {
            String[] params_ = params.split("_");
            if (params_.length > 0) {
                String content = params_[0];
                String userids = params_[1];
                if (StringUtil.isNotBlank(userids)) {
                    String[] usid = userids.split(",");
                    for (String s : usid) {
                        SysUserEntity userEntity = this.sysUserService.queryObject(Long.valueOf(s));
                        if (userEntity != null && StringUtil.isNotBlank(userEntity.getMobile())) {
                            String[] res = MobileMsgEngine.getMobileMsgEngine().send2WebserviceExcode(userEntity.getMobile(), content, "");
                            if (res.length > 0) {
                                TbMsgLogEntity tbMsgLogEntity = new TbMsgLogEntity();
                                tbMsgLogEntity.setDocuuid("");
                                tbMsgLogEntity.setResult(res[1]);
                                tbMsgLogEntity.setSendtime(DateUtil.formatDateYYYY_MM_DD_HH_MM_SS(new Date()));
                                tbMsgLogEntity.setTouserid(s);
                                tbMsgLogEntity.setTyp("MORE");
                                tbMsgLogEntity.setExt1(content);
                                tbMsgLogService.save(tbMsgLogEntity);
                            }
                        }
                    }
                }
            }
        }
        return R.ok();
    }


    /**
     * 修改用户
     */
    @RequestMapping("/update")
    @RequiresPermissions("sys:user:update")
    public R update(@RequestBody SysUserEntity user) {
        if (StringUtils.isBlank(user.getUsername())) {
            return R.error("用户名不能为空");
        }
        if (StringUtils.isBlank(user.getPassword())) {
            return R.error("密码不能为空");
        }
        if (StringUtils.isBlank(user.getMobile())) {
            return R.error("手机号码不能为空！");
        } else {
            if (!ClassPathResource.isMobileNO(user.getMobile())) {
                return R.error("手机号码不合法！请填写正确的手机号码！");
            }
        }
        sysUserService.update(user);
        return R.ok();
    }

    /**
     * 删除用户
     */
    @RequestMapping("/delete")
    @RequiresPermissions("sys:user:delete")
    public R delete(@RequestBody Long[] userIds) {
        if (ArrayUtils.contains(userIds, 1L)) {
            return R.error("系统管理员不能删除");
        }

        if (ArrayUtils.contains(userIds, getUserId())) {
            return R.error("当前用户不能删除");
        }

        sysUserService.deleteBatch(userIds);

        return R.ok();
    }
}
