package com.framework.controller;

import com.framework.entity.SysUserEntity;
import com.framework.entity.TbBanliEntity;
import com.framework.entity.TbTextEntity;
import com.framework.service.TbBanliService;
import com.framework.service.TbTextService;
import com.framework.utils.DateUtil;
import com.framework.utils.PageUtils;
import com.framework.utils.R;
import com.framework.utils.StringUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;


/**
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-15 08:31:10
 */
@Controller
@RequestMapping("mywork")
public class MyWorkController extends AbstractController {
    @Autowired
    private TbBanliService banliService;

    @RequestMapping("/mywork.html")
    public String list() {
        return "work/mywork.html";
    }

    @RequestMapping("/do.html")
    public String sssdo() {
        return "work/do.html";
    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list/{type}")
    @RequiresPermissions("work:list")
    public R list(Integer page, Integer limit, @PathVariable String type) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        SysUserEntity userEntity = getUser();
        map.put("toUserId", userEntity.getUserId());

        //查询列表数据
        List<TbBanliEntity> banliEntities = new ArrayList<TbBanliEntity>();
        int total = 0;
        if (StringUtil.isNotBlank(type)) {
            if ("notdo".equals(type)) {
                map.put("state", 0);
                banliEntities = banliService.queryList(map);
                total = banliService.queryTotal(map);
            } else {
                banliEntities = banliService.queryList2(map);
                total = banliService.queryTotal2(map);
            }
        }

        PageUtils pageUtil = new PageUtils(banliEntities, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


}
