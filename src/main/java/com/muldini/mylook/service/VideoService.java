package com.muldini.mylook.service;

import java.util.List;
import java.util.Map;

import com.muldini.mylook.entity.Comment;
import com.muldini.mylook.entity.Video;

public interface VideoService {
   
    Video retrieveVideoAllMessages(int videoId);
    
    //关注
    Map<String,Object> getFollowByUserIdAndFollowId(int userId, int followUserId);
    
    boolean retrieveVideoUserFollow(int userId, int followUserId);
    
    Map<String,Object> deleteFollowByUserIdAndFollowId(int userId, int followUserId);
    
    Map<String,Object> createHistory(int userId, int videoId);
    
    boolean retrieveThumbsUp(int userId, int videoId);
    
    Map<String,Object> getThumbsUp(int userId, int videoId);
    
    Map<String, Object> deleteThumbsUp(int userId, int videoId);
    
    boolean retrieveCollection(int userId, int videoId);
    
    Map<String,Object> getCollection(int userId, int videoId);
    
    Map<String, Object> deleteCollection(int userId, int videoId);
    
    List<Comment> retrieveCommentByPageNumber(int videoId, int pageNumber, int pageSize);
    
    int retrieveCommentByCount(int videoId);
    
    boolean createComment(Comment comment);
}
