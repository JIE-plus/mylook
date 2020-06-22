package com.muldini.mylook.controller;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import com.muldini.mylook.common.StringConstant;
import com.muldini.mylook.entity.Hobby;
import com.muldini.mylook.entity.Video;
import com.muldini.mylook.service.HobbyClassService;



@Controller
public class HobbyClassController {
  
    @Autowired
    private HobbyClassService hobbyClassService;
    
    @GetMapping(value = "hobbyclass.do")
    public String resultHobby(ModelMap modelMap){
        
        List<Hobby> hobbyNameList = hobbyClassService.retrieveHobbyAll();
        List<Integer> hostHobbyIdList = hobbyClassService.retrieveHostHobby();
        List<Video> hostHobbyModuleOne = hobbyClassService.retrieveHostHobbyAll(hostHobbyIdList.get(0));
        List<Video> hostHobbyModuleTwo = hobbyClassService.retrieveHostHobbyAll(hostHobbyIdList.get(1));
        List<Video> hostHobbyModuleThree = hobbyClassService.retrieveHostHobbyAll(hostHobbyIdList.get(2));
        List<Video> hostHobbyModuleFour = hobbyClassService.retrieveHostHobbyAll(hostHobbyIdList.get(3));
        List<Video> hostHobbyModuleFive = hobbyClassService.retrieveHostHobbyAll(hostHobbyIdList.get(4));
        List<Video> hostHobbyModuleSix = hobbyClassService.retrieveHostHobbyAll(hostHobbyIdList.get(5));
        
        modelMap.put(StringConstant.REQ_HOBBY_NAME_LIST, hobbyNameList);
        modelMap.put(StringConstant.REQ_HOBBY_HOST_MODULE_ONE, hostHobbyModuleOne);
        modelMap.put(StringConstant.REQ_HOBBY_HOST_MODULE_TWO, hostHobbyModuleTwo);
        modelMap.put(StringConstant.REQ_HOBBY_HOST_MODULE_THREE, hostHobbyModuleThree);
        modelMap.put(StringConstant.REQ_HOBBY_HOST_MODULE_FOUR, hostHobbyModuleFour);
        modelMap.put(StringConstant.REQ_HOBBY_HOST_MODULE_FIVE, hostHobbyModuleFive);
        modelMap.put(StringConstant.REQ_HOBBY_HOST_MODULE_SIX, hostHobbyModuleSix);
        
        
        return "hobbyclass";
    }
    
    @GetMapping(value = "hobbyVideo.do")
    public String resultHobbyVideo(int hobbyId, ModelMap modelMap){
        
        List<Video> hobbyVideoAll = hobbyClassService.retrieveHostHobbyVideoAll(hobbyId);
        modelMap.put(StringConstant.REQ_HOBBY_VIDEO_ALL, hobbyVideoAll);
        
        return "hobbyresult";
        
    }
}
