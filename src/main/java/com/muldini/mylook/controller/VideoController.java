package com.muldini.mylook.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.muldini.mylook.common.MiscConstant;
import com.muldini.mylook.common.ResultUtils;
import com.muldini.mylook.common.StringConstant;
import com.muldini.mylook.common.UserUtils;
import com.muldini.mylook.entity.Comment;
import com.muldini.mylook.entity.Follow;
import com.muldini.mylook.entity.User;
import com.muldini.mylook.entity.Video;
import com.muldini.mylook.service.IndexService;
import com.muldini.mylook.service.VideoService;

@Controller
public class VideoController {
    
    @Autowired
    private VideoService videoService;
    
    @Autowired
    private IndexService indexService;
    
    /**
     * 加载视频页面
     * @param videoId
     * @param modelMap
     * @return
     * @author:lianss
     * @createTime:2020年5月31日 下午7:36:02
     */
    @RequestMapping(value = "/video.do", method = RequestMethod.GET)
    public String resultVideo(int videoId, ModelMap modelMap, HttpSession session){
        
        Video videoMessages = videoService.retrieveVideoAllMessages(videoId);
        modelMap.put(StringConstant.REQ_VIDEO_MESSAGES, videoMessages);
        String isUserLogin = (String)session.getAttribute(StringConstant.SESSION_USER_ID);
        
        if(StringUtils.isNotEmpty(isUserLogin)){
            int userId = Integer.valueOf(isUserLogin);
            int followUserId = videoMessages.getUser().getUserId();
            boolean isFollow = videoService.retrieveVideoUserFollow(userId, followUserId);
            boolean isThumbsUp = videoService.retrieveThumbsUp(userId, videoId);
            boolean isCollection = videoService.retrieveCollection(userId, videoId);
            modelMap.put(StringConstant.REQ_VIDEO_ISFOLLOW, isFollow);
            modelMap.put(StringConstant.REQ_VIDEO_ISTHUMBSUP, isThumbsUp);
            modelMap.put(StringConstant.REQ_VIDEO_ISCOLLECTION, isCollection);
        }else{
            modelMap.put(StringConstant.REQ_VIDEO_ISFOLLOW, false);
            modelMap.put(StringConstant.REQ_VIDEO_ISTHUMBSUP, false);
            modelMap.put(StringConstant.REQ_VIDEO_ISCOLLECTION, false);
        }
        
        int hobbyId = videoMessages.getHobby().getHobbyId();
        int moduleSort = 1;//观看数
        List<Video> resultModule = indexService.retrieveVideoByHobby(hobbyId, moduleSort, 0, 8);
        modelMap.put(StringConstant.REQ_VIDEO_ABOUTVIDEO, resultModule);
        
        int pageNumber = 1;
        List<Comment> commentList = videoService.retrieveCommentByPageNumber(videoId,  pageNumber, MiscConstant.COMMENT_PAGE_SIZE);
        int commentPage = UserUtils.resultint(videoService.retrieveCommentByCount(videoId), MiscConstant.COMMENT_PAGE_SIZE);
        int commentCount = videoService.retrieveCommentByCount(videoId);
        modelMap.put(StringConstant.REQ_VIDEO_COMMENT, commentList);
        modelMap.put(StringConstant.REQ_VIDEO_COMMENT_PAGE, commentPage);
        modelMap.put(StringConstant.REQ_VIDEO_COMMENT_COUNT, commentCount);
        
        return "video";
        
    }
    
    /**
     * 关注
     * @param session
     * @param followUserId
     * @param response
     * @param isUserFollow
     * @throws IOException
     * @author:lianss
     * @createTime:2020年6月8日 下午4:26:36
     */
    @RequestMapping(value = "/follow.do", method = RequestMethod.GET)
    public void follow(HttpSession session, int followUserId, HttpServletResponse response,
            String isUserFollow) throws IOException{
        
        int userId = Integer.valueOf((String)session.getAttribute(StringConstant.SESSION_USER_ID));
        
        Map<String, Object> resultMap = new HashMap<>();
        /*
         * y是关注，n是取消关注
         */
        if("y".equals(isUserFollow)){
            resultMap = videoService.getFollowByUserIdAndFollowId(userId, followUserId);
        }else if("n".equals(isUserFollow)){
            resultMap = videoService.deleteFollowByUserIdAndFollowId(userId, followUserId);
        }
        String result = ResultUtils.jsonValue(resultMap);
        response.getWriter().write(result);
        return;
   
    }
    
