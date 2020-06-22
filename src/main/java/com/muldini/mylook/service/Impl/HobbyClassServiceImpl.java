package com.muldini.mylook.service.Impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.muldini.mylook.access.HobbyClassMapper;
import com.muldini.mylook.common.UserUtils;
import com.muldini.mylook.entity.Hobby;
import com.muldini.mylook.entity.Video;
import com.muldini.mylook.service.HobbyClassService;

@Service
@Transactional
public class HobbyClassServiceImpl implements HobbyClassService{
    
   @Autowired
   private HobbyClassMapper hobbyClassMapper;
   
   private HobbyClassServiceImpl(){
       
   }
   
   @Transactional(readOnly = true)
   public List<Hobby> retrieveHobbyAll(){
       
       List<Hobby> result = null;
       
       result = hobbyClassMapper.retrieveHobbyAll();
       
       return result;
   }
   
   @Transactional(readOnly = true)
   public List<Integer> retrieveHostHobby(){
       
       List<Hobby> hobbyIdList = hobbyClassMapper.retrieveHobbyAll();
       Map<Integer,Integer> hostMap = new HashMap<>();
       
       for(int i = 0;i < hobbyIdList.size();i++){
           Hobby hostHobby = hobbyClassMapper.retrieveHostHobby(hobbyIdList.get(i).getHobbyId());
           hostMap.put(hostHobby.getHobbyId(),hostHobby.getWatchCount());
       }
       List<Integer> hostHobbyList = UserUtils.resultHostHobbyList(hostMap);
       
       return hostHobbyList;
   }
   
   @Transactional(readOnly = true)
   public List<Video> retrieveHostHobbyAll(int hobbyId){
       List<Video> result = null;
       
       result = hobbyClassMapper.retrieveHostHobbyAll(hobbyId);
       return result;
   }
   
   @Transactional(readOnly = true)
   public List<Video> retrieveHostHobbyVideoAll(int hobbyId){
       List<Video> result = null;
       
       result = hobbyClassMapper.retrieveHostHobbyVideoAll(hobbyId);
       return result;
   }
  
}
