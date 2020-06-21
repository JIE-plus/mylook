package com.muldini.mylook.entity;

import java.io.Serializable;

public final class Video implements Serializable{

    private static final long serialVersionUID = -7536397746836741328L;
    
    private int videoId;
    private String name;
    private String videoCover;
    private String videoGif;
    private String videoUrl;
    private int type;
    private Hobby hobby;
    private User user;
    private String videoIntroduction;
    private int state;
    private String time;
    private int thumbsUp;
    private int collections;
    private int watchCount;
    private String createTime;
    public int getVideoId() {
        return videoId;
    }
    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getVideoCover() {
        return videoCover;
    }
    public void setVideoCover(String videoCover) {
        this.videoCover = videoCover;
    }
    public String getVideoGif() {
        return videoGif;
    }
    public void setVideoGif(String videoGif) {
        this.videoGif = videoGif;
    }
    public String getVideoUrl() {
        return videoUrl;
    }
    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }
    public int getType() {
        return type;
    }
    public void setType(int type) {
        this.type = type;
    }
    public Hobby getHobby() {
        return hobby;
    }
    public void setHobby(Hobby hobby) {
        this.hobby = hobby;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public String getVideoIntroduction() {
        return videoIntroduction;
    }
    public void setVideoIntroduction(String videoIntroduction) {
        this.videoIntroduction = videoIntroduction;
    }
    public int getState() {
        return state;
    }
    public void setState(int state) {
        this.state = state;
    }
    public String getTime() {
        return time;
    }
    public void setTime(String time) {
        this.time = time;
    }
    public int getThumbsUp() {
        return thumbsUp;
    }
    public void setThumbsUp(int thumbsUp) {
        this.thumbsUp = thumbsUp;
    }
    public int getCollections() {
        return collections;
    }
    public void setCollections(int collections) {
        this.collections = collections;
    }
    public int getWatchCount() {
        return watchCount;
    }
    public void setWatchCount(int watchCount) {
        this.watchCount = watchCount;
    }
    public String getCreateTime() {
        return createTime;
    }
    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
    @Override
    public String toString() {
        return "Video [videoId=" + videoId + ", name=" + name + ", videoCover=" + videoCover + ", videoGif=" + videoGif
                + ", videoUrl=" + videoUrl + ", type=" + type + ", hobby=" + hobby + ", user=" + user
                + ", videoIntroduction=" + videoIntroduction + ", state=" + state + ", time=" + time + ", thumbsUp="
                + thumbsUp + ", collections=" + collections + ", watchCount=" + watchCount + ", createTime="
                + createTime + "]";
    }

    
    
}
