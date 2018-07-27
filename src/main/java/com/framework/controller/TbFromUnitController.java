package com.framework.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.framework.entity.SysConfigEntity;
import com.framework.entity.SysUnitEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import com.framework.entity.TbFromUnitEntity;
import com.framework.service.TbFromUnitService;
import com.framework.utils.PageUtils;
import com.framework.utils.R;


/**
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-01 10:00:12
 */
@Controller
@RequestMapping("tbfromunit")
public class TbFromUnitController {
    @Autowired
    private TbFromUnitService tbFromUnitService;

    @RequestMapping("/tbfromunit.html")
    public String list() {
        return "tbfromunit/tbfromunit.html";
    }

    @RequestMapping("/tbfromunit_add.html")
    public String add() {
        return "tbfromunit/tbfromunit_add.html";
    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("tbfromunit:list")
    public R list(Integer page, Integer limit) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        //查询列表数据
        List<TbFromUnitEntity> tbFromUnitList = tbFromUnitService.queryList(map);
        int total = tbFromUnitService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(tbFromUnitList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    @RequestMapping("/select")
    @RequiresPermissions("tbfromunit:list")
    public R select() {
        // 查询列表数据
        Map<String, Object> map = new HashMap<String, Object>();
        List<TbFromUnitEntity> list = tbFromUnitService.queryList(map);

        return R.ok().put("list", list);
    }

    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("tbfromunit:info")
    public R info(@PathVariable("id") Integer id) {
        TbFromUnitEntity tbFromUnit = tbFromUnitService.queryObject(id);

        return R.ok().put("tbFromUnit", tbFromUnit);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("tbfromunit:save")
    public R save(@RequestBody TbFromUnitEntity tbFromUnit) {
        tbFromUnitService.save(tbFromUnit);

        return R.ok();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("tbfromunit:update")
    public R update(@RequestBody TbFromUnitEntity tbFromUnit) {
        tbFromUnitService.update(tbFromUnit);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("tbfromunit:delete")
    public R delete(@RequestBody Integer[] ids) {
        tbFromUnitService.deleteBatch(ids);

        return R.ok();
    }

}
