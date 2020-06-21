package com.muldini.mylook.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.muldini.mylook.access.VideoMapper;
import com.muldini.mylook.common.DateUtils;
import com.muldini.mylook.common.MiscConstant;
import com.muldini.mylook.common.UserUtils;
import com.muldini.mylook.entity.Comment;
import com.muldini.mylook.entity.Follow;
import com.muldini.mylook.entity.History;
import com.muldini.mylook.entity.User;
import com.muldini.mylook.entity.Video;
import com.muldini.mylook.service.VideoService;

@Service
@Transactional
public final class VideoServiceImpl implements VideoService {

    @Autowired
    private VideoMapper videoMapper;

    private VideoServiceImpl() {

    }

    @Transactional(readOnly = true)
    public Video retrieveVideoAllMessages(int videoId) {

        Video result = new Video();
        result = videoMapper.retrieveVideoAllMessages(videoId);

        return result;

    }
    
    /**
     * 查询是否关注
     * @param userId
     * @param followUserId
     * @return
     * @author:lianss
     * @createTime:2020年6月8日 下午6:14:52
     */
    @Transactional(readOnly = true)
    public boolean retrieveVideoUserFollow(int userId, int followUserId) {

        // 未关注
        boolean result = false;

        Follow isFollow = videoMapper.retrieveByUserIdAndFollowId(userId, followUserId);

        if (isFollow != null) {
            result = true;
        }

        return result;

    }
    
    /**
     * 查询是否点赞
     * @param userId
     * @param videoId
     * @return
     * @author:lianss
     * @createTime:2020年6月8日 下午6:15:15
     */
    @Transactional(readOnly = true)
    public boolean retrieveThumbsUp(int userId, int videoId) {

        // 未点赞
        boolean result = false;

        User isThumbsUp = videoMapper.retrieveThumbsUp(userId, videoId);

        if (isThumbsUp != null) {
            result = true;
        }

        return result;

    }
    
    /**
     * 查询是否收藏
     * @param userId
     * @param videoId
     * @return
     * @author:lianss
     * @createTime:2020年6月9日 上午10:21:03
     */
    @Transactional(readOnly = true)
    public boolean retrieveCollection(int userId, int videoId) {

        // 未收藏
        boolean result = false;

        User isCollection = videoMapper.retrieveCollection(userId, videoId);

        if (isCollection != null) {
            result = true;
        }

        return result;

    }
    
    @Transactional(readOnly = true)
    public List<Comment> retrieveCommentByPageNumber(int videoId, int pageNumber, int pageSize) {

        pageNumber = (pageNumber - 1) * pageSize;
        List<Comment> commentList = videoMapper.retrieveCommentByPageNumber(videoId, pageNumber, pageSize);
        return commentList;
    }
    
    @Transactional(readOnly = true)
    public int retrieveCommentByCount(int videoId) {
        
        Comment comment = videoMapper.retrieveCommentByCount(videoId);
        int result = comment.getContentCount();
        return result;
    }

    
    public Map<String,Object> getFollowByUserIdAndFollowId(int userId, int followUserId) {
        
        Map<String,Object> result = new HashMap<>();
        
        // 未关注
        boolean resultBoolean = false;
        int fans = 0;

        Follow isFollow = videoMapper.retrieveByUserIdAndFollowId(userId, followUserId);
        User user = videoMapper.retrieveByFans(followUserId);

        if (isFollow != null) {
            resultBoolean = true;
            fans = user.getFans();
        } else {
            String createTime = DateUtils.getNowTime();
            //创建关注
            videoMapper.createFollow(userId, followUserId, createTime);
            //粉丝数加一且修改粉丝数
            fans = user.getFans() + 1;
            videoMapper.updateFans(fans, followUserId);
            resultBoolean = true;
        }
        
        result.put("resultBoolean", resultBoolean);
        result.put("resultInt", fans);

        return result;
    }

    public Map<String, Object> deleteFollowByUserIdAndFollowId(int userId, int followUserId) {
        
        Map<String,Object> result = new HashMap<>();
        
        // 已关注
        boolean resultBoolean = false;
        int fans = 0;

        Follow isFollow = videoMapper.retrieveByUserIdAndFollowId(userId, followUserId);
        User user = videoMapper.retrieveByFans(followUserId);

        if (isFollow == null) {
            resultBoolean = true;
            fans = user.getFans();
        } else {
            //取消关注
            videoMapper.deleteFollow(userId, followUserId);
            //粉丝数减一且修改粉丝数
            fans = user.getFans() - 1;
            videoMapper.updateFans(fans, followUserId);
            resultBoolean = true;
        }
        
        result.put("resultBoolean", resultBoolean);
        result.put("resultInt", fans);

        return result;
    }
    
