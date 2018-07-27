package com.framework.utils;

import org.apache.commons.lang3.StringUtils;

import java.net.InetAddress;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 字符串的一些实用操作
 *
 * @author ZENGCHAO
 */
public class StringUtil extends StringUtils {

    /**
     * 功能描述：分割字符串
     *
     * @param str       String 原始字符串
     * @param splitsign String 分隔符
     * @return String[] 分割后的字符串数组
     */
    public static String[] split(String str, String splitsign) {
        int index;
        if (str == null || splitsign == null) {
            return null;
        }
        ArrayList<String> al = new ArrayList<String>();
        while ((index = str.indexOf(splitsign)) != -1) {
            al.add(str.substring(0, index));
            str = str.substring(index + splitsign.length());
        }
        al.add(str);
        return (String[]) al.toArray(new String[0]);
    }


    public static String getStrByUrgencylevel(String urgencylevel) {
        String str = "";

        if ("2".equals(urgencylevel)) {
            str = "急办";
        }
        if ("1".equals(urgencylevel)) {
            str = "平办";
        }

        if ("3".equals(urgencylevel)) {
            str = "领导交办";
        }

        if ("4".equals(urgencylevel)) {
            str = "市委督办";
        }

        if ("5".equals(urgencylevel)) {
            str = "市政督办";
        }
        if ("6".equals(urgencylevel)) {
            str = "部门督办";
        }

        return str;
    }

    /**
     * 功能描述：替换字符串
     *
     * @param from   String 原始字符串
     * @param to     String 目标字符串
     * @param source String 母字符串
     * @return String 替换后的字符串
     */
    public static String replace(String from, String to, String source) {
        if (source == null || from == null || to == null)
            return null;
        StringBuffer str = new StringBuffer("");
        int index = -1;
        while ((index = source.indexOf(from)) != -1) {
            str.append(source.substring(0, index) + to);
            source = source.substring(index + from.length());
            index = source.indexOf(from);
        }
        str.append(source);
        return str.toString();
    }

    /**
     * 替换字符串，能能够在HTML页面上直接显示(替换双引号和小于号)
     *
     * @param str String 原始字符串
     * @return String 替换后的字符串
     */
    public static String htmlencode(String str) {
        if (str == null) {
            return null;
        }
        return replace("\"", "&quot;", replace("<", "&lt;", str));
    }

    /**
     * 替换字符串，将被编码的转换成原始码（替换成双引号和小于号）
     *
     * @param str String
     * @return String
     */
    public static String htmldecode(String str) {
        if (str == null) {
            return null;
        }

        return replace("&quot;", "\"", replace("&lt;", "<", str));
    }

    private static final String _BR = "<br/>";

    /**
     * 功能描述：在页面上直接显示文本内容，替换小于号，空格，回车，TAB
     *
     * @param str String 原始字符串
     * @return String 替换后的字符串
     */
    public static String htmlshow(String str) {
        if (str == null) {
            return null;
        }

        str = replace("<", "&lt;", str);
        str = replace(" ", "&nbsp;", str);
        str = replace("\r\n", _BR, str);
        str = replace("\n", _BR, str);
        str = replace("\t", "&nbsp;&nbsp;&nbsp;&nbsp;", str);
        return str;
    }

    /**
     * html字符串转换成纯字符串，删除所有html标签
     *
     * @param str
     * @return
     */
    public static String htmlToText(String str) {
        String regEx_script = "<script[^>]*?>[\\s\\S]*?<\\/script>"; // 定义script的正则表达式
        String regEx_style = "<style[^>]*?>[\\s\\S]*?<\\/style>"; // 定义style的正则表达式
        String regEx_html = "<[^>]+>"; // 定义HTML标签的正则表达式
        String regEx_space = "\\s*|\t|\r|\n";// 定义空格回车换行符

        Pattern p_script = Pattern.compile(regEx_script, Pattern.CASE_INSENSITIVE);
        Matcher m_script = p_script.matcher(str);
        str = m_script.replaceAll(""); // 过滤script标签

        Pattern p_style = Pattern.compile(regEx_style, Pattern.CASE_INSENSITIVE);
        Matcher m_style = p_style.matcher(str);
        str = m_style.replaceAll(""); // 过滤style标签

        Pattern p_html = Pattern.compile(regEx_html, Pattern.CASE_INSENSITIVE);
        Matcher m_html = p_html.matcher(str);
        str = m_html.replaceAll(""); // 过滤html标签

        Pattern p_space = Pattern.compile(regEx_space, Pattern.CASE_INSENSITIVE);
        Matcher m_space = p_space.matcher(str);
        str = m_space.replaceAll(""); // 过滤空格回车标签
        return str.trim();
    }

