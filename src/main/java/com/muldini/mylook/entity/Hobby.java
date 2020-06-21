package com.muldini.mylook.entity;

import java.io.Serializable;

public final class Hobby implements Serializable{

    private static final long serialVersionUID = 6491438375647996914L;
    
    private int hobbyId;
    private String name;
    private int state;
    private String createTime;
    private String hobbyPicture;
    private int hobbyCount;
    public int getHobbyId() {
        return hobbyId;
    }
    public void setHobbyId(int hobbyId) {
        this.hobbyId = hobbyId;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getState() {
        return state;
    }
    public void setState(int state) {
        this.state = state;
    }
    public String getCreateTime() {
        return createTime;
    }
    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
    public String getHobbyPicture() {
        return hobbyPicture;
    }
    public void setHobbyPicture(String hobbyPicture) {
        this.hobbyPicture = hobbyPicture;
    }
    public int getHobbyCount() {
        return hobbyCount;
    }
    public void setHobbyCount(int hobbyCount) {
        this.hobbyCount = hobbyCount;
    }
    @Override
    public String toString() {
        return "Hobby [hobbyId=" + hobbyId + ", name=" + name + ", state=" + state + ", createTime=" + createTime
                + ", hobbyPicture=" + hobbyPicture + ", hobbyCount=" + hobbyCount + "]";
    }
    
    
    
    
    
    
    
    
}
