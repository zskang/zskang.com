package com.framework.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by Administrator on 2017/7/2/002.
 */
public class LoggerUtil {
    static Logger logger = LoggerFactory.getLogger(LoggerUtil.class);

    public static void info(Object o) {
        if (o != null) {
            logger.info("当前信息：" + o.toString());
        }
    }
}
