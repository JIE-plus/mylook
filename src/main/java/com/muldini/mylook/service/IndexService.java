package com.muldini.mylook.service;

import java.util.List;

import com.muldini.mylook.entity.Carousel;
import com.muldini.mylook.entity.User;
import com.muldini.mylook.entity.Video;

public interface IndexService {
    
    List<Carousel> retrieveAllCarousel();
    
    int retrieveAllHobbyCount();
    
    List<Video> retrieveVideoByHobby(int hobbyId, int sortBy, int begin, int videoCount);
    
    List<User> retrieveUserByHobby();

}
