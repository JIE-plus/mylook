package com.muldini.mylook.common;

import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;

import com.muldini.mylook.entity.User;

public final class UserUtils {

    private UserUtils() {
    }

    public final static boolean checkIfFanExists(List userList, String name) {

        boolean result = false;
        if (StringUtils.isNotEmpty(name) && userList != null && userList.size() > 0) {
            for (int i = 0; i < userList.size(); i++) {
                User user = new User();
                user = (User)userList.get(i);
                if (name.equals(user.getUsername())) {
                    result = true;
                    break;
                }
            }
        }
        return result;
    }

    public final static String resultUrl(String path) {

        int index = path.lastIndexOf("/");
        String newString = path.substring(index + 1);

        int newIndex = newString.indexOf(".");
        String url = newString.substring(0, newIndex);

        return url;

    }

    public final static String resultPath(String url) {

        int index = url.lastIndexOf("=");
        String path = url.substring(index + 1);

        // int newIndex = newString.indexOf("=");
        // String path = newString.substring(newIndex + 1,newString.length());

        return path;

    }

    /**
     * 根据一个字符把字符串截取成多段字符串
     */

    public final static List<String> resultPathArray(String url, String splitChar) {

        String[] pathArray = url.split(splitChar);// 调用API方法按照逗号分隔字符串
        List<String> result = Arrays.asList(pathArray);

        return result;
    }

    /**
     * 三个字符串的拼接
     */
    public final static String resultString(String strOne, String strTwo, String strThree) {

        StringBuilder buf = new StringBuilder(strOne.length() + strTwo.length() + strThree.length());
        buf.append(strOne);
        buf.append(strTwo);
        buf.append(strThree);
        String result = buf.toString();
        
        return result;
    }
    
    /**
     * @param numOne 总数
     * @param numTwo 每页记录数
     * @return
     * @author:lianss
     * @createTime:2020年6月10日 下午2:58:09
     */
    public final static int resultint(int numOne, int numTwo) {
       
       int result = 0;
       
       if((numOne / numTwo) < 1){
           result = 1;
       }else{
           if((numOne % numTwo) == 0){
               result = numOne / numTwo;
           }else{
               result = (numOne / numTwo) + 1;
           }
       }
        
        return result;
    }

    /**
     * 正则表达式校验
     */
    public final static boolean checkString(String regex, String inputString) {
        Pattern pattern = Pattern.compile(regex);
        Matcher match = pattern.matcher(inputString);
        boolean result = match.matches();
        return result;
    }

}
