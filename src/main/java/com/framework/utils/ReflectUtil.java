package com.framework.utils;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ReflectUtil {
    public static <M> Object getFieldValue(M m, String fieldName) {
        Object value = null;
        try {
            Field field = m.getClass().getDeclaredField(fieldName);
            if (field != null) {
                field.setAccessible(true);
                value = field.get(m);
            }
        } catch (SecurityException e) {
            e.printStackTrace();
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return value;
    }

    /**
     * 字段名不区分大小写
     * 性能比getFieldValue低
     *
     * @param m
     * @param fieldName
     * @return
     */
    public static <M> Object getFieldValueNoCaseSensitive(M m, String fieldName) {
        Object value = null;
        try {
            Field[] fields = m.getClass().getDeclaredFields();
            Field f = null;
            for (Field f1 : fields) {
                if (f1.getName().toLowerCase().equals(fieldName.toLowerCase())) {
                    f = f1;
                    break;
                }
            }
            if (f != null)
                value = getFieldValue(m, f.getName());
        } catch (SecurityException e) {
            e.printStackTrace();
        }
        return value;
    }

    public static <M> void setFieldValue(M m, String fieldName,
                                         Object fieldValue) {
        try {
            Field[] fields = m.getClass().getDeclaredFields();
            if (fields != null) {
                for (Field f : fields) {
                    f.setAccessible(true);
                    if (f.getName().toLowerCase()
                            .equals(fieldName.trim().toLowerCase())) {
                        f.set(m, fieldValue);
                    }
                }
            }
        } catch (SecurityException e) {
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    public static Class<?> forName(String className) {
        try {
            return Class.forName(className);
        } catch (ClassNotFoundException e) {
            return null;
        }
    }

}
