package com.framework.controller;

import com.framework.entity.SysUserEntity;
import com.framework.entity.TbTextEntity;
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

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-15 08:31:10
 */
@Controller
@RequestMapping("tbtext")
public class TbTextController extends AbstractController {
    @Autowired
    private TbTextService tbTextService;

    @RequestMapping("/tbtext.html")
    public String list() {
        return "tbtext/tbtext.html";
    }

    @RequestMapping("/tbtext_add.html")
    public String add() {
        return "tbtext/tbtext_add.html";
    }

    @RequestMapping("/tbtext_info.html")
    public String info() {
        return "tbtext/tbtext_info.html";
    }

    @RequestMapping("/image_attach.html")
    public String image_attach() {
        return "tbtext/image_attach.html";
    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list/{type}")
    @RequiresPermissions("tbtext:list")
    public R list(Integer page, Integer limit, @PathVariable String type) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        if (StringUtil.isNotBlank(type)) {
            map.put("type", type);
        }
        SysUserEntity userEntity = getUser();

        if ("0".equals(type) || "2".equals(type)) {
            if (userEntity.getUserId() == 1L) {
                //看到所有
            } else {
                // map.put("userid", userEntity.getUserId());
            }
        }
        //查询列表数据
        List<TbTextEntity> tbTextList = tbTextService.queryList(map);
        int total = tbTextService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(tbTextList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("tbtext:info")
    public R info(@PathVariable("id") Long id) {
        TbTextEntity tbText = tbTextService.queryObject(id);

        return R.ok().put("tbText", tbText);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("tbtext:save")
    public R save(@RequestBody TbTextEntity tbText) throws Exception {
        logger.info(tbText.toString());
        if (StringUtil.isNotEmpty(tbText.getContentStr())) {
            tbText.setContent(tbText.getContentStr());
        }
        tbText.setUserid(getUser().getUserId() + "");
        tbText.setCreatetime(DateUtil.formatDateYYYY_MM_DD_HH_MM_SS(new Date()));
        tbTextService.save(tbText);
        return R.ok();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("tbtext:update")
    public R update(@RequestBody TbTextEntity tbText) {
        logger.info(tbText.toString());
        if (StringUtil.isNotEmpty(tbText.getContentStr())) {
            tbText.setContent(tbText.getContentStr());
        }
        tbText.setUserid(getUser().getUserId() + "");
        tbText.setCreatetime(DateUtil.formatDateYYYY_MM_DD_HH_MM_SS(new Date()));
        tbTextService.update(tbText);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("tbtext:delete")
    public R delete(@RequestBody Long[] ids) {
        SysUserEntity sysUserEntity = getUser();
        if (sysUserEntity.getUserId() == 1L) {
            tbTextService.deleteBatch(ids);
            return R.ok();
        } else {
            return R.error("当前操作人员无删除权限!");
        }
    }


    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/fuckout")
    @RequiresPermissions("tbtext:delete")
    public R fuckout(@RequestBody Long[] ids) {
        SysUserEntity sysUserEntity = getUser();
        if (sysUserEntity.getUserId() == 1L) {
            for (Long id : ids) {
                TbTextEntity text_dest = new TbTextEntity();
                TbTextEntity text = this.tbTextService.queryObject(id);
                BeanUtils.copyProperties(text, text_dest);
                text_dest.setType("1");
                text_dest.setCreatetime(DateUtil.formatDateYYYY_MM_DD_HH_MM_SS(new Date()));
                text_dest.setUserid(sysUserEntity.getUserId() + "");
                this.tbTextService.save(text_dest);
            }
            return R.ok();
        } else {
            return R.error("当前操作人员无删除权限!");
        }
    }

}
