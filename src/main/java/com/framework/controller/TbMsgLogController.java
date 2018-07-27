package com.framework.controller;

import com.framework.entity.TbMsgConfigEntity;
import com.framework.entity.TbMsgLogEntity;
import com.framework.service.TbMsgConfigService;
import com.framework.service.TbMsgLogService;
import com.framework.utils.PageUtils;
import com.framework.utils.R;
import com.framework.utils.StringUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-25 14:30:01
 */
@Controller
@RequestMapping("tbmsglog")
public class TbMsgLogController {
    @Autowired
    private TbMsgLogService tbMsgLogService;

    @RequestMapping("/tbmsglog.html")
    public String list() {
        return "tbmsglog/tbmsglog.html";
    }

    @RequestMapping("/tbmsglog_add.html")
    public String add() {
        return "tbmsglog/tbmsglog_add.html";
    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("tbmsglog:list")
    public R list(Integer page, Integer limit) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        //查询列表数据
        List<TbMsgLogEntity> logEntities = tbMsgLogService.queryList(map);
        int total = tbMsgLogService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(logEntities, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("tbmsglog:info")
    public R info(@PathVariable("id") Integer id) {
        TbMsgLogEntity tbmsglog = tbMsgLogService.queryObject(Long.valueOf(id));

        return R.ok().put("tbmsglog", tbmsglog);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("tbmsglog:save")
    public R save(@RequestBody TbMsgLogEntity logEntity) {
        tbMsgLogService.save(logEntity);

        return R.ok();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("tbmsglog:update")
    public R update(@RequestBody TbMsgLogEntity logEntity) {
        tbMsgLogService.update(logEntity);
        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("tbmsglog:delete")
    public R delete(@RequestBody Long[] ids) {
        tbMsgLogService.deleteBatch(ids);

        return R.ok();
    }

}
