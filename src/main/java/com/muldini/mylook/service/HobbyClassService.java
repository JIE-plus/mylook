package com.muldini.mylook.service;

import java.util.List;

import com.muldini.mylook.entity.Hobby;
import com.muldini.mylook.entity.Video;

public interface HobbyClassService {
  
    List<Hobby> retrieveHobbyAll();
    
    List<Integer> retrieveHostHobby();
    
    List<Video> retrieveHostHobbyAll(int hobbyId);
    
    List<Video> retrieveHostHobbyVideoAll(int hobbyId);
}
