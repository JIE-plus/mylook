package com.muldini.mylook.service.Impl;

import java.io.File;
import java.io.InputStream;

import org.json.JSONException;
import org.springframework.stereotype.Service;

import com.muldini.mylook.common.QiNiuMedia;
import com.muldini.mylook.service.UploadService;
import com.qiniu.api.auth.AuthException;
import com.qiniu.api.auth.digest.Mac;
import com.qiniu.api.config.Config;
import com.qiniu.api.io.IoApi;
import com.qiniu.api.io.PutExtra;
import com.qiniu.api.io.PutRet;
import com.qiniu.api.rs.GetPolicy;
import com.qiniu.api.rs.PutPolicy;
import com.qiniu.api.rs.URLUtils;

import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.processing.OperationManager;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.Region;
import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;
import com.qiniu.util.UrlSafeBase64;


@Service
public final class UploadServiceImpl implements UploadService {

    private String bucketName;
    private String domain;
    private String accessKey = "";
    private String secretKey = "";
    public static final String JPG = ".jpg";
    public static final String FLV = ".flv";

    /**
     * 初始化参数设置
     */
    public UploadServiceImpl() {

        QiNiuMedia niuMedia = QiNiuMedia.getInstance();
        this.domain = niuMedia.getDomain();
        this.bucketName = niuMedia.getBucketName();
        this.accessKey = niuMedia.getAccessKey();
        this.secretKey = niuMedia.getSecretKey();
        // 设置AccessKey
        Config.ACCESS_KEY = niuMedia.getAccessKey();
        // 设置SecretKey
        Config.SECRET_KEY = niuMedia.getSecretKey();
    }

    public boolean uploadFile(File file) throws AuthException, JSONException {
        String uptoken = getUpToken();
        // 可选的上传选项，具体说明请参见使用手册。
        PutExtra extra = new PutExtra();
        // 上传文件
        PutRet ret = IoApi.putFile(uptoken, file.getName(), file.getAbsolutePath(), extra);
        if (ret.ok()) {
            System.out.println("视频文件上传成功!");
            return true;
        } else {
            System.out.println("视频文件上传失败!");
            return false;
        }
    }

    /**
     * 从 inputstream 中写入七牛
     * 
     * @param fileName
     *            文件名
     * @param content
     *            要写入的内容
     */
    public boolean uploadFile(String fileName, InputStream in) throws AuthException, JSONException {
        String uptoken = getUpToken();
        // 可选的上传选项，具体说明请参见使用手册。
        PutExtra extra = new PutExtra();
        // 上传文件
        PutRet ret = IoApi.Put(uptoken, fileName, in, extra);
        if (ret.ok()) {
            System.out.println("视频文件上传成功!");
            return true;
        } else {
            System.out.println("视频文件上传失败!");
            return false;
        }

    }

    /**
     * 七牛上将文件删除
     */
    public void delete(String fileName) {

        Auth auth = Auth.create(accessKey, secretKey);
        Configuration c = new Configuration(Region.region0());
        // 实例化一个BucketManager对象
        BucketManager bucketManager = new BucketManager(auth, c);
        // 要测试的空间和key，并且这个key在你空间中存在
        String bucket = bucketName;
        String key = fileName;
        try {
            // 调用delete方法移动文件
            bucketManager.delete(bucket, key);
            System.out.println("文件删除成功!");
        } catch (QiniuException e) {
            System.out.println("文件删除失败!");
            // 捕获异常信息
            com.qiniu.http.Response r = e.response;
            System.out.println(r);
        }
    }
    
    /**
     * 七牛的视频转码
     * @param fileName  要转换的文件名称
     * @param format  要转成的视频格式
     */
    public String qiNiuTransCodeToAny(String fileName, String format) {
        long startTime = System.currentTimeMillis();// 获取当前时间
        // 身份验证
        Auth auth = Auth.create(accessKey, secretKey);
       
        Configuration c = new Configuration(Region.region0());
        // 新建一个OperationManager对象
        OperationManager operater = new OperationManager(auth, c);
        // 设置要转码的空间和key，并且这个key在你空间中存在(key就是文件的名字)
        String bucket = bucketName;
        String key = fileName;
        // 设置转码操作参数
        String fops = "avthumb/" + format + "/s/640x360/vb/1.25m";
        // 设置转码的队列
        String pipeline = bucketName;
        // 可以对转码后的文件进行使用saveas参数自定义命名，当然也可以不指定文件会默认命名并保存在当前空间。
        String str = fileName.substring(0, fileName.indexOf("."));
        String urlbase64 = UrlSafeBase64.encodeToString(bucketName + ":" + str
                + "." + format);
        String pfops = fops + "|saveas/" + urlbase64;
        // 设置pipeline参数
        StringMap params = new StringMap().putWhen("force", 1, true)
                .putNotEmpty("pipeline", pipeline);
        try {
            String persistid = operater.pfop(bucket, key, pfops, params);
            System.out.println(persistid);
        } catch (QiniuException e) {
            com.qiniu.http.Response r = e.response;// 捕获异常信息
            System.out.println(r.toString());// 请求失败时简单状态信息
            try {
                System.out.println(r.bodyString());// 响应的文本信息
            } catch (QiniuException e1) {
                System.out.println("视频转码失败");
            }
        }
        long endTime = System.currentTimeMillis();
        System.out.println("视频转码用时：" + (endTime - startTime) + "ms");

        return str + "." + format;
    }


    

    public String getFileResourceUrl(String filename) throws Exception {
        String downloadUrl = "";
        if (filename != null) {
            Mac mac = getMac();
            String baseUrl = URLUtils.makeBaseUrl(domain, filename);
            GetPolicy getPolicy = new GetPolicy();
            downloadUrl = getPolicy.makeRequest(baseUrl, mac);
        }
        return downloadUrl;
    }

    /**
     * 获取凭证
     */
    private String getUpToken() throws AuthException, JSONException {
        Mac mac = getMac();
        PutPolicy putPolicy = new PutPolicy(bucketName);
        String uptoken = putPolicy.token(mac);
        return uptoken;
    }

    /**
     * 操作许可
     */
    private Mac getMac() {
        Mac mac = new Mac(Config.ACCESS_KEY, Config.SECRET_KEY);
        return mac;
    }

}