    public Map<String,Object> createHistory(int userId, int videoId) {
        
        Map<String,Object> result = new HashMap<>();
        
        // 未观看
        boolean resultBoolean = false;
        int watchCount = 0;

        History isHistory = videoMapper.retrieveHistoryByUserIdAndVideoId(userId, videoId);
        Video video = videoMapper.retrieveByCount(videoId);

        if (isHistory != null) {
            resultBoolean = true;
            watchCount = video.getWatchCount();
        } else {
            String createTime = DateUtils.getNowTime();
            videoMapper.createHistory(userId, videoId, createTime);
            watchCount = video.getWatchCount() + 1;
            videoMapper.updateWatchCount(watchCount,videoId);
            resultBoolean = true;
        }
        
        result.put("resultBoolean", resultBoolean);
        result.put("resultInt", watchCount);

        return result;
    }
    
    public Map<String,Object> getThumbsUp(int userId, int videoId) {
        
        Map<String,Object> result = new HashMap<>();
        
        // 未点赞
        boolean resultBoolean = false;
        int thumbsUp = 0;

        User isThumbsUp = videoMapper.retrieveThumbsUp(userId, videoId);
        Video video = videoMapper.retrieveByCount(videoId);

        if (isThumbsUp != null) {
            resultBoolean = true;
            thumbsUp = video.getThumbsUp();
        } else {
            String createTime = DateUtils.getNowTime();
            //创建点赞
            videoMapper.createThumbsUp(userId, videoId, createTime);
            //点赞数加一且修改点赞数
            thumbsUp = video.getThumbsUp() + 1;
            videoMapper.updateThumbsUp(thumbsUp, videoId);
            resultBoolean = true;
        }
        
        result.put("resultBoolean", resultBoolean);
        result.put("resultInt", thumbsUp);

        return result;
    }
    
    public Map<String, Object> deleteThumbsUp(int userId, int videoId) {
        
        Map<String,Object> result = new HashMap<>();
        
        // 已点赞
        boolean resultBoolean = false;
        int thumbsUp = 0;

        User isThumbsUp = videoMapper.retrieveThumbsUp(userId, videoId);
        Video video = videoMapper.retrieveByCount(videoId);

        if (isThumbsUp == null) {
            resultBoolean = true;
            thumbsUp = video.getThumbsUp();
        } else {
            //取消点赞
            videoMapper.deleteThumbsUp(userId, videoId);
            //点赞数减一且修改点赞数
            thumbsUp = video.getThumbsUp() - 1;
            videoMapper.updateThumbsUp(thumbsUp, videoId);
            resultBoolean = true;
        }
        
        result.put("resultBoolean", resultBoolean);
        result.put("resultInt", thumbsUp);

        return result;
    }
    
    public Map<String,Object> getCollection(int userId, int videoId) {
        
        Map<String,Object> result = new HashMap<>();
        
        // 未收藏
        boolean resultBoolean = false;
        int collections = 0;

        User isCollection = videoMapper.retrieveCollection(userId, videoId);
        Video video = videoMapper.retrieveByCount(videoId);

        if (isCollection != null) {
            resultBoolean = true;
            collections = video.getCollections();
        } else {
            String createTime = DateUtils.getNowTime();
            //创建收藏
            videoMapper.createCollection(userId, videoId, createTime);
            //收藏数加一且修改收藏数
            collections = video.getCollections() + 1;
            videoMapper.updateCollection(collections, videoId);
            resultBoolean = true;
        }
        
        result.put("resultBoolean", resultBoolean);
        result.put("resultInt", collections);

        return result;
    }
    
    public Map<String, Object> deleteCollection(int userId, int videoId) {
        
        Map<String,Object> result = new HashMap<>();
        
        // 已收藏
        boolean resultBoolean = false;
        int collections = 0;

        User isCollection = videoMapper.retrieveCollection(userId, videoId);
        Video video = videoMapper.retrieveByCount(videoId);

        if (isCollection == null) {
            resultBoolean = true;
            collections = video.getCollections();
        } else {
            //取消收藏
            videoMapper.deleteCollection(userId, videoId);
            //收藏数减一且修改收藏数
            collections = video.getCollections() - 1;
            videoMapper.updateCollection(collections, videoId);
            resultBoolean = true;
        }
        
        result.put("resultBoolean", resultBoolean);
        result.put("resultInt", collections);

        return result;
    }
    
    public boolean createComment(Comment comment) {
        
        boolean result = false;
        
        int createInt = videoMapper.createComment(comment);
        
        if(createInt > 0){
            result = true;
        }

        return result;
    }
    
    
 
}
