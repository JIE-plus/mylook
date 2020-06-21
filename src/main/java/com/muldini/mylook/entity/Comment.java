package com.muldini.mylook.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public final class Comment implements Serializable{

    /**
     * 
     */
    private static final long serialVersionUID = 8121006985441419796L;
    
    private int parentId;
    private User user;
    private User parentUser;
    private Video video;
    private String content;
    private String createTime;
    private Timestamp updateTime;
    private int contentCount;
    public int getParentId() {
        return parentId;
    }
    public void setParentId(int parentId) {
        this.parentId = parentId;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public User getParentUser() {
        return parentUser;
    }
    public void setParentUser(User parentUser) {
        this.parentUser = parentUser;
    }
    public Video getVideo() {
        return video;
    }
    public void setVideo(Video video) {
        this.video = video;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getCreateTime() {
        return createTime;
    }
    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
    public Timestamp getUpdateTime() {
        return updateTime;
    }
    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }
    public int getContentCount() {
        return contentCount;
    }
    public void setContentCount(int contentCount) {
        this.contentCount = contentCount;
    }
    @Override
    public String toString() {
        return "Comment [parentId=" + parentId + ", user=" + user + ", parentUser=" + parentUser + ", video=" + video
                + ", content=" + content + ", createTime=" + createTime + ", updateTime=" + updateTime
                + ", contentCount=" + contentCount + "]";
    }
    
    
    
    

  

}
