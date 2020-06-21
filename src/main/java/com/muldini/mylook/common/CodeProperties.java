package com.muldini.mylook.common;

import java.io.Serializable;

import org.springframework.stereotype.Component;


@Component
public class CodeProperties implements Serializable{
	
	
	private static final long serialVersionUID = 1L;

	/* 图片验证码宽度 */
	private int width = 70;

	/* 图片验证码高度 */
	private int height = 40;
	
	/* 图片验证码长度4位 */
	private int length = 4;

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	

	
	
	

}
