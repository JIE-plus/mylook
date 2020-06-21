package com.muldini.mylook.common;

import java.util.ArrayList;
import java.util.List;

import com.muldini.mylook.entity.User;
import com.muldini.mylook.entity.Video;

public final class IndexUtils {

    private IndexUtils() {

    }
    
    
    /**
     * 生成不重复的随机数，max是取不到的
     * @param min
     * @param max
     * @param n
     * @return
     * @author:lianss
     * @createTime:2020年5月24日 下午3:13:13
     */
    public final static int[] getHobbyIdArray(int min, int max, int n) {

        if (n > (max - min + 1) || max < min) {
            return null;
        }
        int[] result = new int[n];
        int count = 0;
        while (count < n) {
            int num = (int)(Math.random() * (max - min)) + min;
            boolean flag = true;
            for (int j = 0; j < n; j++) {
                if (num == result[j]) {
                    flag = false;
                    break;
                }
            }
            if (flag) {
                result[count] = num;
                count++;
            }
        }
        return result;
    }
    
    /**
     * 检查第一模块是否与随机数重复
     * @param hobbyIdArray
     * @param moduleFirstHobbyId
     * @return
     * @author:lianss
     * @createTime:2020年6月2日 下午3:23:57
     */
    public final static int[] checkHobbyIdArray(int[] hobbyIdArray, int moduleFirstHobbyId){
        
        int count = 0;
        int[] result = new int[4];
        
        for(int i = 0;i < hobbyIdArray.length;i++){
            if(moduleFirstHobbyId == hobbyIdArray[i]){
                count = i;
                break;
            }
            count++;
        }
        
        if(count == 0){
            result[0] = hobbyIdArray[1];
            result[1] = hobbyIdArray[2];
            result[2] = hobbyIdArray[3];
        }else if(count == 1){
            result[0] = hobbyIdArray[0];
            result[1] = hobbyIdArray[2];
            result[2] = hobbyIdArray[3];
        }else if(count == 2){
            result[0] = hobbyIdArray[0];
            result[1] = hobbyIdArray[1];
            result[2] = hobbyIdArray[3];
        }else{
            result[0] = hobbyIdArray[0];
            result[1] = hobbyIdArray[1];
            result[2] = hobbyIdArray[2];
        }
        
        
        return result;
        
    }
    
    
//    public final static List<Video> reversalVideoList(List<Video> moduleList){
//        
//        int moduleListLength = moduleList.size() - 1;
//
//        List<Video> videoList = new ArrayList<Video>(moduleListLength);
//        for (int i = 0; i <= moduleListLength; i++) {
//            Video video = new Video();
//            videoList.add(video);
//        }
//
//        List<Video> result = new ArrayList<Video>(moduleListLength);
//
//        int index = 0;
//        for (int i = moduleListLength; i >= 0; i--) {
//            videoList.set(index, moduleList.get(i));
//            result.add(index, videoList.get(index));
//            index++;
//
//        }
//
//        return result;
//
//    }
//
//    public final static List<User> reversalUserList(List<User> moduleList) {
//
//        int moduleListLength = moduleList.size() - 1;
//
//        List<User> videoList = new ArrayList<User>(moduleListLength);
//        for (int i = 0; i <= moduleListLength; i++) {
//            User user = new User();
//            videoList.add(user);
//        }
//
//        List<User> result = new ArrayList<User>(moduleListLength);
//
//        int index = 0;
//        for (int i = moduleListLength; i >= 0; i--) {
//            videoList.set(index, moduleList.get(i));
//            result.add(index, videoList.get(index));
//            index++;
//
//        }
//
//        return result;
//
//    }

}