    /**
     * 功能描述：返回指定字节长度的字符串
     *
     * @param str    String 字符串
     * @param length int 指定长度
     * @return String 返回的字符串
     */
    public static String toLength(String str, int length) {
        if (str == null) {
            return null;
        }
        if (length <= 0) {
            return "";
        }
        try {
            if (str.getBytes("GBK").length <= length) {
                return str;
            }
        } catch (Exception e) {
        }
        StringBuffer buff = new StringBuffer();

        int index = 0;
        char c;
        length -= 3;
        while (length > 0) {
            c = str.charAt(index);
            if (c < 128) {
                length--;
            } else {
                length--;
                length--;
            }
            buff.append(c);
            index++;
        }
        buff.append("...");
        return buff.toString();
    }

    /**
     * 功能描述：判断是否为整数
     *
     * @param str 传入的字符串
     * @return 是整数返回true, 否则返回false
     */
    public static boolean isInteger(String str) {
        Pattern pattern = Pattern.compile("^[-\\+]?[\\d]+$");
        return pattern.matcher(str).matches();
    }

    /**
     * 判断字符串长度
     *
     * @param str
     * @return
     */
    public static boolean isLength(String str) {
        return (str.length() <= 6);
    }

    /**
     * 判断是否为浮点数，包括double和float
     *
     * @param str 传入的字符串
     * @return 是浮点数返回true, 否则返回false
     */
    public static boolean isDouble(String str) {
        Pattern pattern = Pattern.compile("^[-\\+]?\\d+\\.\\d+$");
        return pattern.matcher(str).matches();
    }

    /**
     * 判断是不是合法字符 c 要判断的字符
     */
    public static boolean isLetter(String str) {
        if (str == null || str.length() < 0) {
            return false;
        }
        Pattern pattern = Pattern.compile("[\\w\\.-_]*");
        return pattern.matcher(str).matches();
    }

    /**
     * 从指定的字符串中提取Email content 指定的字符串
     *
     * @param content
     * @return
     */
    public static String parse(String content) {
        String email = null;
        if (content == null || content.length() < 1) {
            return email;
        }
        // 找出含有@
        int beginPos;
        int i;
        String token = "@";
        String preHalf = "";
        String sufHalf = "";

        beginPos = content.indexOf(token);
        if (beginPos > -1) {
            // 前项扫描
            String s = null;
            i = beginPos;
            while (i > 0) {
                s = content.substring(i - 1, i);
                if (isLetter(s))
                    preHalf = s + preHalf;
                else
                    break;
                i--;
            }
            // 后项扫描
            i = beginPos + 1;
            while (i < content.length()) {
                s = content.substring(i, i + 1);
                if (isLetter(s))
                    sufHalf = sufHalf + s;
                else
                    break;
                i++;
            }
            // 判断合法性
            email = preHalf + "@" + sufHalf;
            if (isEmail(email)) {
                return email;
            }
        }
        return null;
    }

    /**
     * 功能描述：判断输入的字符串是否符合Email样式.
     *
     * @param email 传入的字符串
     * @return 是Email样式返回true, 否则返回false
     */
    public static boolean isEmail(String email) {
        if (email == null || email.length() < 1 || email.length() > 256) {
            return false;
        }
        Pattern pattern = Pattern.compile("^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$");
        return pattern.matcher(email).matches();
    }

    /**
     * 判断是否为手机号
     *
     * @param mobile
     * @return
     */
    public static boolean isMobile(String mobile) {
        if (isEmpty(mobile)) {
            return false;
        }
        Pattern pattern = Pattern.compile("^1[3|4|5|7|8][0-9]\\d{8}$");
        return pattern.matcher(mobile).matches();
    }


    /**
     * 功能描述：判断输入的字符串是否为纯汉字
     *
     * @param str 传入的字符窜
     * @return 如果是纯汉字返回true, 否则返回false
     */
    public static boolean isChinese(String str) {
        Pattern pattern = Pattern.compile("[\u0391-\uFFE5]+$");
        return pattern.matcher(str).matches();
    }

