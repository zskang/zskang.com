package com.framework.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.framework.utils.StringUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.framework.entity.TbMsgConfigEntity;
import com.framework.service.TbMsgConfigService;
import com.framework.utils.PageUtils;
import com.framework.utils.R;


/**
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-25 14:30:01
 */
@Controller
@RequestMapping("tbmsgconfig")
public class TbMsgConfigController extends AbstractController {
    @Autowired
    private TbMsgConfigService tbMsgConfigService;

    @RequestMapping("/tbmsgconfig.html")
    public String list() {
        return "tbmsgconfig/tbmsgconfig.html";
    }

    @RequestMapping("/tbmsgconfig_add.html")
    public String add() {
        return "tbmsgconfig/tbmsgconfig_add.html";
    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("tbmsgconfig:list")
    public R list(Integer page, Integer limit) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        //查询列表数据
        List<TbMsgConfigEntity> tbMsgConfigList = tbMsgConfigService.queryList(map);
        int total = tbMsgConfigService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(tbMsgConfigList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("tbmsgconfig:info")
    public R info(@PathVariable("id") Integer id) {
        TbMsgConfigEntity tbMsgConfig = tbMsgConfigService.queryObject(id);

        return R.ok().put("tbMsgConfig", tbMsgConfig);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("tbmsgconfig:save")
    public R save(@RequestBody TbMsgConfigEntity tbMsgConfig) {
        Integer tqdays = tbMsgConfig.getTqday();
        if (StringUtil.isNotBlank(tqdays + "")) {

        } else {
            tbMsgConfig.setTqday(1);
        }
        tbMsgConfigService.save(tbMsgConfig);

        return R.ok();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("tbmsgconfig:update")
    public R update(@RequestBody TbMsgConfigEntity tbMsgConfig) {
        tbMsgConfigService.update(tbMsgConfig);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("tbmsgconfig:delete")
    public R delete(@RequestBody Integer[] ids) {
        tbMsgConfigService.deleteBatch(ids);

        return R.ok();
    }

}
