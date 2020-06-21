package com.muldini.mylook.access;

import java.util.List;

import com.muldini.mylook.entity.Carousel;
import com.muldini.mylook.entity.Hobby;
import com.muldini.mylook.entity.User;
import com.muldini.mylook.entity.Video;

public interface IndexMapper {
    
    List<Carousel> retrieveAllCarousel();
    
    Hobby retrieveAllHobbyCount();
    
    List<Video> retrieveVideoByHobby(int hobbyId, int sortBy, int begin, int videoCount);
    
    List<User> retrieveUserByHobby();
    
}
