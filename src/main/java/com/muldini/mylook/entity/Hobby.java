package com.muldini.mylook.entity;

import java.io.Serializable;

public final class Hobby implements Serializable {

    private static final long serialVersionUID = 6491438375647996914L;

    private int hobbyId;
    private String name;
    private int state;
    private String createTime;
    private String hobbyPicture;
    private String hobbySmallIcon;
    private int hobbyCount;
    private int watchCount;

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

    public String getHobbySmallIcon() {
        return hobbySmallIcon;
    }

    public void setHobbySmallIcon(String hobbySmallIcon) {
        this.hobbySmallIcon = hobbySmallIcon;
    }

    public int getHobbyCount() {
        return hobbyCount;
    }

    public void setHobbyCount(int hobbyCount) {
        this.hobbyCount = hobbyCount;
    }

    public int getWatchCount() {
        return watchCount;
    }

    public void setWatchCount(int watchCount) {
        this.watchCount = watchCount;
    }

    @Override
    public String toString() {
        return "Hobby [hobbyId=" + hobbyId + ", name=" + name + ", state=" + state + ", createTime=" + createTime
                + ", hobbyPicture=" + hobbyPicture + ", hobbySmallIcon=" + hobbySmallIcon + ", hobbyCount=" + hobbyCount
                + ", watchCount=" + watchCount + "]";
    }

}