    /**
     * 观看记录
     * @param session
     * @param videoId
     * @param response
     * @throws IOException
     * @author:lianss
     * @createTime:2020年6月8日 下午4:26:17
     */
    @RequestMapping(value = "/history.do", method = RequestMethod.GET)
    public void history(HttpSession session, int videoId, HttpServletResponse response) throws IOException{
        
        String result = null;
        
        String isUserLogin = (String)session.getAttribute(StringConstant.SESSION_USER_ID);
        
        if(StringUtils.isEmpty(isUserLogin)){
            result = ResultUtils.jsonValue(false);
        }else{
            Map<String, Object> resultMap = new HashMap<>();
            int userId = Integer.valueOf(isUserLogin);
            resultMap = videoService.createHistory(userId, videoId);
            result = ResultUtils.jsonValue(resultMap);
        }
        
        response.getWriter().write(result);
        return;
        
    }
    
    /**
     * 点赞
     * @param session
     * @param videoId
     * @param response
     * @param isThumbsUp
     * @throws IOException
     * @author:lianss
     * @createTime:2020年6月9日 上午10:30:37
     */
    @GetMapping(value = "/thumbsUp.do")
    public void thumbsUp(HttpSession session, int videoId, HttpServletResponse response,
            String isThumbsUp) throws IOException{
        
        int userId = Integer.valueOf((String)session.getAttribute(StringConstant.SESSION_USER_ID));
        
        Map<String, Object> resultMap = new HashMap<>();
        
        /*
         * y是点赞，n是取消点赞
         */
        if("y".equals(isThumbsUp)){
            resultMap = videoService.getThumbsUp(userId, videoId);
        }else if("n".equals(isThumbsUp)){
            resultMap = videoService.deleteThumbsUp(userId, videoId);
        }
        String result = ResultUtils.jsonValue(resultMap);
        response.getWriter().write(result);
        return;
    }
    
    /**
     * 收藏
     * @param session
     * @param videoId
     * @param response
     * @param isCollection
     * @throws IOException
     * @author:lianss
     * @createTime:2020年6月10日 下午6:40:30
     */
    @GetMapping(value = "/collection.do")
    public void collection(HttpSession session, int videoId, HttpServletResponse response,
            String isCollection) throws IOException{
        
        int userId = Integer.valueOf((String)session.getAttribute(StringConstant.SESSION_USER_ID));
        
        Map<String, Object> resultMap = new HashMap<>();
        
        /*
         * y是收藏，n是取消收藏 
         */
        if("y".equals(isCollection)){
            resultMap = videoService.getCollection(userId, videoId);
        }else if("n".equals(isCollection)){
            resultMap = videoService.deleteCollection(userId, videoId);
        }
        String result = ResultUtils.jsonValue(resultMap);
        response.getWriter().write(result);
        return;
    }
    
    @GetMapping(value = "/page.do")
    public String commentPage(int videoId, int pageNumber,ModelMap modelMap){
        
        List<Comment> commentList = videoService.retrieveCommentByPageNumber(videoId,  pageNumber, MiscConstant.COMMENT_PAGE_SIZE);
        modelMap.put(StringConstant.REQ_VIDEO_COMMENT, commentList);
        
        return "commentresult";
    }
    
    @PostMapping(value = "/getComment.do")
    public String getComment(Comment comment, ModelMap modelMap,Video video, User user, 
            HttpSession session){
        
        int userId = Integer.valueOf((String)session.getAttribute(StringConstant.SESSION_USER_ID));
        user.setUserId(userId);
        comment.setUser(user);
        comment.setVideo(video);
        int videoId = video.getVideoId();
        boolean isComment = videoService.createComment(comment);
        
        if(isComment == true){
            int pageNumber = 1;
            List<Comment> commentList = videoService.retrieveCommentByPageNumber(videoId, pageNumber, MiscConstant.COMMENT_PAGE_SIZE);
            modelMap.put(StringConstant.REQ_VIDEO_COMMENT, commentList);
            return "commentresult";
        }
        return "redirect:video.do?videoId=" + videoId;
    }
   
}
