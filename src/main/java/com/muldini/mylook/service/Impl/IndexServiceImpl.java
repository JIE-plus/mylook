package com.muldini.mylook.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.muldini.mylook.access.IndexMapper;
import com.muldini.mylook.common.IndexUtils;
import com.muldini.mylook.entity.Carousel;
import com.muldini.mylook.entity.Hobby;
import com.muldini.mylook.entity.User;
import com.muldini.mylook.entity.Video;
import com.muldini.mylook.service.IndexService;

@Service
@Transactional
public final class IndexServiceImpl implements IndexService {

    @Autowired
    private IndexMapper indexMapper;

    private IndexServiceImpl() {

    }

    @Transactional(readOnly = true)
    public List<Carousel> retrieveAllCarousel() {

        List<Carousel> result = null;
        result = indexMapper.retrieveAllCarousel();

        return result;
    }

    @Transactional(readOnly = true)
    public int retrieveAllHobbyCount() {

        Hobby hobby = indexMapper.retrieveAllHobbyCount();
        int result = hobby.getHobbyCount();

        return result;
    }

    @Transactional(readOnly = true)
    public List<Video> retrieveVideoByHobby(int hobbyId, int sortBy, int begin, int videoCount) {
        
        List<Video> result = indexMapper.retrieveVideoByHobby(hobbyId, sortBy, begin, videoCount);
        return result;

    }
    
    @Transactional(readOnly = true)
    public List<User> retrieveUserByHobby() {
        
        List<User> result = indexMapper.retrieveUserByHobby();
        return result;

    }
    

}
