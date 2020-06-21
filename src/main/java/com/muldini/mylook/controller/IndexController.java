package com.muldini.mylook.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.muldini.mylook.common.IndexUtils;
import com.muldini.mylook.common.StringConstant;
import com.muldini.mylook.entity.Carousel;
import com.muldini.mylook.entity.User;
import com.muldini.mylook.entity.Video;
import com.muldini.mylook.service.IndexService;

@Controller
public class IndexController {
    
    @Autowired
    private IndexService indexService;
    
    @RequestMapping(value = "index.do", method = RequestMethod.GET)
    public String resultIndex(ModelMap modelMap,HttpSession session){
        
        //返回轮播数据List
        List<Carousel> resultCarousel = indexService.retrieveAllCarousel();
        modelMap.put(StringConstant.REQ_RESULT_CAROUSEL, resultCarousel);
        
        //获取爱好的数量
        int hobbyCount = indexService.retrieveAllHobbyCount();
        
        //生成随机不重复的HobbyId
        int[] hobbyIdArray = IndexUtils.getHobbyIdArray(1, hobbyCount + 1, 4);
        
        //设置默认的四个模块的爱好参数
        int moduleFirstHobbyId = hobbyIdArray[0];
        int moduleSecondHobbyId = hobbyIdArray[1];
        int moduleThirdHobbyId = hobbyIdArray[2];
        int moduleFourthHobbyId = hobbyIdArray[3];
        
        //设置默认的四个模块的视频排序的方式
        int moduleSort = 1;
        
        String loginStatus = (String)session.getAttribute(StringConstant.SESSION_LOGIN_STATUS_MSG);
        String userHobby = (String)session.getAttribute(StringConstant.SESSION_USER_HOBBYID);
        
        if(StringUtils.isNotEmpty(loginStatus)){ 
            int userHobbyId = Integer.parseInt(userHobby);
            if(userHobbyId > 0){
                moduleFirstHobbyId = userHobbyId;
                int[] hobbyArray = IndexUtils.checkHobbyIdArray(hobbyIdArray, moduleFirstHobbyId);
                moduleSecondHobbyId = hobbyArray[0];
                moduleThirdHobbyId = hobbyArray[1];
                moduleFourthHobbyId = hobbyArray[2];
            }
        }
       
        List<Video> resultModuleFirst = indexService.retrieveVideoByHobby(moduleFirstHobbyId, moduleSort, 0, 8);
        List<Video> resultModuleSecond = indexService.retrieveVideoByHobby(moduleSecondHobbyId, moduleSort, 0, 4);
        List<Video> resultModuleThird = indexService.retrieveVideoByHobby(moduleThirdHobbyId, moduleSort, 0, 4);
        List<Video> resultModuleFourth = indexService.retrieveVideoByHobby(moduleFourthHobbyId, moduleSort, 0, 4);
        List<User> resultModuleFifth = indexService.retrieveUserByHobby();
        
      
        modelMap.put(StringConstant.REQ_INDEX_FIRST, resultModuleFirst);
        modelMap.put(StringConstant.REQ_INDEX_SECOND, resultModuleSecond);
        modelMap.put(StringConstant.REQ_INDEX_THIRD, resultModuleThird);
        modelMap.put(StringConstant.REQ_INDEX_FOURTH, resultModuleFourth);
        modelMap.put(StringConstant.REQ_INDEX_FIFTH, resultModuleFifth); 
        
        return "index";
    }
    
        
    @RequestMapping(value = "indexSort.do", method = RequestMethod.GET)
    public String indexVideoSort(ModelMap modelMap,HttpSession session,int module, int hobby,int sort,HttpServletResponse response) throws IOException{
        
        
        if(module == 1){
            List resultModule = indexService.retrieveVideoByHobby(hobby, sort, 0, 8);
            modelMap.put(StringConstant.REQ_INDEX_FIRST, resultModule);
        }else{
            List resultModule = indexService.retrieveVideoByHobby(hobby, sort, 0, 4);
            modelMap.put(StringConstant.REQ_INDEX_FIRST, resultModule);
        }
        
        
        return "moduleresult";
    }
        
   
}
