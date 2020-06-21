package com.muldini.mylook.access;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.muldini.mylook.entity.Comment;
import com.muldini.mylook.entity.Follow;
import com.muldini.mylook.entity.History;
import com.muldini.mylook.entity.User;
import com.muldini.mylook.entity.Video;

public interface VideoMapper {
    
    Video retrieveVideoAllMessages(int videoId);
    
    //关注
    Follow retrieveByUserIdAndFollowId(@Param("userId") int userId, @Param("followUserId") int followUserId);
    
    int createFollow(@Param("userId") int userId, @Param("followUserId") int followUserId, @Param("createTime") String createTime);
    
    int deleteFollow(@Param("userId") int userId, @Param("followUserId") int followUserId);
    
    User retrieveByFans(@Param("followUserId") int followUserId);
    
    int updateFans(@Param("fans") int fans, @Param("followUserId") int followUserId);
    
    
    //观看数
    History retrieveHistoryByUserIdAndVideoId(@Param("userId") int userId, @Param("videoId") int videoId);
    
    int createHistory(@Param("userId") int userId, @Param("videoId") int videoId, @Param("createTime") String createTime);
    
    Video retrieveByCount(@Param("videoId") int videoId);
    
    int updateWatchCount(@Param("watchCount") int watchCount, @Param("videoId") int videoId);
    
    //点赞
    User retrieveThumbsUp(@Param("userId") int userId, @Param("videoId") int videoId);
    
    int createThumbsUp(@Param("userId") int userId, @Param("videoId") int videoId, @Param("createTime") String createTime);
    
    int deleteThumbsUp(@Param("userId") int userId, @Param("videoId") int videoId);
    
    int updateThumbsUp(@Param("thumbsUp") int thumbsUp, @Param("videoId") int videoId);
    
    //收藏
    User retrieveCollection(@Param("userId") int userId, @Param("videoId") int videoId);
    
    int createCollection(@Param("userId") int userId, @Param("videoId") int videoId, @Param("createTime") String createTime);
    
    int deleteCollection(@Param("userId") int userId, @Param("videoId") int videoId);
    
    int updateCollection(@Param("collections") int collections, @Param("videoId") int videoId);
    
    //评论
    List<Comment> retrieveCommentByPageNumber(@Param("videoId") int videoId, @Param("pageNumber") int pageNumber, @Param("pageSize") int pageSize);
    
    Comment retrieveCommentByCount(@Param("videoId") int videoId);
    
    int createComment(Comment comment);
    
}