    /**
     * 功能描述：是否为空白 包括null和空格
     *
     * @param str
     * @return
     */
    public static boolean isBlank(String str) {
        return str == null || str.trim().length() == 0;
    }

    /**
     * 功能描述：是否不为空白 包括null和空格
     *
     * @param str
     * @return
     */
    public static boolean isNotBlank(String str) {
        return str != null && str.trim().length() > 0;
    }

    /**
     * 功能描述：是否为空白 不包括空格
     *
     * @param str
     * @return
     */
    public static boolean isEmpty(String str) {
        return str == null || str.length() == 0;
    }

    /**
     * 功能描述：是否不为空白 不包括空格
     *
     * @param str
     * @return
     */
    public static boolean isNotEmpty(String str) {
        return str != null && str.length() > 0;
    }

    /**
     * 功能描述：判断是否为质数
     *
     * @param x
     * @return
     */
    public static boolean isPrime(int x) {
        if (x <= 7) {
            if (x == 2 || x == 3 || x == 5 || x == 7)
                return true;
        }
        int c = 7;
        if (x % 2 == 0)
            return false;
        if (x % 3 == 0)
            return false;
        if (x % 5 == 0)
            return false;
        int end = (int) Math.sqrt(x);
        while (c <= end) {
            if (x % c == 0) {
                return false;
            }
            c += 4;
            if (x % c == 0) {
                return false;
            }
            c += 2;
            if (x % c == 0) {
                return false;
            }
            c += 4;
            if (x % c == 0) {
                return false;
            }
            c += 2;
            if (x % c == 0) {
                return false;
            }
            c += 4;
            if (x % c == 0) {
                return false;
            }
            c += 6;
            if (x % c == 0) {
                return false;
            }
            c += 2;
            if (x % c == 0) {
                return false;
            }
            c += 6;
        }
        return true;
    }

    /**
     * 功能描述：人民币转成大写
     *
     * @param str 数字字符串
     * @return String 人民币转换成大写后的字符串
     */
    public static String hangeToBig(String str) {
        double value;
        try {
            value = Double.parseDouble(str.trim());
        } catch (Exception e) {
            return null;
        }
        char[] hunit = {'拾', '佰', '仟'}; // 段内位置表示
        char[] vunit = {'万', '亿'}; // 段名表示
        char[] digit = {'零', '壹', '贰', '叁', '肆', '伍', '陆', '柒', '捌', '玖'}; // 数字表示
        long midVal = (long) (value * 100); // 转化成整形
        String valStr = String.valueOf(midVal); // 转化成字符串

        String head = valStr.substring(0, valStr.length() - 2); // 取整数部分
        String rail = valStr.substring(valStr.length() - 2); // 取小数部分

        String prefix = ""; // 整数部分转化的结果
        String suffix = ""; // 小数部分转化的结果
        // 处理小数点后面的数
        if (rail.equals("00")) { // 如果小数部分为0
            suffix = "整";
        } else {
            suffix = digit[rail.charAt(0) - '0'] + "角" + digit[rail.charAt(1) - '0'] + "分"; // 否则把角分转化出来
        }
        // 处理小数点前面的数
        char[] chDig = head.toCharArray(); // 把整数部分转化成字符数组
        char zero = '0'; // 标志'0'表示出现过0
        byte zeroSerNum = 0; // 连续出现0的次数
        for (int i = 0; i < chDig.length; i++) { // 循环处理每个数字
            int idx = (chDig.length - i - 1) % 4; // 取段内位置
            int vidx = (chDig.length - i - 1) / 4; // 取段位置
            if (chDig[i] == '0') { // 如果当前字符是0
                zeroSerNum++; // 连续0次数递增
                if (zero == '0') { // 标志
                    zero = digit[0];
                } else if (idx == 0 && vidx > 0 && zeroSerNum < 4) {
                    prefix += vunit[vidx - 1];
                    zero = '0';
                }
                continue;
            }
            zeroSerNum = 0; // 连续0次数清零
            if (zero != '0') { // 如果标志不为0,则加上,例如万,亿什么的
                prefix += zero;
                zero = '0';
            }
            prefix += digit[chDig[i] - '0']; // 转化该数字表示
            if (idx > 0)
                prefix += hunit[idx - 1];
            if (idx == 0 && vidx > 0) {
                prefix += vunit[vidx - 1]; // 段结束位置应该加上段名如万,亿
            }
        }

        if (prefix.length() > 0)
            prefix += '圆'; // 如果整数部分存在,则有圆的字样
        return prefix + suffix; // 返回正确表示
    }

