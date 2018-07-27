package com.framework.controller;

import com.framework.entity.TbFileAttachEntity;
import com.framework.service.TbFileAttachService;
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


/**
 * @author Zskang_love
 * @email 253479240@qq.com
 * @date 2017-07-03 09:06:47
 */
@Controller
@RequestMapping("tbfileattach")
public class TbFileAttachController extends AbstractController {
    @Autowired
    private TbFileAttachService tbFileAttachService;

    @RequestMapping("/tbfileattach.html")
    public String list() {
        return "tbfileattach/tbfileattach.html";
    }

    @RequestMapping("/tbfileattach_add.html")
    public String add() {
        return "tbfileattach/tbfileattach_add.html";
    }

    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list/{uuid}/{state}")
    public R list(Integer page, Integer limit, @PathVariable String uuid, @PathVariable String state) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        if (StringUtil.isNotBlank(uuid)) {
            map.put("uuid", uuid);
        }
        if (StringUtil.isNotBlank(state)) {
            map.put("state", state);
        }
        //查询列表数据
        List<TbFileAttachEntity> tbFileAttachList = tbFileAttachService.queryList(map);
        int total = tbFileAttachService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(tbFileAttachList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{id}")
    @RequiresPermissions("tbfileattach:info")
    public R info(@PathVariable("id") Integer id) {
        TbFileAttachEntity tbFileAttach = tbFileAttachService.queryObject(id);
        String fileName = tbFileAttach.getFilename();
        if (StringUtil.isNotBlank(fileName)) {
            String filename_ = fileName.substring(0, fileName.lastIndexOf("."));
            String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
            tbFileAttach.setFilename(filename_);
            tbFileAttach.setFiletype(suffix);
        }
        return R.ok().put("tbFileAttach", tbFileAttach);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("tbfileattach:save")
    public R save(@RequestBody TbFileAttachEntity tbFileAttach) {
        tbFileAttachService.save(tbFileAttach);

        return R.ok();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("tbfileattach:update")
    public R update(@RequestBody TbFileAttachEntity tbFileAttach) {
        String fileName = tbFileAttach.getFilename();
        if (!StringUtil.isNotBlank(fileName)) {
            return R.error("文件名称不能为空！");
        }
        String fileNames = fileName + "." + tbFileAttach.getFiletype();
        tbFileAttach.setFilename(fileNames);
        tbFileAttach.setFiletype(tbFileAttach.getFiletype());
        tbFileAttachService.update(tbFileAttach);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("tbfileattach:delete")
    public R delete(@RequestBody Long[] ids) {
        tbFileAttachService.deleteBatch(ids);

        return R.ok();
    }

    /**
     * 下载
     */
    @ResponseBody
    @RequestMapping("/download")
    @RequiresPermissions("tbfileattach:download")
    public R download(@RequestBody Long id) {
        if (StringUtil.isNotBlank(id + "")) {
            TbFileAttachEntity entity = this.tbFileAttachService.queryObject(id.intValue());
            String filePath = entity.getFilepath();
            logger.info(filePath);

        }

        return R.ok();
    }

}
