package com.muldini.mylook.access;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.muldini.mylook.entity.Hobby;
import com.muldini.mylook.entity.Video;

public interface HobbyClassMapper {
    
    List<Hobby> retrieveHobbyAll();
    
    Hobby retrieveHostHobby(@Param("hobbyId") int hobbyId);
    
    List<Video> retrieveHostHobbyAll(@Param("hobbyId") int hobbyId);
    
    List<Video> retrieveHostHobbyVideoAll(@Param("hobbyId") int hobbyId);

}
