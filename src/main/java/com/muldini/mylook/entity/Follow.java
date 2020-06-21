package com.muldini.mylook.entity;

import java.io.Serializable;

public final class Follow implements Serializable{

    /**
     * 关注实体类
     */
    private static final long serialVersionUID = -4257909369129303572L;
   
    private int followId;
    private int userId;
    private User followUser;
    private String createTime;
    public int getFollowId() {
        return followId;
    }
    public void setFollowId(int followId) {
        this.followId = followId;
    }
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public User getFollowUser() {
        return followUser;
    }
    public void setFollowUser(User followUser) {
        this.followUser = followUser;
    }
    public String getCreateTime() {
        return createTime;
    }
    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
    @Override
    public String toString() {
        return "Follow [followId=" + followId + ", userId=" + userId + ", followUser=" + followUser + ", createTime="
                + createTime + "]";
    }
    
    
}
