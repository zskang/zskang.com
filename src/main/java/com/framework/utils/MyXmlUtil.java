package com.framework.utils;

import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import org.jdom.Document;
import org.jdom.input.SAXBuilder;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;

/**
 * 读取一个xml文件返回string
 *
 * @author zg
 */
public class MyXmlUtil {
    /**
     * 加载xml文件
     *
     * @return Document
     */
    public static Document load(String filePath) {
        Document document = null;
        try {
            SAXBuilder reader = new SAXBuilder();
            document = (Document) reader.build(new File(filePath));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return document;
    }

    /**
     * 将xml文件转换为String串
     *
     * @return
     */
    public static String XmlToString(String filePath) {
        Document document = null;
        document = load(filePath);

        Format format = Format.getPrettyFormat();
        format.setEncoding("UTF-8");//设置编码格式

        StringWriter out = null; //输出对象
        String sReturn = ""; //输出字符串
        XMLOutputter outputter = new XMLOutputter();
        out = new StringWriter();
        try {
            outputter.output(document, out);
        } catch (IOException e) {
            e.printStackTrace();
        }
        sReturn = out.toString();
        return sReturn;
    }
}
