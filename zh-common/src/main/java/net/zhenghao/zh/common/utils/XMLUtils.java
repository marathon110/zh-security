package net.zhenghao.zh.common.utils;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Iterator;

/**
 * 🙃
 * 🙃 xml格式工具类
 * 🙃 使用dom4j转换
 *
 * @author:zhaozhenghao
 * @Email :736720794@qq.com
 * @date :2018/4/20 15:12
 * XMLUtils.java
 */
public class XMLUtils {

    private static Logger LOGGER = LoggerFactory.getLogger(XMLUtils.class);

    /**
     * xml转bean实体类
     * @param xml xml格式字符串
     * @param clazz 该实体类的元类型
     * @return 该实体类对象
     */
    public static <T> T xmlToBean(String xml, Class<T> clazz) {
        if (xml.length() <= 0 || xml == null) {
            return null;
        }
        try {
            //将字符串转换为xml文档对象
            Document document = DocumentHelper.parseText(xml);
            //获取文档的根节点
            Element root = document.getRootElement();
            //遍历根节点下所有子节点
            Iterator<?> iterator = root.elementIterator();
            //利用反射机制，调用set方法
            while (iterator.hasNext()) {
                Element element = (Element) iterator.next();
                //获取set方法中的参数字段(实体类的属性)
                Field field = clazz.getDeclaredField(element.getName());
                //获取set方法，field.getType()获取他的参数数据类型
                Method method = clazz.getDeclaredMethod("set"+element.getName(), field.getType());
                //调用set方法
                method.invoke(clazz, element.getText());
            }
        } catch (Exception e) {
            LOGGER.error("xml转换bean异常", e.getMessage());
            e.printStackTrace();
        }
        return (T) clazz;
    }
}
