package com.muldini.mylook.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public final class History implements Serializable{

    /**
     * 
     */
    private static final long serialVersionUID = -7529585941324238334L;
    
    private int historyId;
    private User user;
    private Video video;
    private String createTime;
    private Timestamp updateTime;
    public int getHistoryId() {
        return historyId;
    }
    public void setHistoryId(int historyId) {
        this.historyId = historyId;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public Video getVideo() {
        return video;
    }
    public void setVideo(Video video) {
        this.video = video;
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
    @Override
    public String toString() {
        return "History [historyId=" + historyId + ", user=" + user + ", video=" + video + ", createTime=" + createTime
                + ", updateTime=" + updateTime + "]";
    }
    
    
    

}
