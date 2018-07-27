package com.framework.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.framework.entity.SysUserEntity;
import com.framework.service.SysUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.framework.entity.TbTempUserEntity;
import com.framework.service.TbTempUserService;
import com.framework.utils.PageUtils;
import com.framework.utils.R;


/**
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-09-09 01:30:34
 */
@Controller
@RequestMapping("tbtempuser")
public class TbTempUserController extends AbstractController {
    @Autowired
    private TbTempUserService tbTempUserService;

    @RequestMapping("/tbtempuser.html")
    public String list() {
        return "tbtempuser/tbtempuser.html";
    }

    @RequestMapping("/tbtempuser_add.html")
    public String add() {
        return "tbtempuser/tbtempuser_add.html";
    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("tbtempuser:list")
    public R list(Integer page, Integer limit) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        //查询列表数据
        List<TbTempUserEntity> tbTempUserList = tbTempUserService.queryList(map);
        int total = tbTempUserService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(tbTempUserList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{userid}")
    @RequiresPermissions("tbtempuser:info")
    public R info(@PathVariable("userid") Long userid) {
        TbTempUserEntity tbTempUser = tbTempUserService.queryObject(userid);

        return R.ok().put("tbTempUser", tbTempUser);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("tbtempuser:save")
    public R save(@RequestBody TbTempUserEntity tbTempUser) {
        tbTempUserService.save(tbTempUser);

        return R.ok();
    }

    @Autowired
    private SysUserService sysUserService;

    @ResponseBody
    @RequestMapping("/saveOne/{uuid}")
    @RequiresPermissions("tbtempuser:save")
    public R saveOne(@RequestBody String id, @PathVariable String uuid) {
        logger.info(id);
        logger.info(uuid);
        SysUserEntity userEntity = this.sysUserService.queryObject(Long.valueOf(id));
        //查询是否已经包含了这个人
        if (userEntity != null) {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("unitid", userEntity.getUnitid());
            map.put("docid", uuid);
            map.put("mobile", userEntity.getMobile());
            map.put("userId", userEntity.getUserId());
            int ccc = this.tbTempUserService.queryTotal(map);
            if (ccc == 0) {
                TbTempUserEntity tbTempUserEntity = new TbTempUserEntity();
                tbTempUserEntity.setUnitid(userEntity.getUnitid() + "");
                tbTempUserEntity.setUserid(userEntity.getUserId());
                tbTempUserEntity.setDocid(uuid);
                // tbTempUserEntity.setUsername(userEntity.getUsername());
                tbTempUserEntity.setMobile(userEntity.getMobile());
                tbTempUserEntity.setStatus(userEntity.getStatus() + "");
                // tbTempUserEntity.setXm(userEntity.getXm());
                tbTempUserService.save(tbTempUserEntity);
            } else {
                return R.error("已经存在了。");
            }
        }
        return R.ok();
    }

    @ResponseBody
    @RequestMapping("/saveAll/{unitid}")
    @RequiresPermissions("tbtempuser:save")
    public R saveAll(@PathVariable String unitid, @RequestBody String uuid) {
        logger.info(unitid);
        logger.info(uuid);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("unitid", unitid);
        List<SysUserEntity> lists = this.sysUserService.queryList(map);
        for (SysUserEntity userEntity : lists) {
            TbTempUserEntity tbTempUserEntity = new TbTempUserEntity();
            if (userEntity != null) {
                Map<String, Object> map1 = new HashMap<String, Object>();
                map1.put("unitid", userEntity.getUnitid());
                map1.put("docid", uuid);
                map1.put("mobile", userEntity.getMobile());
                map1.put("userId", userEntity.getUserId());
                int ccc = this.tbTempUserService.queryTotal(map1);
                if (ccc == 0) {
                    tbTempUserEntity.setUnitid(unitid);
                    tbTempUserEntity.setDocid(uuid);
                    tbTempUserEntity.setUserid(userEntity.getUserId());
                    // tbTempUserEntity.setUsername(userEntity.getUsername());
                    tbTempUserEntity.setMobile(userEntity.getMobile());
                    tbTempUserEntity.setStatus(userEntity.getStatus() + "");
                    //  tbTempUserEntity.setXm(userEntity.getXm());
                    tbTempUserService.save(tbTempUserEntity);
                }
            }
        }
        return R.ok();
    }

    @ResponseBody
    @RequestMapping("/deleteOne")
    @RequiresPermissions("tbtempuser:save")
    public R deleteOne(@RequestBody String id) {
        this.tbTempUserService.delete(Long.parseLong(id));
        return R.ok();
    }

    @ResponseBody
    @RequestMapping("/deleteAll")
    @RequiresPermissions("tbtempuser:save")
    public R deleteAll(@RequestBody String uuid) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("docId", uuid);
        this.tbTempUserService.deleteByDocid(map);
        return R.ok();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("tbtempuser:update")
    public R update(@RequestBody TbTempUserEntity tbTempUser) {
        tbTempUserService.update(tbTempUser);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("tbtempuser:delete")
    public R delete(@RequestBody Long[] userids) {
        tbTempUserService.deleteBatch(userids);

        return R.ok();
    }

}