    /**
     * 功能描述：去掉字符串中重复的子字符串
     *
     * @param str 原字符串，如果有子字符串则用空格隔开以表示子字符串
     * @return String 返回去掉重复子字符串后的字符串
     */
    public static String removeSameString(String str) {
        Set<String> mLinkedSet = new LinkedHashSet<String>();// set集合的特征：其子集不可以重复
        String[] strArray = str.split(" ");// 根据空格(正则表达式)分割字符串
        StringBuffer sb = new StringBuffer();

        for (int i = 0; i < strArray.length; i++) {
            if (!mLinkedSet.contains(strArray[i])) {
                mLinkedSet.add(strArray[i]);
                sb.append(strArray[i] + " ");
            }
        }
        return sb.toString();
    }

    /**
     * 功能描述：过滤特殊字符
     *
     * @param src
     * @return
     */
    public static String encoding(String src) {
        if (src == null)
            return "";
        StringBuilder result = new StringBuilder();
        if (src != null) {
            src = src.trim();
            for (int pos = 0; pos < src.length(); pos++) {
                switch (src.charAt(pos)) {
                    case '\"':
                        result.append("&quot;");
                        break;
                    case '<':
                        result.append("&lt;");
                        break;
                    case '>':
                        result.append("&gt;");
                        break;
                    case '\'':
                        result.append("&apos;");
                        break;
                    case '&':
                        result.append("&amp;");
                        break;
                    case '%':
                        result.append("&pc;");
                        break;
                    case '_':
                        result.append("&ul;");
                        break;
                    case '#':
                        result.append("&shap;");
                        break;
                    case '?':
                        result.append("&ques;");
                        break;
                    default:
                        result.append(src.charAt(pos));
                        break;
                }
            }
        }
        return result.toString();
    }

    /**
     * 功能描述：判断是不是合法的手机号码
     *
     * @param handset
     * @return boolean
     */
    public static boolean isHandset(String handset) {
        try {
            String regex = "^1[\\d]{10}$";
            Pattern pattern = Pattern.compile(regex);
            Matcher matcher = pattern.matcher(handset);
            return matcher.matches();

        } catch (RuntimeException e) {
            return false;
        }
    }

    /**
     * 功能描述：反过滤特殊字符
     *
     * @param src
     * @return
     */
    public static String decoding(String src) {
        if (src == null)
            return "";
        String result = src;
        result = result.replace("&quot;", "\"").replace("&apos;", "\'");
        result = result.replace("&lt;", "<").replace("&gt;", ">");
        result = result.replace("&amp;", "&");
        result = result.replace("&pc;", "%").replace("&ul", "_");
        result = result.replace("&shap;", "#").replace("&ques", "?");
        return result;
    }

    /**
     * 数组转换成String 默认分隔符为,
     *
     * @param objects
     * @return
     */
    public static String toString(Object[] objects) {
        if (ObjectUtil.isNull(objects))
            return null;
        if (objects.length == 0)
            return "";
        StringBuffer sb = new StringBuffer();
        for (Object obj : objects) {
            sb.append(',').append(ObjectUtil.toString(obj));
        }
        return sb.substring(1);
    }

    /**
     * 数组转换成String
     *
     * @param objects
     * @param splitStr
     * @return
     */
    public static String toString(Object[] objects, String splitStr) {
        if (ObjectUtil.isNull(objects))
            return null;
        if (objects.length == 0)
            return "";
        StringBuffer sb = new StringBuffer();
        for (Object obj : objects) {
            sb.append(splitStr).append(ObjectUtil.toString(obj));
        }
        return sb.substring(1);
    }

    /**
     * 集合转换成String 默认分隔符为,
     *
     * @param coll
     * @return
     */
    public static String toString(Collection<?> coll) {
        if (ObjectUtil.isNull(coll))
            return null;
        if (coll.size() == 0)
            return "";
        StringBuffer sb = new StringBuffer();
        for (Object obj : coll) {
            sb.append(',').append(ObjectUtil.toString(obj));
        }
        return sb.substring(1);
    }

