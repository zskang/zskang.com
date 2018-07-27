package com.framework.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by zskang on 2017/7/4.
 */
public class PropertiesUtils {


    public static Properties getPropertiesByName(String name) {

        Properties p = new Properties();

        try {
            InputStream inputStream = PropertiesUtils.class.getClassLoader().getResourceAsStream(
                    name + ".properties");

            p.load(inputStream);

        } catch (IOException e1) {
            e1.printStackTrace();
        }

        return p;
    }
}
