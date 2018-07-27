package com.framework.utils;

import net.sf.json.JSONObject;
import org.dom4j.*;

import java.util.*;

/**
 * Created by zskang on 2017/8/11.
 */
public class ParseXmlUtil {

    public static void main(String[] args) {
        String filePath = "/Users/zskang/Documents/uploads4test/zxb/static_res/jyjuploadfiles/e14e5583-727b-4de1-b473-9d7f0b2fab13/StaticState.xml";
        // 获取一个xml文件
        String textFromFile = MyXmlUtil.XmlToString(filePath);
        //将xml解析为Map
     //   Map resultMap = xml2map(textFromFile);
        //将xml解析为Json
          String resultJson = xml2Json(textFromFile);
    }

    /**
     * 将xml格式响应报文解析为Json格式
     *
     * @param responseXmlTemp
     * @return
     */
    public static String xml2Json(String responseXmlTemp) {
        Document doc = null;
        try {
            doc = DocumentHelper.parseText(responseXmlTemp);
        } catch (DocumentException e) {
            System.out.println("parse text error : " + e);
        }
        Element rootElement = doc.getRootElement();
        Map<String, Object> mapXml = new HashMap<String, Object>();
        element2Map(mapXml, rootElement);
        String jsonXml = JSONObject.fromObject(mapXml).toString();
        System.out.println("Json >>> " + jsonXml);
        return jsonXml;
    }

    /**
     * 将xml格式响应报文解析为Map格式
     *
     * @param responseXmlTemp
     * @return
     * @throws DocumentException
     */
    public static Map<String, Object> xml2map(String responseXmlTemp) {
        Document doc = null;
        try {
            doc = DocumentHelper.parseText(responseXmlTemp);
        } catch (DocumentException e) {
            System.out.println("parse text error : " + e);
        }
        Element rootElement = doc.getRootElement();
        Map<String, Object> mapXml = new HashMap<String, Object>();
        element2Map(mapXml, rootElement);
        System.out.println("Map >>> " + mapXml);

        return mapXml;
    }

    /**
     * 使用递归调用将多层级xml转为map
     *
     * @param map
     * @param rootElement
     */
    public static void element2Map(Map<String, Object> map, Element rootElement) {

        //获得当前节点的子节点
        List<Element> elements = rootElement.elements();
        if (elements.size() == 0) {
            //没有子节点说明当前节点是叶子节点，直接取值
            map.put(rootElement.getName(), rootElement.getText());
        } else if (elements.size() == 1) {
            //只有一个子节点说明不用考虑list的情况，继续递归
            Map<String, Object> tempMap = new HashMap<String, Object>();
            element2Map(tempMap, elements.get(0));
            map.put(rootElement.getName(), tempMap);
        } else {
            //多个子节点的话就要考虑list的情况了，特别是当多个子节点有名称相同的字段时
            Map<String, Object> tempMap = new HashMap<String, Object>();
            for (Element element : elements) {
                tempMap.put(element.getName(), null);
            }
            Set<String> keySet = tempMap.keySet();
            for (String string : keySet) {
                Namespace namespace = elements.get(0).getNamespace();
                List<Element> sameElements = rootElement.elements(new QName(string, namespace));
                //如果同名的数目大于1则表示要构建list
                if (sameElements.size() > 1) {
                    List<Map> list = new ArrayList<Map>();
                    for (Element element : sameElements) {
                        Map<String, Object> sameTempMap = new HashMap<String, Object>();
                        element2Map(sameTempMap, element);
                        list.add(sameTempMap);
                    }
                    map.put(string, list);
                } else {
                    //同名的数量不大于1直接递归
                    Map<String, Object> sameTempMap = new HashMap<String, Object>();
                    element2Map(sameTempMap, sameElements.get(0));
                    map.put(string, sameTempMap);
                }
            }
        }
    }
}
