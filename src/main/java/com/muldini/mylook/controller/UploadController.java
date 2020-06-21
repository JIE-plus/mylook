package com.muldini.mylook.controller;

import java.io.InputStream;

import javax.servlet.annotation.MultipartConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.muldini.mylook.service.UploadService;

@Controller
@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
public class UploadController {

    @Autowired
    private UploadService uploadService;

    @RequestMapping(value = "upload.do", method = RequestMethod.POST)
    public String upload(@RequestParam("file") MultipartFile file) throws Exception {

        System.out.println("文件长度: " + file.getSize());
        System.out.println("文件类型: " + file.getContentType());
        System.out.println("文件名称: " + file.getName());
        System.out.println("文件原名: " + file.getOriginalFilename());

        String fileName = file.getOriginalFilename();

        InputStream in = file.getInputStream();

        // uploadService.delete(fileName);
        boolean a = uploadService.uploadFile(fileName, in);
        String b = uploadService.getFileResourceUrl(fileName);

        // int[] aray = randomCommon(1,5,4);
        // for(int i = 0;i < aray.length;i++){
        // System.out.println(aray[i]);
        // }

        System.out.println(a);
        System.out.println(b);

//        String str = "path=video&videoId=1&followUserId=1";
//
//        String[] ary = str.split("&");// 调用API方法按照逗号分隔字符串
//
//        for (String item : ary) {
//            System.out.println(item);
//        }

        return "hobbyclass";

    }
    
    @RequestMapping(value = "hobbyclass.do", method = RequestMethod.GET)
    public String getHobbyClass(){
        return "hoddyclass";
    }

    public static int[] randomCommon(int min, int max, int n) {
        if (n > (max - min + 1) || max < min) {
            return null;
        }
        int[] result = new int[n];
        int count = 0;
        while (count < n) {
            int num = (int)(Math.random() * (max - min)) + min;
            boolean flag = true;
            for (int j = 0; j < n; j++) {
                if (num == result[j]) {
                    flag = false;
                    break;
                }
            }
            if (flag) {
                result[count] = num;
                count++;
            }
        }
        return result;
    }
}
