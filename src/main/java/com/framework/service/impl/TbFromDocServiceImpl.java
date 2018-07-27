package com.framework.service.impl;

import com.framework.dao.TbFileAttachDao;
import com.framework.dao.TbFromDocDao;
import com.framework.entity.TbFileAttachEntity;
import com.framework.entity.TbFromDocEntity;
import com.framework.service.TbFromDocService;
import com.framework.utils.DateUtil;
import com.framework.utils.PropertiesUtils;
import com.framework.utils.StringUtil;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.*;


@Service("tbFromDocService")
public class TbFromDocServiceImpl implements TbFromDocService {
    protected Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private TbFromDocDao tbFromDocDao;

    @Autowired
    private TbFileAttachDao fujDao;

    @Override
    public TbFromDocEntity queryObject(Long fromDocId) {
        return tbFromDocDao.queryObject(fromDocId);
    }

    @Override
    public List<TbFromDocEntity> queryList(Map<String, Object> map, String type) {
        if ("0".equals(type)) {
            return tbFromDocDao.queryList(map);
        }
        if ("1".equals(type)) {
            return tbFromDocDao.queryList4kz(map);
        }
        if ("2".equals(type)) {
            return tbFromDocDao.queryList4ld(map);
        }
        if ("4".equals(type)) {
            return tbFromDocDao.queryList4Batch();
        }
        return null;
    }

    @Override
    public int queryTotal(Map<String, Object> map, String type) {
        if ("0".equals(type)) {
            return tbFromDocDao.queryTotal(map);
        }
        if ("1".equals(type)) {
            return tbFromDocDao.queryTotal4kz(map);
        }
        if ("2".equals(type)) {
            return tbFromDocDao.queryTotal4ld(map);
        }

        return tbFromDocDao.queryTotal(map);
    }

    @Override
    public void save(TbFromDocEntity tbFromDoc) {
        tbFromDocDao.save(tbFromDoc);
    }

    @Override
    public void update(TbFromDocEntity tbFromDoc) {
        tbFromDocDao.update(tbFromDoc);
    }

    @Override
    public void delete(String uuid) {
        tbFromDocDao.delete(uuid);
    }

    @Override
    public void deleteBatch(String[] fromDocIds) {
        tbFromDocDao.deleteBatch(fromDocIds);
    }

    @Override
    public void saveFile2Db(String uuid) {
        Map<String,Object> mp=new HashMap<String, Object>();
        mp.put("uuid",uuid);
        TbFromDocEntity e=this.tbFromDocDao.queryObjectByUUID(mp);
        Properties p = PropertiesUtils.getPropertiesByName("config");
        if (p != null) {
            String uploadFilePath = p.getProperty("uploadFilePath");
            //  String rmi_filepath = p.getProperty("rmi_filepath");
            logger.info("配置的路径为：" + uploadFilePath);
            if (StringUtil.isNotBlank(uploadFilePath)) {
                String destPath = uploadFilePath + File.separator + uuid + File.separator;
                logger.info("已经上传的目标路径为：" + destPath);
                File destFilePath = new File(destPath);
                if (destFilePath.exists()) {
                    if (!destFilePath.isDirectory()) {
                        logger.error("目标 不是文件夹！");
                    } else {
                        logger.info("---开始检索 文件夹 下文件 列表。。。" + destPath);
                        String[] filelist = destFilePath.list();
                        logger.info("当前文件夹下 存在文件数量为 " + filelist.length);
                        for (int i = 0; i < filelist.length; i++) {
                            TbFileAttachEntity entity = new TbFileAttachEntity();
                            File readfile = new File(destFilePath + File.separator + filelist[i]);
                            String fileName = readfile.getName();
                            String prefix=fileName.substring(fileName.lastIndexOf("."));
                           // String filePath = destPath + fileName;
                            System.out.println("name=" + readfile.getName());
                            if (!"StaticState.xml".equals(fileName)) {
                                entity.setCreatetime(DateUtil.format(new Date(), "yyyy-MM-dd HH:mm:ss"));
                                entity.setFilename(e.getTitle()+"_"+(i+1)+"."+prefix);
                                entity.setFilepath("/static_res/jyjuploadfiles/" + uuid + File.separator + fileName);
                                entity.setYwid(uuid);
                                entity.setState(3);
                                fujDao.save(entity);
                            }
                        }
                    }
                } else {
                    System.out.println("文件路径" + destFilePath + "有问题......");
                }
            }
        }
    }
    //    @Override
//    public String queryMaxRegistNumber(HashMap<String, Object> map) {
//        return tbFromDocDao.queryMaxRegistNumber(map);
//    }
    @Override
    public String queryMaxRegistNumber() {
        return tbFromDocDao.queryMaxRegistNumber();
    }


    @Override
    public TbFromDocEntity queryObjectByUUID(String uuid) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("uuid", uuid);
        return tbFromDocDao.queryObjectByUUID(map);
    }

    @Override
    public void deleteBatchByUUid(String[] uuids) {
        tbFromDocDao.deleteBatchByUUid(uuids);
    }


}
