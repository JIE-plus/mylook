package com.muldini.mylook.entity;

import java.io.Serializable;

public final class Carousel implements Serializable{

    /**
     * 轮播的实体类对象
     */
    private static final long serialVersionUID = 5087346631579163622L;
    
    private int carouselId;
    private String name;
    private String picture;
    private String url;
    private String createTime;
    
    public int getCarouselId() {
        return carouselId;
    }
    public void setCarouselId(int carouselId) {
        this.carouselId = carouselId;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getPicture() {
        return picture;
    }
    public void setPicture(String picture) {
        this.picture = picture;
    }
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
    public String getCreateTime() {
        return createTime;
    }
    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
    @Override
    public String toString() {
        return "Carousel [carouselId=" + carouselId + ", name=" + name + ", picture=" + picture + ", url=" + url
                + ", createTime=" + createTime + "]";
    }
    
    
    
    
    

}