    /**
     * 集合转换成String
     *
     * @param coll
     * @param splitStr
     * @return
     */
    public static String toString(Collection<?> coll, String splitStr) {
        if (ObjectUtil.isNull(coll))
            return null;
        if (coll.size() == 0)
            return "";
        StringBuffer sb = new StringBuffer();
        for (Object obj : coll) {
            sb.append(splitStr).append(ObjectUtil.toString(obj));
        }
        return sb.substring(1);
    }

    /**
     * 获取指定个数的相同字符串
     *
     * @param str
     * @param length
     * @param splitStr
     * @return
     */
    public static String toSameString(String str, int length, String splitStr) {
        if (ObjectUtil.isNull(str))
            return null;
        if (length <= 0)
            return "";
        if (length == 1)
            return str;
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            sb.append(splitStr).append(str);
        }
        return sb.substring(1);
    }

    /**
     * 转换成Int数组
     *
     * @param str
     * @param splitStr
     * @return
     */
    public static Integer[] toIntArray(String str, String splitStr) {
        if (ObjectUtil.isNull(str))
            return null;
        if (StringUtil.isEmpty(str))
            return null;
        String[] array = str.split(splitStr);
        Integer[] array2 = new Integer[array.length];
        for (int i = 0; i < array.length; i++) {
            array2[i] = Integer.parseInt(array[i]);
        }
        return array2;
    }

    /**
     * 是否包含某个字符串
     *
     * @param strs
     * @param str
     * @return
     */
    public static boolean hasStr(String[] strs, String str) {
        if (ObjectUtil.isNotNull(strs) && ObjectUtil.isNotNull(str)) {
            for (String s : strs) {
                if (str.equals(s)) {
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * 快捷替换 举例: 源字符串 "insert into {0} values({1},{2})" 传入参数为 test、id、name
     * 替换后的字符串为 "insert into test value(id,name)"
     *
     * @param str
     * @param args
     * @return
     */
    public static String replaceRegex(String str, Object... args) {
        if (ObjectUtil.isNull(args))
            return str;
        for (int i = 0; i < args.length; i++) {
            String arg = args[i].toString();
            str = str.replace("{" + i + "}", arg);
        }
        return str;
    }

    /**
     * 字符串分离后，每个子元素左右两侧拼接单引号
     *
     * @param str
     * @return
     */
    public static String splitAndDpk(String str) {
        String[] array = str.split(",");
        String temp = "";
        for (int i = 0; i < array.length; i++) {
            String s = array[i];
            if (s.startsWith("'") || s.endsWith("'"))
                continue;
            s = "'" + s + "'";

            temp += "," + s;
        }
        if (temp.length() > 0)
            str = temp.substring(1);
        return str;
    }

    /**
     * 获取文件后缀名，不包含.
     *
     * @param fileName
     * @return
     */
    public static String getSuffix(String fileName) {
        String suffix = "";
        if (fileName.lastIndexOf(".") > 0)
            suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
        return suffix;
    }

    /**
     * null转空字符串
     *
     * @return
     */
    public static String null2String(String str) {
        if (ObjectUtil.isNull(str))
            return "";
        else
            return str;
    }

    /**
     * 首字母变大写
     *
     * @param str
     */
    public static String firstUpperCase(String str) {
        if (ObjectUtil.isNull(str) || StringUtil.isEmpty(str))
            return "";
        if (str.length() == 1)
            return str.toUpperCase();
        else
            return str.substring(0, 1).toUpperCase() + str.substring(1);
    }

    /**
     * 首字母变小写
     *
     * @param str
     */
    public static String firstLowerCase(String str) {
        if (ObjectUtil.isNull(str) || StringUtil.isEmpty(str))
            return "";
        if (str.length() == 1)
            return str.toLowerCase();
        else
            return str.substring(0, 1).toLowerCase() + str.substring(1);
    }

    /**
     * 检查字符串是否为空
     *
     * @param str
     * @return
     */
    public static String checkIsNull(String str) {
        if ((str == null) || ("".equals(str)) || "null".equals(str)) {
            return "";
        }
        return str;
    }

    public static String getLocalIp() {
        InetAddress addr = null;
        String ip = "";
        // String address = "";
        try {
            addr = InetAddress.getLocalHost();
            ip = addr.getHostAddress().toString();// 获得本机IP
            // address = addr.getHostName().toString();// 获得本机名称
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ip;
    }

    public static void main(String[] args) {
        System.out.println(StringUtil.getLocalIp());
    }
}
