package com.muldini.mylook.entity;

import java.io.Serializable;

public final class User implements Serializable {

    private static final long serialVersionUID = -8537357231549652100L;

    private int userId;
    private String username;
    private String password;
    private int gender;
    private String header;
    private String userIntroduction;
    private int follows;
    private int fans;
    private Hobby hobby;
    private String createTime;
    private Video videoThumbsUp;
    private Video videoCollection;
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public int getGender() {
        return gender;
    }
    public void setGender(int gender) {
        this.gender = gender;
    }
    public String getHeader() {
        return header;
    }
    public void setHeader(String header) {
        this.header = header;
    }
    public String getUserIntroduction() {
        return userIntroduction;
    }
    public void setUserIntroduction(String userIntroduction) {
        this.userIntroduction = userIntroduction;
    }
    public int getFollows() {
        return follows;
    }
    public void setFollows(int follows) {
        this.follows = follows;
    }
    public int getFans() {
        return fans;
    }
    public void setFans(int fans) {
        this.fans = fans;
    }
    public Hobby getHobby() {
        return hobby;
    }
    public void setHobby(Hobby hobby) {
        this.hobby = hobby;
    }
    public String getCreateTime() {
        return createTime;
    }
    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
    public Video getVideoThumbsUp() {
        return videoThumbsUp;
    }
    public void setVideoThumbsUp(Video videoThumbsUp) {
        this.videoThumbsUp = videoThumbsUp;
    }
    public Video getVideoCollection() {
        return videoCollection;
    }
    public void setVideoCollection(Video videoCollection) {
        this.videoCollection = videoCollection;
    }
    @Override
    public String toString() {
        return "User [userId=" + userId + ", username=" + username + ", password=" + password + ", gender=" + gender
                + ", header=" + header + ", userIntroduction=" + userIntroduction + ", follows=" + follows + ", fans="
                + fans + ", hobby=" + hobby + ", createTime=" + createTime + ", videoThumbsUp=" + videoThumbsUp
                + ", videoCollection=" + videoCollection + "]";
    }
    
}
