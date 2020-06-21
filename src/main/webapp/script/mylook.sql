CREATE TABLE mylook.user (
    user_id int NOT NULL AUTO_INCREMENT,
    username varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
    password varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
    gender tinyint  NOT NULL DEFAULT '1' COMMENT '性别',
    header varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
    user_introduction varchar(255) DEFAULT '' COMMENT '个人简介',
    follows int NOT NULL DEFAULT '0' COMMENT '关注数',
    fans int NOT NULL DEFAULT '0' COMMENT '粉丝数',
    hobby_id int NOT NULL DEFAULT '0'  COMMENT '最喜欢的爱好',
    create_time varchar(32) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间，insert时值为current_timestamp',
    update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    constraint pk_user primary key(user_id),
	  constraint qk_user unique(username)
)comment'用户表';

CREATE TABLE mylook.hobby_type(
   hobby_id int NOT NULL AUTO_INCREMENT,
   name varchar(100) NOT NULL DEFAULT '' COMMENT '爱好名称',
   hobby_picture varchar(255) NOT NULL DEFAULT '' COMMENT '爱好标题图',
   hobby_small_icon varchar(255) NOT NULL DEFAULT '' COMMENT'爱好小标题',
   state tinyint NOT NULL DEFAULT '0' COMMENT '0代表未审核，1代表审核中，2代表通过，3代表不通过',
   create_time varchar(32) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间，insert时值为current_timestamp',
   update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   constraint pk_hobby_type primary key(hobby_id),
   constraint qk_hobby_type unique(name)
)COMMENT '爱好分类表'; 

#业务--上传视频
CREATE TABLE mylook.video (
   video_id int NOT NULL AUTO_INCREMENT,
   name varchar(255) NOT NULL DEFAULT '' COMMENT '视频标题',
   video_cover varchar(300) NOT NULL DEFAULT '' COMMENT '视频封面',
   video_gif varchar(300) NOT NULL DEFAULT '' COMMENT'视频gif',
   video_url varchar(300) NOT NULL DEFAULT '' COMMENT '视频链接',
   type tinyint NOT NULL DEFAULT '0' COMMENT '视频类型：0代表原创，1代表转载',
   hobby_id int NOT NULL DEFAULT '0' COMMENT '爱好的类型ID,一对多',
   user_id int NOT NULL DEFAULT '0' COMMENT '归属人ID，一对多',
   video_introduction varchar(500) DEFAULT '' COMMENT '视频简介',
   state tinyint NOT NULL DEFAULT '0' COMMENT '0代表未审核，1代表审核中，2代表通过，3代表不通过',
   time varchar(50) NOT NULL DEFAULT '' COMMENT '视频时长，03:02',
   thumbs_up int NOT NULL DEFAULT '0' COMMENT '点赞数',
   collections int NOT NULL DEFAULT '0' COMMENT '收藏数',
   watch_count int NOT NULL DEFAULT '0' COMMENT '观看人数',
   create_time varchar(32) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间，insert时值为current_timestamp',
   update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   constraint video_id primary key(video_id),
  
   constraint fk_video_hobby foreign key(hobby_id) references mylook.hobby_type(hobby_id) ON DELETE CASCADE 
)comment'视频表';


#业务--看视频--多对多
CREATE TABLE mylook.video_history(
   history_id int NOT NULL AUTO_INCREMENT,
   user_id int NOT NULL DEFAULT '0' COMMENT '用户id',
   video_id int NOT NULL DEFAULT '0' COMMENT '视频id',
   create_time varchar(32) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间，insert时值为current_timestamp',
   update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   constraint pk_video_history primary key(history_id),
   constraint fk_video_history foreign key(video_id) references mylook.video(video_id) ON DELETE CASCADE 
)COMMENT'视频的历史记录表';


CREATE TABLE mylook.consts_site_carousel(
  carousel_id int NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  picture varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  url varchar(200) NOT NULL DEFAULT '' COMMENT '链接',
  create_time varchar(32) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间，insert时值为current_timestamp',
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  constraint pk_consts_site_carousel primary key(carousel_id)
) COMMENT='首页轮播表';

#业务--评论
CREATE TABLE mylook.video_comment(
   parent_id int NOT NULL AUTO_INCREMENT,
   user_id int NOT NULL DEFAULT '0' COMMENT '用户id',
   comment_user_id int NOT NULL DEFAULT '0' COMMENT '评论对象的用户id',
   video_id int NOT NULL DEFAULT '0' COMMENT '视频id',
   content varchar(255) NOT NULL DEFAULT '' COMMENT '评论内容',
   type tinyint NOT NULL DEFAULT '0' COMMENT '0代表评论视频的评论，comment_user_id为0；1代表对评论者的评论，comment_user_id不为0',
   create_time varchar(32) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间，insert时值为current_timestamp',
   update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   constraint pk_video_comment primary key(parent_id),
 constraint fk_video_comment foreign key(video_id) references mylook.video(video_id) ON DELETE CASCADE 
)COMMENT'视频评论表';

#业务--收藏--多对多
CREATE TABLE mylook.video_collection(
   collection_id int NOT NULL AUTO_INCREMENT,
   user_id int NOT NULL DEFAULT '0' COMMENT '用户id',
   video_id int NOT NULL DEFAULT '0' COMMENT '视频id',
   create_time varchar(32) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间，insert时值为current_timestamp',
   update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   constraint pk_video_collection primary key(collection_id),
  constraint fk_video_collection foreign key(video_id) references mylook.video(video_id) ON DELETE CASCADE 
)COMMENT'视频的收藏表';

#业务--点赞--多对多
CREATE TABLE mylook.video_thumbs_up(
   thumbs_up_id int NOT NULL AUTO_INCREMENT,
   user_id int NOT NULL DEFAULT '0' COMMENT '用户id',
   video_id int NOT NULL DEFAULT '0' COMMENT '视频id',
  create_time varchar(32) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间，insert时值为current_timestamp',
   update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   constraint pk_video_thumbs_up primary key(thumbs_up_id),
 constraint fk_video_thumbs_up foreign key(video_id) references mylook.video(video_id) ON DELETE CASCADE
)COMMENT'视频的点赞表';

#业务--关注--多对多
CREATE TABLE mylook.follow(
   follow_id int NOT NULL AUTO_INCREMENT,
   user_id int NOT NULL DEFAULT '0' COMMENT '用户id',
   follow_user_id int NOT NULL DEFAULT '0' COMMENT '关注的用户id',
  create_time varchar(32) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间，insert时值为current_timestamp',
   update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   constraint pk_follows primary key(follow_id),
  constraint fk_follow foreign key(follow_user_id) references mylook.user(user_id) ON DELETE CASCADE
)COMMENT'视频的关注表';


insert into mylook.user(username,password,header,hobby_id,create_time) values('陈明plus','!@#QWEasd123','http://qc681nkfa.bkt.clouddn.com/webwxgetmsgimg%20%284%29.jpg?e=1592626872&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:Mamm47YjgnkAF6EzV2lIW59RukA=',1,current_timestamp);

insert into mylook.user(username,password,header,hobby_id,create_time) values('德鑫plus','!@#QWEasd123','http://qc681nkfa.bkt.clouddn.com/webwxgetmsgimg%20%282%29.jpg?e=1592626905&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:emRdrdWvJxmPJtFqM0Sbp3c6RkQ=',2,current_timestamp);

insert into mylook.user(username,password,header,hobby_id,create_time) values('红日plus','!@#QWEasd123','http://qc681nkfa.bkt.clouddn.com/webwxgetmsgimg%20%283%29.jpg?e=1592626940&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:03EKoXbCYBcPXKinKp3mWnI3eIE=',3,current_timestamp);

insert into mylook.user(username,password,header,hobby_id,create_time) values('佳佳plus','!@#QWEasd123','http://qc681nkfa.bkt.clouddn.com/webwxgetmsgimg%20%281%29.jpg?e=1592626969&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:fenabeIOobNXt0wuJvaI3nZMkXc=',4,current_timestamp);

insert into mylook.user(username,password,header,hobby_id,create_time) values('俊俊plus','!@#QWEasd123','http://qc681nkfa.bkt.clouddn.com/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20200620112409.jpg?e=1592627074&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:HPH0zEqwzifNMw7YBa-mDX5NlNw=',5,current_timestamp);

insert into mylook.user(username,password,header,hobby_id,create_time) values('锋锋plus','!@#QWEasd123','http://qc681nkfa.bkt.clouddn.com/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20200620112409.jpg?e=1592627074&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:HPH0zEqwzifNMw7YBa-mDX5NlNw=',6,current_timestamp);

insert into mylook.user(username,password,header,hobby_id,create_time) values('桦桦plus','!@#QWEasd123','http://qc681nkfa.bkt.clouddn.com/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20200620112409.jpg?e=1592627074&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:HPH0zEqwzifNMw7YBa-mDX5NlNw=',7,current_timestamp);

insert into mylook.consts_site_carousel(name,picture,url,create_time) values('篮球','http://qc681nkfa.bkt.clouddn.com/1.jpg?e=1592615863&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:kByQ-o-34NOxOtQi_PB18LpGaSg=','https://www.baidu.com',current_timestamp);

insert into mylook.consts_site_carousel(name,picture,url,create_time) values('动漫','http://qc681nkfa.bkt.clouddn.com/2.jpg?e=1592615919&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:xpR4YLfBbJQe1e_2dnPdQ2C80xg=','https://www.baidu.com',current_timestamp);

insert into mylook.consts_site_carousel(name,picture,url,create_time) values('轮滑','http://qc681nkfa.bkt.clouddn.com/3.jpg?e=1592615949&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:kuqutjw7KjKCaOuVWFWoNSkyTp8=','https://www.baidu.com',current_timestamp);

insert into mylook.consts_site_carousel(name,picture,url,create_time) values('音乐','http://qc681nkfa.bkt.clouddn.com/4.jpg?e=1592615977&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:UI3DVLkXRWdlwI1IEBKelqenrLw=','https://www.baidu.com',current_timestamp);

insert into mylook.hobby_type(name, hobby_picture, hobby_small_icon, state, create_time)
values('轮滑', 'http://qc681nkfa.bkt.clouddn.com/c2.gif?e=1592625771&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:ymtrMXxsJDjzUaOcmvOzoQ4k_AY=', 'http://qc681nkfa.bkt.clouddn.com/%E8%BD%AE%E6%BB%91.jpg?e=1592625820&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:-nqnQAgWkqZkrbLL7zu2BRKX7tA=', 2, current_timestamp);

insert into mylook.hobby_type(name, hobby_picture, hobby_small_icon, state, create_time)
values('音乐', 'http://qc681nkfa.bkt.clouddn.com/c4.gif?e=1592625940&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:ZzhNg1uCpDRfh3ZFK5ZHYUvWoj4=', 'http://qc681nkfa.bkt.clouddn.com/%E9%9F%B3%E4%B9%90.jpg?e=1592625968&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:twt4OzcgpOEIaCEGUOxilYmb40k=', 2, current_timestamp);

insert into mylook.hobby_type(name, hobby_picture, hobby_small_icon, state, create_time)
values('动漫', 'http://qc681nkfa.bkt.clouddn.com/c1.gif?e=1592616830&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:PM1pcWxGF-ZzOVyJtuZt9xqVwOE=', 'http://qc681nkfa.bkt.clouddn.com/%E5%8A%A8%E6%BC%AB.jpg?e=1592616932&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:w8QgoKbyWzXJkupe_ywmVqZfmxU=', 2, current_timestamp);

insert into mylook.hobby_type(name, hobby_picture, hobby_small_icon, state, create_time)
values('篮球', 'http://qc681nkfa.bkt.clouddn.com/c3.gif?e=1592625868&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:tu3faDi3f6nX3Akfx9c4-rxmEmc=', 'http://qc681nkfa.bkt.clouddn.com/%E7%AF%AE%E7%90%83.jpg?e=1592625906&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:2bQdvojFLOuoy98lYquUVMVrwU4=', 2, current_timestamp);

insert into mylook.hobby_type(name, hobby_picture, hobby_small_icon, state, create_time)
values('美食', 'http://qc681nkfa.bkt.clouddn.com/c5.jpg?e=1592626007&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:W_KQYR4lt-RgaIJ44-f271uIOOg=', 'http://qc681nkfa.bkt.clouddn.com/%E7%BE%8E%E9%A3%9F.jpg?e=1592626042&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:uoRGqP5Tfiezt3Gq9P1xp0TOhvQ=', 2, current_timestamp);

insert into mylook.hobby_type(name, hobby_picture, hobby_small_icon, state, create_time)
values('学习', 'http://qc681nkfa.bkt.clouddn.com/c6.gif?e=1592739309&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:T0Q-kL7Ss3-7XqMHs4KSt8nmJSY=', 'http://qc681nkfa.bkt.clouddn.com/%E5%AD%A6%E4%B9%A0.jpg?e=1592735374&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:KfFsupd68BTKYnDD-1N46Tem8uM=', 2, current_timestamp);

insert into mylook.hobby_type(name, hobby_picture, hobby_small_icon, state, create_time)
values('街舞', 'http://qc681nkfa.bkt.clouddn.com/c7.jpg?e=1592739393&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:-JurcEgvoOmmADIMeuWF-RAHWfY=', 'http://qc681nkfa.bkt.clouddn.com/%E8%A1%97%E8%88%9E.jpg?e=1592739351&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:hJtvlZyz6bVgruAJBa81Q2SX7F0=', 2, current_timestamp);


insert into mylook.video(name, video_cover, video_gif, video_url, hobby_id, user_id, state, time, create_time)
values('蔡徐坤原来轮滑玩的这么溜', 'http://qc681nkfa.bkt.clouddn.com/%E8%94%A1%E5%BE%90%E5%9D%A4%E5%8E%9F%E6%9D%A5%E8%BD%AE%E6%BB%91%E7%8E%A9%E7%9A%84%E8%BF%99%E4%B9%88%E6%BA%9C.png?e=1592627629&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:PnOG4U7aKTv4pYt-t0QL6bNXgmI=', 'http://qc681nkfa.bkt.clouddn.com/%E8%94%A1%E5%BE%90%E5%9D%A4%E5%8E%9F%E6%9D%A5%E8%BD%AE%E6%BB%91%E7%8E%A9%E7%9A%84%E8%BF%99%E4%B9%88%E6%BA%9C.gif?e=1592627637&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:XWAI67QibcgOnVyoNTAkVPka3OU=', 'http://qc681nkfa.bkt.clouddn.com/%E8%94%A1%E5%BE%90%E5%9D%A4%E5%8E%9F%E6%9D%A5%E8%BD%AE%E6%BB%91%E7%8E%A9%E7%9A%84%E8%BF%99%E4%B9%88%E6%BA%9C.mp4?e=1592627706&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:3V5UYq7mc_9BpQ1mQf01z_MN5VI=', 1, 1, 2, '03:18', current_timestamp);

insert into mylook.video(name, video_cover, video_gif, video_url, hobby_id, user_id, state, time, create_time)
values('穿轮滑是怎么样下楼梯的', 'http://qc681nkfa.bkt.clouddn.com/%E7%A9%BF%E8%BD%AE%E6%BB%91%E6%98%AF%E6%80%8E%E4%B9%88%E6%A0%B7%E4%B8%8B%E6%A5%BC%E6%A2%AF%E7%9A%84.png?e=1592627792&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:JNCh09_e8KVqJ5QcWngVfsuR_PI=', 'http://qc681nkfa.bkt.clouddn.com/%E7%A9%BF%E8%BD%AE%E6%BB%91%E6%98%AF%E6%80%8E%E4%B9%88%E6%A0%B7%E4%B8%8B%E6%A5%BC%E6%A2%AF%E7%9A%84.gif?e=1592627798&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:K_KDGj034frmZXasuDisc1lKEQ0=', 'http://qc681nkfa.bkt.clouddn.com/%E7%A9%BF%E8%BD%AE%E6%BB%91%E6%98%AF%E6%80%8E%E4%B9%88%E6%A0%B7%E4%B8%8B%E6%A5%BC%E6%A2%AF%E7%9A%84.mp4?e=1592627815&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:FZFYDe-q6J99gkoj79tMaJBszEA=', 1, 1, 2, '01:24', current_timestamp);

insert into mylook.video(name, video_cover, video_gif, video_url, hobby_id, user_id, state, time, create_time)
values('儿童轮滑入门基础教程', 'http://qc681nkfa.bkt.clouddn.com/%E5%84%BF%E7%AB%A5%E8%BD%AE%E6%BB%91%E5%85%A5%E9%97%A8%E5%9F%BA%E7%A1%80%E6%95%99%E7%A8%8B.png?e=1592639565&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:m0IiyHt6rpMGD6B2o2cTUXsGBNw=', 'http://qc681nkfa.bkt.clouddn.com/%E5%84%BF%E7%AB%A5%E8%BD%AE%E6%BB%91%E5%85%A5%E9%97%A8%E5%9F%BA%E7%A1%80%E6%95%99%E7%A8%8B.gif?e=1592639572&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:Nv4FUJQtCQHYOJ2vr1LjV7InzhI=', 'http://qc681nkfa.bkt.clouddn.com/%E5%84%BF%E7%AB%A5%E8%BD%AE%E6%BB%91%E5%85%A5%E9%97%A8%E5%9F%BA%E7%A1%80%E6%95%99%E7%A8%8B.mp4?e=1592639613&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:sQz8MffGaHrCr2TaPUnsQdgW1PU=', 1, 1, 2, '01:28', current_timestamp);


insert into mylook.video(name, video_cover, video_gif, video_url, hobby_id, user_id, state, time, create_time)
values('会轮滑的小姐姐就是帅气', 'http://qc681nkfa.bkt.clouddn.com/%E4%BC%9A%E8%BD%AE%E6%BB%91%E7%9A%84%E5%B0%8F%E5%A7%90%E5%A7%90%E5%B0%B1%E6%98%AF%E5%B8%85%E6%B0%94.png?e=1592639706&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:HFvZmM_4kxRyYd-WzAIMcbhsFLw=', 'http://qc681nkfa.bkt.clouddn.com/%E4%BC%9A%E8%BD%AE%E6%BB%91%E7%9A%84%E5%B0%8F%E5%A7%90%E5%A7%90%E5%B0%B1%E6%98%AF%E5%B8%85%E6%B0%94.gif?e=1592639718&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:EQ29bog7m_s2WjbzltWVNRBLzvQ=', 'http://qc681nkfa.bkt.clouddn.com/%E4%BC%9A%E8%BD%AE%E6%BB%91%E7%9A%84%E5%B0%8F%E5%A7%90%E5%A7%90%E5%B0%B1%E6%98%AF%E5%B8%85%E6%B0%94.mp4?e=1592639751&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:TBKYnY0_ubWSKap6IpNUNxSfnmM=', 1, 1, 2, '02:36', current_timestamp);


insert into mylook.video(name, video_cover, video_gif, video_url, hobby_id, user_id, state, time, create_time)
values('姐姐这让人无可挑剔的实力', 'http://qc681nkfa.bkt.clouddn.com/%E5%A7%90%E5%A7%90%E8%BF%99%E8%AE%A9%E4%BA%BA%E6%97%A0%E5%8F%AF%E6%8C%91%E5%89%94%E7%9A%84%E5%AE%9E%E5%8A%9B.png?e=1592639837&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:cuvBSkAJeGxWZJzvGr90cdshrgo=', 'http://qc681nkfa.bkt.clouddn.com/%E5%A7%90%E5%A7%90%E8%BF%99%E8%AE%A9%E4%BA%BA%E6%97%A0%E5%8F%AF%E6%8C%91%E5%89%94%E7%9A%84%E5%AE%9E%E5%8A%9B.gif?e=1592639844&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:9veB7Pi1OB_IRK3h5E0OoxB0CoI=', 'http://qc681nkfa.bkt.clouddn.com/%E5%A7%90%E5%A7%90%E8%BF%99%E8%AE%A9%E4%BA%BA%E6%97%A0%E5%8F%AF%E6%8C%91%E5%89%94%E7%9A%84%E5%AE%9E%E5%8A%9B.mp4?e=1592639887&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:GKvJcesCwAk0UilB81QZhYVPc3I=', 1, 1, 2, '02:17', current_timestamp);



insert into mylook.video(name, video_cover, video_gif, video_url, hobby_id, user_id, state, time, create_time)
values('轮滑刹车合集', 'http://qc681nkfa.bkt.clouddn.com/%E8%BD%AE%E6%BB%91%E5%88%B9%E8%BD%A6%E5%90%88%E9%9B%86.png?e=1592639953&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:OicT4b1Lk8R4qAm6AFAadHyS2A0=', 'http://qc681nkfa.bkt.clouddn.com/%E8%BD%AE%E6%BB%91%E5%88%B9%E8%BD%A6%E5%90%88%E9%9B%86.gif?e=1592639960&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:zbb2Xo9JH1U4F-XLAlmd61TtM8Y=', 'http://qc681nkfa.bkt.clouddn.com/%E8%BD%AE%E6%BB%91%E5%88%B9%E8%BD%A6%E5%90%88%E9%9B%86.mp4?e=1592639977&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:LBpXi-clHWN-dm9vsc0_HkjkpQc=', 1, 1, 2, '01:30', current_timestamp);



insert into mylook.video(name, video_cover, video_gif, video_url, hobby_id, user_id, state, time, create_time)
values('轮滑高手花式炫技', 'http://qc681nkfa.bkt.clouddn.com/%E8%BD%AE%E6%BB%91%E9%AB%98%E6%89%8B%E8%8A%B1%E5%BC%8F%E7%82%AB%E6%8A%80.png?e=1592640047&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:Rn8UGJFXEa9ynDXVNXt-V-9FBGA=', 'http://qc681nkfa.bkt.clouddn.com/%E8%BD%AE%E6%BB%91%E9%AB%98%E6%89%8B%E8%8A%B1%E5%BC%8F%E7%82%AB%E6%8A%80.gif?e=1592640052&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:IdRT7NXSRMszpIlU9_4yPGaxzXA=', 'http://qc681nkfa.bkt.clouddn.com/%E8%BD%AE%E6%BB%91%E9%AB%98%E6%89%8B%E8%8A%B1%E5%BC%8F%E7%82%AB%E6%8A%80.mp4?e=1592640074&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:aNqzMa1tWbC-QBCcsN7kdXBoQaA=', 1, 1, 2, '01:45', current_timestamp);


insert into mylook.video(name, video_cover, video_gif, video_url, hobby_id, user_id, state, time, create_time)
values('你还有什么理由不玩轮滑？', 'http://qc681nkfa.bkt.clouddn.com/%E4%BD%A0%E8%BF%98%E6%9C%89%E4%BB%80%E4%B9%88%E7%90%86%E7%94%B1%E4%B8%8D%E7%8E%A9%E8%BD%AE%E6%BB%91%EF%BC%9F.png?e=1592640136&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:3p-lAsyTNb297y-8SSJVinPyk8I=', 'http://qc681nkfa.bkt.clouddn.com/%E4%BD%A0%E8%BF%98%E6%9C%89%E4%BB%80%E4%B9%88%E7%90%86%E7%94%B1%E4%B8%8D%E7%8E%A9%E8%BD%AE%E6%BB%91%EF%BC%9F.gif?e=1592640141&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:8kcZFuG7Ntlc1p9UJr3edvcnmTw=', 'http://qc681nkfa.bkt.clouddn.com/%E4%BD%A0%E8%BF%98%E6%9C%89%E4%BB%80%E4%B9%88%E7%90%86%E7%94%B1%E4%B8%8D%E7%8E%A9%E8%BD%AE%E6%BB%91%EF%BC%9F.mp4?e=1592640172&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:xSkZltUg4AjV_g-ZLwUwGdalrJk=', 1, 1, 2, '01:15', current_timestamp);







insert into mylook.video(name, video_cover, video_gif, video_url, hobby_id, user_id, state, time, create_time)
values('尊重生命，敬畏自然。', 'http://qc681nkfa.bkt.clouddn.com/%E5%B0%8A%E9%87%8D%E7%94%9F%E5%91%BD%EF%BC%8C%E6%95%AC%E7%95%8F%E8%87%AA%E7%84%B6%E3%80%82.jpg?e=1592640649&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:0LP85ny3vk51fBtlthjA1i-kroo=', 'http://qc681nkfa.bkt.clouddn.com/%E5%B0%8A%E9%87%8D%E7%94%9F%E5%91%BD%EF%BC%8C%E6%95%AC%E7%95%8F%E8%87%AA%E7%84%B6%E3%80%82.gif?e=1592640654&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:P1XTln-1PYk6zZJb9gnNdjr0qy4=', 'http://qc681nkfa.bkt.clouddn.com/%E5%B0%8A%E9%87%8D%E7%94%9F%E5%91%BD%EF%BC%8C%E6%95%AC%E7%95%8F%E8%87%AA%E7%84%B6%E3%80%82.mp4?e=1592640730&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:wWvxAMt5ecqqnYlUzZTJ0NtZZWE=', 2, 2, 2, '06:24', current_timestamp);

insert into mylook.video(name, video_cover, video_gif, video_url, hobby_id, user_id, state, time, create_time)
values('回头望一眼，已经很多年的时间。', 'http://qc681nkfa.bkt.clouddn.com/%E5%9B%9E%E5%A4%B4%E6%9C%9B%E4%B8%80%E7%9C%BC%EF%BC%8C%E5%B7%B2%E7%BB%8F%E5%BE%88%E5%A4%9A%E5%B9%B4%E7%9A%84%E6%97%B6%E9%97%B4%E3%80%82.jpg?e=1592640796&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:GIKlM0mDfDeQYHNeTqTeupb4BE8=', 'http://qc681nkfa.bkt.clouddn.com/%E5%9B%9E%E5%A4%B4%E6%9C%9B%E4%B8%80%E7%9C%BC%EF%BC%8C%E5%B7%B2%E7%BB%8F%E5%BE%88%E5%A4%9A%E5%B9%B4%E7%9A%84%E6%97%B6%E9%97%B4%E3%80%82.gif?e=1592640801&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:KwpmbDdBDFv-5HESaeGpmyRnTIs=', 'http://qc681nkfa.bkt.clouddn.com/%E5%9B%9E%E5%A4%B4%E6%9C%9B%E4%B8%80%E7%9C%BC%EF%BC%8C%E5%B7%B2%E7%BB%8F%E5%BE%88%E5%A4%9A%E5%B9%B4%E7%9A%84%E6%97%B6%E9%97%B4%E3%80%82.mp4?e=1592640814&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:pRHlW5YfJgISjSaZA-ipgVnTJxI=', 2, 2, 2, '03:21', current_timestamp);

insert into mylook.video(name, video_cover, video_gif, video_url, hobby_id, user_id, state, time, create_time)
values('你还记得那年的流星雨吗?', 'http://qc681nkfa.bkt.clouddn.com/%E4%BD%A0%E8%BF%98%E8%AE%B0%E5%BE%97%E9%82%A3%E5%B9%B4%E7%9A%84%E6%B5%81%E6%98%9F%E9%9B%A8%E5%90%97.jpg?e=1592640896&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:W_5NgsErVTtRli2YiaZR2-ydg1g=', 'http://qc681nkfa.bkt.clouddn.com/%E4%BD%A0%E8%BF%98%E8%AE%B0%E5%BE%97%E9%82%A3%E5%B9%B4%E7%9A%84%E6%B5%81%E6%98%9F%E9%9B%A8%E5%90%97.gif?e=1592640900&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:1w3g-Q46km2Cd-3Ux3e_psMMUAk=', 'http://qc681nkfa.bkt.clouddn.com/%E4%BD%A0%E8%BF%98%E8%AE%B0%E5%BE%97%E9%82%A3%E5%B9%B4%E7%9A%84%E6%B5%81%E6%98%9F%E9%9B%A8%E5%90%97.mp4?e=1592640923&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:Sl2MOdoLN_6FcrnI7DFYF-fgYbM=', 2, 2, 2, '04:32', current_timestamp);

insert into mylook.video(name, video_cover, video_gif, video_url, hobby_id, user_id, state, time, create_time)
values('最美不过七里香。', 'http://qc681nkfa.bkt.clouddn.com/%E6%9C%80%E7%BE%8E%E4%B8%8D%E8%BF%87%E4%B8%83%E9%87%8C%E9%A6%99%E3%80%82.jpg?e=1592640975&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:rkH-9tRJLZVmVoRlGCc1LT2zHeA=', 'http://qc681nkfa.bkt.clouddn.com/%E6%9C%80%E7%BE%8E%E4%B8%8D%E8%BF%87%E4%B8%83%E9%87%8C%E9%A6%99%E3%80%82.gif?e=1592640983&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:_NHAv-J2TxnS4lSdZbJ5ISCrRyY=', 'http://qc681nkfa.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E4%B8%83%E9%87%8C%E9%A6%99.mp4?e=1592641127&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:aap12B8TYEzqvYY9CxcrYozmMWs=', 2, 2, 2, '05:03', current_timestamp);

insert into mylook.video(name, video_cover, video_gif, video_url, hobby_id, user_id, state, time, create_time)
values('一个人能有多不正经就有多深情。', 'http://qc681nkfa.bkt.clouddn.com/%E4%B8%80%E4%B8%AA%E4%BA%BA%E8%83%BD%E6%9C%89%E5%A4%9A%E4%B8%8D%E6%AD%A3%E7%BB%8F%E5%B0%B1%E6%9C%89%E5%A4%9A%E6%B7%B1%E6%83%85%E3%80%82.jpg?e=1592641166&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:t0mdoz-PeprnYL5UgWp9Z-iqieU=', 'http://qc681nkfa.bkt.clouddn.com/%E4%B8%80%E4%B8%AA%E4%BA%BA%E8%83%BD%E6%9C%89%E5%A4%9A%E4%B8%8D%E6%AD%A3%E7%BB%8F%E5%B0%B1%E6%9C%89%E5%A4%9A%E6%B7%B1%E6%83%85%E3%80%82.gif?e=1592641172&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:96eoJMDlKbf0H1HX4K1HdVnUd2M=', 'http://qc681nkfa.bkt.clouddn.com/%E4%B8%80%E4%B8%AA%E4%BA%BA%E8%83%BD%E6%9C%89%E5%A4%9A%E4%B8%8D%E6%AD%A3%E7%BB%8F%E5%B0%B1%E6%9C%89%E5%A4%9A%E6%B7%B1%E6%83%85%E3%80%82.mp4?e=1592641218&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:6QGdLDK0l9r09K9iruF82rxLEa8=', 2, 2, 2, '05:17', current_timestamp);

insert into mylook.video(name, video_cover, video_gif, video_url, hobby_id, user_id, state, time, create_time)
values('时光里凋零，记忆中盛开。', 'http://qc681nkfa.bkt.clouddn.com/%E6%97%B6%E5%85%89%E9%87%8C%E5%87%8B%E9%9B%B6%EF%BC%8C%E8%AE%B0%E5%BF%86%E4%B8%AD%E7%9B%9B%E5%BC%80%E3%80%82.jpg?e=1592641256&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:th2tBoaPNy6Bwvrof8-2MuUGLQE=', 'http://qc681nkfa.bkt.clouddn.com/%E6%97%B6%E5%85%89%E9%87%8C%E5%87%8B%E9%9B%B6%EF%BC%8C%E8%AE%B0%E5%BF%86%E4%B8%AD%E7%9B%9B%E5%BC%80%E3%80%82.gif?e=1592641272&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:N2SFHq5gvXRTO9quhH1SzkEYAbg=', 'http://qc681nkfa.bkt.clouddn.com/%E6%97%B6%E5%85%89%E9%87%8C%E5%87%8B%E9%9B%B6%EF%BC%8C%E8%AE%B0%E5%BF%86%E4%B8%AD%E7%9B%9B%E5%BC%80%E3%80%82.mp4?e=1592641308&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:x68Lfbind3LcfDwfUr1HrwvE8oE=', 2, 2, 2, '05:53', current_timestamp);

insert into mylook.video(name, video_cover, video_gif, video_url, hobby_id, user_id, state, time, create_time)
values('华语乐坛天花板-《夜的第七章》。', 'http://qc681nkfa.bkt.clouddn.com/%E5%8D%8E%E8%AF%AD%E4%B9%90%E5%9D%9B%E5%A4%A9%E8%8A%B1%E6%9D%BF-%E3%80%8A%E5%A4%9C%E7%9A%84%E7%AC%AC%E4%B8%83%E7%AB%A0%E3%80%8B%E3%80%82.jpg?e=1592641361&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:0BUF-BXltIOhzs8n4fG-iPUkw-Q=', 'http://qc681nkfa.bkt.clouddn.com/%E5%8D%8E%E8%AF%AD%E4%B9%90%E5%9D%9B%E5%A4%A9%E8%8A%B1%E6%9D%BF-%E3%80%8A%E5%A4%9C%E7%9A%84%E7%AC%AC%E4%B8%83%E7%AB%A0%E3%80%8B%E3%80%82.gif?e=1592641367&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:243hbSw_hTLMCBAc7GOWiMMnv-c=', 'http://qc681nkfa.bkt.clouddn.com/%E5%8D%8E%E8%AF%AD%E4%B9%90%E5%9D%9B%E5%A4%A9%E8%8A%B1%E6%9D%BF-%E3%80%8A%E5%A4%9C%E7%9A%84%E7%AC%AC%E4%B8%83%E7%AB%A0%E3%80%8B%E3%80%82.mp4?e=1592641391&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:mCUGc_xgy3M732nuqSNs50x7Xfk=', 2, 2, 2, '03:49', current_timestamp);

insert into mylook.video(name, video_cover, video_gif, video_url, hobby_id, user_id, state, time, create_time)
values('致敬教父，周董巅峰之作。', 'http://qc681nkfa.bkt.clouddn.com/%E8%87%B4%E6%95%AC%E6%95%99%E7%88%B6%EF%BC%8C%E5%91%A8%E8%91%A3%E5%B7%85%E5%B3%B0%E4%B9%8B%E4%BD%9C%E3%80%82.jpg?e=1592641482&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:UYmuUdP2uD9s8yqKeLfnSmgVFyA=', 'http://qc681nkfa.bkt.clouddn.com/%E8%87%B4%E6%95%AC%E6%95%99%E7%88%B6%EF%BC%8C%E5%91%A8%E8%91%A3%E5%B7%85%E5%B3%B0%E4%B9%8B%E4%BD%9C%E3%80%82.gif?e=1592641487&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:loKGvob6zBqypOR0iV6rvjv3xPA=', 'http://qc681nkfa.bkt.clouddn.com/%E8%87%B4%E6%95%AC%E6%95%99%E7%88%B6%EF%BC%8C%E5%91%A8%E8%91%A3%E5%B7%85%E5%B3%B0%E4%B9%8B%E4%BD%9C%E3%80%82.mp4?e=1592641508&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:4X6KNQzH0sOtCvwUqxIyLRF8FJQ=', 2, 2, 2, '06:01', current_timestamp);




insert into mylook.video(name, video_cover, video_gif, video_url, hobby_id, user_id, state, time, create_time)
values('用战斗祭奠这个世界', 'http://qc681nkfa.bkt.clouddn.com/%E7%94%A8%E6%88%98%E6%96%97%E7%A5%AD%E5%A5%A0%E8%BF%99%E4%B8%AA%E4%B8%96%E7%95%8C.jpg?e=1592725530&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:QoSnkPxdyycCbEk9dZrx_SWFZzk=', 'http://qc681nkfa.bkt.clouddn.com/%E7%94%A8%E6%88%98%E6%96%97%E7%A5%AD%E5%A5%A0%E8%BF%99%E4%B8%AA%E4%B8%96%E7%95%8C.gif?e=1592725555&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:AoXd9lVUfIpccKk6XrBv91wi4VE=', 'http://qc681nkfa.bkt.clouddn.com/%E7%94%A8%E6%88%98%E6%96%97%E7%A5%AD%E5%A5%A0%E8%BF%99%E4%B8%AA%E4%B8%96%E7%95%8C%282%29.mp4?e=1592725611&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:_cZDL9A61vOqeIsaAOivg40q5Qg=', 3, 3, 2, '03:51', current_timestamp);

insert into mylook.video(name, video_cover, video_gif, video_url, hobby_id, user_id, state, time, create_time)
values('不屈的正义', 'http://qc681nkfa.bkt.clouddn.com/%E4%B8%8D%E5%B1%88%E7%9A%84%E6%AD%A3%E4%B9%89.jpg?e=1592725679&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:EPUVnN9OUuTVGxeL2km_phHWVTA=', 'http://qc681nkfa.bkt.clouddn.com/%E4%B8%8D%E5%B1%88%E7%9A%84%E6%AD%A3%E4%B9%89.gif?e=1592725696&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:sC_GTqMixdS6ggH9gXqHytix5ak=', 'http://qc681nkfa.bkt.clouddn.com/%E4%B8%8D%E5%B1%88%E7%9A%84%E6%AD%A3%E4%B9%89%282%29.mp4?e=1592725761&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:nv3Vwp3S3z3maTZOVK2TvdXV8E4=', 3, 3, 2, '04:07', current_timestamp);

insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('动漫综合向', 'http://qc681nkfa.bkt.clouddn.com/%E5%8A%A8%E6%BC%AB%E7%BB%BC%E5%90%88%E5%90%91.png?e=1592725817&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:JizOLb22N3NsVEP_BDx2XzZtuyI=', 'http://qc681nkfa.bkt.clouddn.com/%E5%8A%A8%E6%BC%AB%E7%BB%BC%E5%90%88%E5%90%91%282%29.mp4?e=1592725853&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:yUjw0zlOAG-wsYR2n8-o9WQ1ir8=', 3, 3, 2, '01:15', current_timestamp);

insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('立体机动带来的视听体验', 'http://qc681nkfa.bkt.clouddn.com/%E7%AB%8B%E4%BD%93%E6%9C%BA%E5%8A%A8%E5%B8%A6%E6%9D%A5%E7%9A%84%E8%A7%86%E5%90%AC%E4%BD%93%E9%AA%8C.jpg?e=1592725926&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:Iw7ZkjinZpD4wufIWo3DP6o0Hro=', 'http://qc681nkfa.bkt.clouddn.com/%E7%AB%8B%E4%BD%93%E6%9C%BA%E5%8A%A8%E5%B8%A6%E6%9D%A5%E7%9A%84%E8%A7%86%E5%90%AC%E4%BD%93%E9%AA%8C%282%29.mp4?e=1592726038&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:3PSLxVvID5520raZOdOPPZ-B8YM=', 3, 3, 2, '03:35', current_timestamp);

insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('当你变成魔鬼时，世界便是地狱', 'http://qc681nkfa.bkt.clouddn.com/%E5%BD%93%E4%BD%A0%E5%8F%98%E6%88%90%E9%AD%94%E9%AC%BC%E6%97%B6%EF%BC%8C%E4%B8%96%E7%95%8C%E4%BE%BF%E6%98%AF%E5%9C%B0%E7%8B%B1.png?e=1592726082&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:ywxKFt_t9CXY9YnuxWZUXfOS5-g=', 'http://qc681nkfa.bkt.clouddn.com/%E5%BD%93%E4%BD%A0%E5%8F%98%E6%88%90%E9%AD%94%E9%AC%BC%E6%97%B6%EF%BC%8C%E4%B8%96%E7%95%8C%E4%BE%BF%E6%98%AF%E5%9C%B0%E7%8B%B1%282%29.mp4?e=1592726126&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:AVX6fFgNCm6R6w25JAsFVm5w_PU=', 3, 3, 2, '03:02', current_timestamp);

insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('当我拔剑那一刻', 'http://qc681nkfa.bkt.clouddn.com/%E5%BD%93%E6%88%91%E6%8B%94%E5%89%91%E9%82%A3%E4%B8%80%E5%88%BB.png?e=1592726277&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:D0o3LyZwqg-fmS2qouGT0llVNDU=', 'http://qc681nkfa.bkt.clouddn.com/%E5%BD%93%E6%88%91%E6%8B%94%E5%89%91%E9%82%A3%E4%B8%80%E5%88%BB%282%29.mp4?e=1592726326&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:C4hC7Il7mdaGrMFBQer0Rd9Eut0=', 3, 3, 2, '03:17', current_timestamp);


insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('声之形-虐心向', 'http://qc681nkfa.bkt.clouddn.com/%E5%A3%B0%E4%B9%8B%E5%BD%A2-%E8%99%90%E5%BF%83%E5%90%91.jpg?e=1592726396&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:OQuCgpSsoWHMA8UnLZjor3xWG_k=', 'http://qc681nkfa.bkt.clouddn.com/%E5%A3%B0%E4%B9%8B%E5%BD%A2-%E8%99%90%E5%BF%83%E5%90%91%282%29.mp4?e=1592726442&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:DNnPJ8tfzixlZSEBrq0fqRx0Pfw=', 3, 3, 2, '04:25', current_timestamp);

insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('你能否听见那声之形', 'http://qc681nkfa.bkt.clouddn.com/%E4%BD%A0%E8%83%BD%E5%90%A6%E5%90%AC%E8%A7%81%E9%82%A3%E5%A3%B0%E4%B9%8B%E5%BD%A2.jpg?e=1592726513&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:WMDcHh6_GY3KlykflR_nJ7XyN6k=', 'http://qc681nkfa.bkt.clouddn.com/%E4%BD%A0%E8%83%BD%E5%90%A6%E5%90%AC%E8%A7%81%E9%82%A3%E5%A3%B0%E4%B9%8B%E5%BD%A2%282%29.mp4?e=1592726648&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:cCqLBVaS8W6a_RgRiE5thb5T6y4=', 3, 3, 2, '05:26', current_timestamp);




insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('当控球与音乐结合', 'http://qc681nkfa.bkt.clouddn.com/%E5%BD%93%E6%8E%A7%E7%90%83%E4%B8%8E%E9%9F%B3%E4%B9%90%E7%BB%93%E5%90%88.PNG?e=1592726820&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:RZzUoei--EjzAGV-J2QBP21rlBY=', 'http://qc681nkfa.bkt.clouddn.com/%E5%BD%93%E6%8E%A7%E7%90%83%E4%B8%8E%E9%9F%B3%E4%B9%90%E7%BB%93%E5%90%88.mp4?e=1592726861&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:r9TednMCrFcKJGqLglBo5F-9-gE=', 4, 4, 2, '00:52', current_timestamp);

insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('极致暴力美学', 'http://qc681nkfa.bkt.clouddn.com/%E6%9E%81%E8%87%B4%E6%9A%B4%E5%8A%9B%E7%BE%8E%E5%AD%A6.PNG?e=1592727007&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:5Pq3xMKRELxIydXEvVjDEr1KLa8=', 'http://qc681nkfa.bkt.clouddn.com/%E6%9E%81%E8%87%B4%E6%9A%B4%E5%8A%9B%E7%BE%8E%E5%AD%A6.mp4?e=1592727021&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:Mn5uZBTzdBd0Gj6s8sLrrnEeApE=', 4, 4, 2, '00:23', current_timestamp);


insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('美式单挑局', 'http://qc681nkfa.bkt.clouddn.com/%E7%BE%8E%E5%BC%8F%E5%8D%95%E6%8C%91%E5%B1%80.PNG?e=1592727091&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:V0WzvsikdM1fTxStc7Y9dfks7yQ=', 'http://qc681nkfa.bkt.clouddn.com/%E7%BE%8E%E5%BC%8F%E5%8D%95%E6%8C%91%E5%B1%80.MP4?e=1592727132&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:kwTqPu4d_w_oXIOKvp0esEfo0ro=', 4, 4, 2, '01:26', current_timestamp);


insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('球场上的回应', 'http://qc681nkfa.bkt.clouddn.com/%E7%90%83%E5%9C%BA%E4%B8%8A%E7%9A%84%E5%9B%9E%E5%BA%94.PNG?e=1592727189&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:VJx5AAc0H5p1a1QSpDrBmEtdPz0=', 'http://qc681nkfa.bkt.clouddn.com/%E7%90%83%E5%9C%BA%E4%B8%8A%E7%9A%84%E5%9B%9E%E5%BA%94.MP4?e=1592727218&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:1-V0jyWoVUTXCmubPj06ZsSZr7c=', 4, 4, 2, '00:25', current_timestamp);

insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('球队顶级核心的操作', 'http://qc681nkfa.bkt.clouddn.com/%E7%90%83%E9%98%9F%E9%A1%B6%E7%BA%A7%E6%A0%B8%E5%BF%83%E7%9A%84%E6%93%8D%E4%BD%9C.PNG?e=1592727288&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:DZDHYAyGRfo_fCSAU8qVei9Nvv8=', 'http://qc681nkfa.bkt.clouddn.com/%E7%90%83%E9%98%9F%E9%A1%B6%E7%BA%A7%E6%A0%B8%E5%BF%83%E7%9A%84%E6%93%8D%E4%BD%9C.mp4?e=1592727320&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:9ZtsHObQy_gCTkYCfphb58CSDXs=', 4, 4, 2, '02:03', current_timestamp);


insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('让你惊掉下巴的扣篮', 'http://qc681nkfa.bkt.clouddn.com/%E8%AE%A9%E4%BD%A0%E6%83%8A%E6%8E%89%E4%B8%8B%E5%B7%B4%E7%9A%84%E6%89%A3%E7%AF%AE.PNG?e=1592727379&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:GF_Bx-cISx2kPYx5v2fK0NyRi6A=', 'http://qc681nkfa.bkt.clouddn.com/%E8%AE%A9%E4%BD%A0%E6%83%8A%E6%8E%89%E4%B8%8B%E5%B7%B4%E7%9A%84%E6%89%A3%E7%AF%AE.MP4?e=1592727416&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:K72-u0pZMLcpj3SoEh8qpkjUtio=', 4, 4, 2, '01:02', current_timestamp);


insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('速度身体与身高的对决', 'http://qc681nkfa.bkt.clouddn.com/%E9%80%9F%E5%BA%A6%E8%BA%AB%E4%BD%93%E4%B8%8E%E8%BA%AB%E9%AB%98%E7%9A%84%E5%AF%B9%E5%86%B3.PNG?e=1592727530&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:VW9ggySJWLD7WQjuLlM6PmkPPlg=', 'http://qc681nkfa.bkt.clouddn.com/%E9%80%9F%E5%BA%A6%E8%BA%AB%E4%BD%93%E4%B8%8E%E8%BA%AB%E9%AB%98%E7%9A%84%E5%AF%B9%E5%86%B3.MP4?e=1592727625&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:0CkK5t8ltk88BgyLpRIelpBU8C8=', 4, 4, 2, '05:03', current_timestamp);


insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('威少的残暴扣篮', 'http://qc681nkfa.bkt.clouddn.com/%E5%A8%81%E5%B0%91%E7%9A%84%E6%AE%8B%E6%9A%B4%E6%89%A3%E7%AF%AE.PNG?e=1592727675&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:bYdRkHiftI24c5TfOuMuF1lW88w=', 'http://qc681nkfa.bkt.clouddn.com/%E5%A8%81%E5%B0%91%E7%9A%84%E6%AE%8B%E6%9A%B4%E6%89%A3%E7%AF%AE.MP4?e=1592727703&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:Ucnk4DgbR0ZeENnB3F-IvtrFip0=', 4, 4, 2, '00:26', current_timestamp);



insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('自制一锅家庭火锅面', 'http://qc681nkfa.bkt.clouddn.com/%E8%87%AA%E5%88%B6%E4%B8%80%E9%94%85%E5%AE%B6%E5%BA%AD%E7%81%AB%E9%94%85%E9%9D%A2.jpg?e=1592733863&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:hwK5wtOK0G4lXj6UXiXHUdSY_p4=', 'http://qc681nkfa.bkt.clouddn.com/%E8%87%AA%E5%88%B6%E4%B8%80%E9%94%85%E5%AE%B6%E5%BA%AD%E7%81%AB%E9%94%85%E9%9D%A2%282%29.mp4?e=1592733887&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:oM-RbiOhWYV2vuEJScTXIQ4T6jg=', 5, 5, 2, '01:35', current_timestamp);

insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('买一台关东煮机，自己做一大锅吃到爽', 'http://qc681nkfa.bkt.clouddn.com/%E4%B9%B0%E4%B8%80%E5%8F%B0%E5%85%B3%E4%B8%9C%E7%85%AE%E6%9C%BA.jpg?e=1592734069&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:iB3gk-XYCF-eCQw4RnITuD6FTpY=', 'http://qc681nkfa.bkt.clouddn.com/%E4%B9%B0%E4%B8%80%E5%8F%B0%E5%85%B3%E4%B8%9C%E7%85%AE%E6%9C%BA%282%29.mp4?e=1592734099&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:nT_sUqwcqVWzbSMdf6oSwIieGhA=', 5, 5, 2, '05:55', current_timestamp);

insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('肯德基和华莱士差别真的很大吗？各点餐100元哪家更坑呢？', 'http://qc681nkfa.bkt.clouddn.com/%E8%82%AF%E5%BE%B7%E5%9F%BA%E5%92%8C%E5%8D%8E%E8%8E%B1%E5%A3%AB%E5%B7%AE%E5%88%AB%E7%9C%9F%E7%9A%84%E5%BE%88%E5%A4%A7%E5%90%97.jpg?e=1592734140&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:81GyUtYyeDcWPWWIwuAiyA_GZHs=', 'http://qc681nkfa.bkt.clouddn.com/%E8%82%AF%E5%BE%B7%E5%9F%BA%E5%92%8C%E5%8D%8E%E8%8E%B1%E5%A3%AB%E5%B7%AE%E5%88%AB%E7%9C%9F%E7%9A%84%E5%BE%88%E5%A4%A7%E5%90%97%282%29.mp4?e=1592734166&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:l2wPSGLoVNYzuLbIsEVkOhjLvvc=', 5, 5, 2, '06:45', current_timestamp);

insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('原来低价佛跳墙里的鱼翅就是这种！你还敢吃吗？', 'http://qc681nkfa.bkt.clouddn.com/%E5%8E%9F%E6%9D%A5%E4%BD%8E%E4%BB%B7%E4%BD%9B%E8%B7%B3%E5%A2%99%E9%87%8C%E7%9A%84%E9%B1%BC.jpg?e=1592734193&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:Aua01JhtAQ6gLNuxRH5cNEScPlc=', 'http://qc681nkfa.bkt.clouddn.com/%E5%8E%9F%E6%9D%A5%E4%BD%8E%E4%BB%B7%E4%BD%9B%E8%B7%B3%E5%A2%99%E9%87%8C%E7%9A%84%E9%B1%BC%282%29.mp4?e=1592734226&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:gTbqeEwwSgOSdG-4chVWogaRPUg=', 5, 5, 2, '04:49', current_timestamp);

insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('原来街边小贩用这个做奥尔良烤鸡！太简单了吧！', 'http://qc681nkfa.bkt.clouddn.com/%E5%8E%9F%E6%9D%A5%E8%A1%97%E8%BE%B9%E5%B0%8F%E8%B4%A9%E7%94%A8%E8%BF%99%E4%B8%AA%E5%81%9A%E5%A5%A5.jpg?e=1592734278&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:p_l0tY4tJKCCdDuMZcRKrPYEi5Q=', 'http://qc681nkfa.bkt.clouddn.com/%E5%8E%9F%E6%9D%A5%E8%A1%97%E8%BE%B9%E5%B0%8F%E8%B4%A9%E7%94%A8%E8%BF%99%E4%B8%AA%E5%81%9A%E5%A5%A5%282%29.mp4?e=1592734310&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:2yB-HeBSYp7Wta_5lStudLdOXfM=', 5, 5, 2, '04:46', current_timestamp);

insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('街边诱人“旋转烤鸡”17块钱一只？每次路过都香喷喷，买两只尝尝', 'http://qc681nkfa.bkt.clouddn.com/%E6%AF%8F%E6%AC%A1%E8%B7%AF%E8%BF%87%E9%83%BD%E9%A6%99%E5%96%B7%E5%96%B7%EF%BC%8C%E4%B9%B0%E4%B8%A4%E5%8F%AA%E5%B0%9D%E5%B0%9D.jpg?e=1592734419&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:Hljw9UAfLvDED4rLfFWP_IvKt1I=', 'http://qc681nkfa.bkt.clouddn.com/%E6%AF%8F%E6%AC%A1%E8%B7%AF%E8%BF%87%E9%83%BD%E9%A6%99%E5%96%B7%E5%96%B7%EF%BC%8C%E4%B9%B0%E4%B8%A4%E5%8F%AA%E5%B0%9D%E5%B0%9D%282%29.mp4?e=1592734454&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:P3Nx-3p903nstNH_yXW5b8wDJ-o=', 5, 5, 2, '04:31', current_timestamp);

insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('小美女19岁生日，阿冰准备了皇冠蛋糕，还有一大锅牛蛙大虾，嗨皮', 'http://qc681nkfa.bkt.clouddn.com/%E5%B0%8F%E7%BE%8E%E5%A5%B319%E5%B2%81%E7%94%9F%E6%97%A5.jpg?e=1592734487&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:yLiTuFkIOmxBNNMtHYeGe2o4g3s=', 'http://qc681nkfa.bkt.clouddn.com/%E5%B0%8F%E7%BE%8E%E5%A5%B319%E5%B2%81%E7%94%9F%E6%97%A5%282%29.mp4?e=1592734519&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:WVO8oMQE_kau1TmykqgyZgcIk3w=', 5, 5, 2, '03:53', current_timestamp);

insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('三人去吃大排档，特色菜点了一桌子，喝冰镇扎啤路边撸串，真过瘾', 'http://qc681nkfa.bkt.clouddn.com/%E4%B8%89%E4%BA%BA%E5%8E%BB%E5%90%83%E5%A4%A7%E6%8E%92%E6%A1%A3.jpg?e=1592734551&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:tRBABrfx-nfr2dnMdNebQvNQPMg=', 'http://qc681nkfa.bkt.clouddn.com/%E4%B8%89%E4%BA%BA%E5%8E%BB%E5%90%83%E5%A4%A7%E6%8E%92%E6%A1%A3%282%29.mp4?e=1592734580&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:8MFrp14kopIhd4Yzypwf6Cm4QFA=', 5, 5, 2, '03:37', current_timestamp);




insert into mylook.video(name, video_cover, video_gif, video_url, hobby_id, user_id, state, time, create_time)
values('「RAB」宅男们跳《鬼灭之刃》OP', 'http://qc681nkfa.bkt.clouddn.com/%E3%80%8CRAB%E3%80%8D%E5%AE%85%E7%94%B7%E4%BB%AC%E8%B7%B3%E3%80%8A%E9%AC%BC%E7%81%AD%E4%B9%8B%E5%88%83%E3%80%8BOP.png?e=1592742307&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:w-mmzkaJErRWs92rEGLP08xAUK0=', 'http://qc681nkfa.bkt.clouddn.com/%E3%80%8CRAB%E3%80%8D%E5%AE%85%E7%94%B7%E4%BB%AC%E8%B7%B3%E3%80%8A%E9%AC%BC%E7%81%AD%E4%B9%8B%E5%88%83%E3%80%8BOP.gif?e=1592742339&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:r4nIgTfJlC5yB1Ati9fAHd8xheE=', 'http://qc681nkfa.bkt.clouddn.com/%E3%80%8Crab%E3%80%8D%E5%AE%85%E7%94%B7%E4%BB%AC%E8%B7%B3%E3%80%8A%E9%AC%BC%E7%81%AD%E4%B9%8B%E5%88%83%E3%80%8Bop.mp4?e=1592742383&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:3o0qzE248gNW7oL8IthJb_Nf6PM=', 7, 7, 2, '02:40', current_timestamp);

insert into mylook.video(name, video_cover, video_gif, video_url, hobby_id, user_id, state, time, create_time)
values('【经典视频】MJ1997 经典45度', 'http://qc681nkfa.bkt.clouddn.com/%E3%80%90%E7%BB%8F%E5%85%B8%E8%A7%86%E9%A2%91%E3%80%91MJ1997%20%E7%BB%8F%E5%85%B845%E5%BA%A6.png?e=1592742740&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:Lkb9D2LPTzHsbhdd2wHwfEQsEbY=', 'http://qc681nkfa.bkt.clouddn.com/%E3%80%90%E7%BB%8F%E5%85%B8%E8%A7%86%E9%A2%91%E3%80%91MJ1997%20%E7%BB%8F%E5%85%B845%E5%BA%A6.gif?e=1592742746&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:WsG5I0jkcSi-WGVpMDQ9hw9BfTI=', 'http://qc681nkfa.bkt.clouddn.com/%E3%80%90%E7%BB%8F%E5%85%B8%E8%A7%86%E9%A2%91%E3%80%91mj1997%20%E7%BB%8F%E5%85%B845%E5%BA%A6.mp4?e=1592742801&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:ougxg6VAb5CEfFPnFQKM0qYrGBc=', 7, 7, 2, '05:50', current_timestamp);

insert into mylook.video(name, video_cover, video_gif, video_url, hobby_id, user_id, state, time, create_time)
values('【张艺兴】这tm才是内娱天花板！', 'http://qc681nkfa.bkt.clouddn.com/%E3%80%90%E5%BC%A0%E8%89%BA%E5%85%B4%E3%80%91%E8%BF%99TM%E6%89%8D%E6%98%AF%E5%86%85%E5%A8%B1%E5%A4%A9%E8%8A%B1%E6%9D%BF%EF%BC%81.png?e=1592742909&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:uoeZmfyELFGTztTQA_Jo5wKzOx0=', 'http://qc681nkfa.bkt.clouddn.com/%E3%80%90%E5%BC%A0%E8%89%BA%E5%85%B4%E3%80%91%E8%BF%99TM%E6%89%8D%E6%98%AF%E5%86%85%E5%A8%B1%E5%A4%A9%E8%8A%B1%E6%9D%BF%EF%BC%81.gif?e=1592742915&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:m9f7ogIPxAQ_kCMILl0E3mkagk4=', 'http://qc681nkfa.bkt.clouddn.com/%E3%80%90%E5%BC%A0%E8%89%BA%E5%85%B4%E3%80%91%E8%BF%99tm%E6%89%8D%E6%98%AF%E5%86%85%E5%A8%B1%E5%A4%A9%E8%8A%B1%E6%9D%BF%EF%BC%81.mp4?e=1592742988&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:q4GUuYzZ9VTRb-wBxXAhEgP6Nrs=', 7, 7, 2, '02:01', current_timestamp);

insert into mylook.video(name, video_cover, video_gif, video_url, hobby_id, user_id, state, time, create_time)
values('B站up参加这就是街舞', 'http://qc681nkfa.bkt.clouddn.com/B%E7%AB%99up%E5%8F%82%E5%8A%A0%E8%BF%99%E5%B0%B1%E6%98%AF%E8%A1%97%E8%88%9E.png?e=1592743276&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:IjZWk5_F6hym8rnM-22QLHASXMA=', 'http://qc681nkfa.bkt.clouddn.com/B%E7%AB%99up%E5%8F%82%E5%8A%A0%E8%BF%99%E5%B0%B1%E6%98%AF%E8%A1%97%E8%88%9E.gif?e=1592743282&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:bWDohOs2ytfBKtYZT70R3NCDyes=', 'http://qc681nkfa.bkt.clouddn.com/b%E7%AB%99up%E5%8F%82%E5%8A%A0%E8%BF%99%E5%B0%B1%E6%98%AF%E8%A1%97%E8%88%9E.mp4?e=1592743334&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:qq3UpWf8G16FyAi7RJTtmEJtIvM=', 7, 7, 2, '04:38', current_timestamp);

insert into mylook.video(name, video_cover, video_gif, video_url, hobby_id, user_id, state, time, create_time)
values('超燃！王嘉尔获街舞', 'http://qc681nkfa.bkt.clouddn.com/%E8%B6%85%E7%87%83%EF%BC%81%E7%8E%8B%E5%98%89%E5%B0%94%E8%8E%B7%E8%A1%97%E8%88%9E.png?e=1592743706&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:pgMTORHwEgPaB1EdDalNFzmVWWw=', 'http://qc681nkfa.bkt.clouddn.com/%E8%B6%85%E7%87%83%EF%BC%81%E7%8E%8B%E5%98%89%E5%B0%94%E8%8E%B7%E8%A1%97%E8%88%9E.gif?e=1592743711&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:C0zAklsu5OE2UNxzh7z5YMviwsc=', 'http://qc681nkfa.bkt.clouddn.com/%E8%B6%85%E7%87%83%EF%BC%81%E7%8E%8B%E5%98%89%E5%B0%94%E8%8E%B7%E8%A1%97%E8%88%9E.mp4?e=1592743758&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:vVaiiXkoYgKnOei5Tp2dvvC5VRI=', 7, 7, 2, '02:32', current_timestamp);

insert into mylook.video(name, video_cover, video_gif, video_url, hobby_id, user_id, state, time, create_time)
values('极度舒适的日式Hiphop律动', 'http://qc681nkfa.bkt.clouddn.com/%E6%9E%81%E5%BA%A6%E8%88%92%E9%80%82%E7%9A%84%E6%97%A5%E5%BC%8FHiphop%E5%BE%8B%E5%8A%A8%20.png?e=1592743820&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:TWrfb6WAlG_GTTjxw08ujpGYBZk=', 'http://qc681nkfa.bkt.clouddn.com/%E6%9E%81%E5%BA%A6%E8%88%92%E9%80%82%E7%9A%84%E6%97%A5%E5%BC%8FHiphop%E5%BE%8B%E5%8A%A8%20.gif?e=1592743827&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:E5k9_7WZ6mpCquYep5wK_ZAsMrY=', 'http://qc681nkfa.bkt.clouddn.com/%E6%9E%81%E5%BA%A6%E8%88%92%E9%80%82%E7%9A%84%E6%97%A5%E5%BC%8Fhiphop%E5%BE%8B%E5%8A%A8%20.mp4?e=1592743872&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:PhUq7yG92pEqOli7pVJt8rrfNlo=', 7, 7, 2, '02:30', current_timestamp);

insert into mylook.video(name, video_cover, video_gif, video_url, hobby_id, user_id, state, time, create_time)
values('LOVE ME LOVE ME', 'http://qc681nkfa.bkt.clouddn.com/LOVE%20ME%20LOVE%20ME%E3%80%8B.png?e=1592743985&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:xGtZgGkWolggi3tWNR1JZxw_uII=', 'http://qc681nkfa.bkt.clouddn.com/LOVE%20ME%20LOVE%20ME%E3%80%8B.gif?e=1592743990&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:e9S7mjcfR7Brt28zSUx-SgIYcLY=', 'http://qc681nkfa.bkt.clouddn.com/love%20me%20love%20me%E3%80%8B.mp4?e=1592744008&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:tIKvxYpyNWV-NYKRvJV6Z0yMdgs=', 7, 7, 2, '01:33', current_timestamp);

insert into mylook.video(name, video_cover, video_gif, video_url, hobby_id, user_id, state, time, create_time)
values('这段锁舞好看炸了', 'http://qc681nkfa.bkt.clouddn.com/%E8%BF%99%E6%AE%B5%E9%94%81%E8%88%9E%E5%A5%BD%E7%9C%8B%E7%82%B8%E4%BA%86a.png?e=1592744115&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:_oJAGnAAqOAdBNvbXtx0f16O3f0=', 'http://qc681nkfa.bkt.clouddn.com/%E8%BF%99%E6%AE%B5%E9%94%81%E8%88%9E%E5%A5%BD%E7%9C%8B%E7%82%B8%E4%BA%86a.gif?e=1592744121&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:y-ncuH8vM3p6F6NxuqkdF3k9MfA=', 'http://qc681nkfa.bkt.clouddn.com/%E8%BF%99%E6%AE%B5%E9%94%81%E8%88%9E%E5%A5%BD%E7%9C%8B%E7%82%B8%E4%BA%86a.mp4?e=1592744187&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:ueGPMo5-yaWcuyFr2KX5q5avttQ=', 7, 7, 2, '03:53', current_timestamp);


insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('如何优雅的编辑数学公式？', 'http://qc681nkfa.bkt.clouddn.com/%E5%A6%82%E4%BD%95%E4%BC%98%E9%9B%85%E7%9A%84%E7%BC%96%E8%BE%91%E6%95%B0%E5%AD%A6%E5%85%AC%E5%BC%8F%EF%BC%9F.png?e=1592744967&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:GSIinb5vLN1vF8016iNekj_2vTw=', 'http://qc681nkfa.bkt.clouddn.com/%E5%A6%82%E4%BD%95%E4%BC%98%E9%9B%85%E7%9A%84%E7%BC%96%E8%BE%91%E6%95%B0%E5%AD%A6%E5%85%AC%E5%BC%8F%EF%BC%9F%282%29.mp4?e=1592745035&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:Q8onlnOG8z0g_wV4bYjZcPh3bEI=', 6, 6, 2, '21:57', current_timestamp);


insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('毕业迷茫？难找工作？10位UP主为你解答——《10位UP主的人生答辩》', 'http://qc681nkfa.bkt.clouddn.com/%E6%AF%95%E4%B8%9A%E8%BF%B7%E8%8C%AB%EF%BC%9F.png?e=1592745131&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:9lhlFdj_gNdc5d1JduQYQM7kTyw=', 'http://qc681nkfa.bkt.clouddn.com/%E6%AF%95%E4%B8%9A%E8%BF%B7%E8%8C%AB%EF%BC%9F%282%29.mp4?e=1592745174&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:cjz2DnMqxvQsFaauzgyOFIFxtPI=', 6, 6, 2, '04:17', current_timestamp);


insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('【半佛】资本狂魔的魔幻人生', 'http://qc681nkfa.bkt.clouddn.com/%E3%80%90%E5%8D%8A%E4%BD%9B%E3%80%91%E8%B5%84%E6%9C%AC%E7%8B%82%E9%AD%94%E7%9A%84%E9%AD%94%E5%B9%BB%E4%BA%BA%E7%94%9F.png?e=1592745383&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:cS1XFF4ITTRTuEHtbJAvEZNhE88=', 'http://qc681nkfa.bkt.clouddn.com/%E3%80%90%E5%8D%8A%E4%BD%9B%E3%80%91%E8%B5%84%E6%9C%AC%E7%8B%82%E9%AD%94%E7%9A%84%E9%AD%94%E5%B9%BB%E4%BA%BA%E7%94%9F%282%29.mp4?e=1592745445&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:wZTnlYG05F4EQt7dnRk05iksPVE=', 6, 6, 2, '19:14', current_timestamp);


insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('我的钱竟然“越理越少”？！揭秘稳健理财亏损的真相！', 'http://qc681nkfa.bkt.clouddn.com/%E6%88%91%E7%9A%84%E9%92%B1%E7%AB%9F%E7%84%B6%E2%80%9C%E8%B6%8A%E7%90%86%E8%B6%8A%E5%B0%91%E2%80%9D.png?e=1592745492&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:SLMivy3Gz27x9gMY2bOqYj7lc3E=', 'http://qc681nkfa.bkt.clouddn.com/%E6%88%91%E7%9A%84%E9%92%B1%E7%AB%9F%E7%84%B6%E2%80%9C%E8%B6%8A%E7%90%86%E8%B6%8A%E5%B0%91%E2%80%9D%282%29.mp4?e=1592745524&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:GJK46vgC9Uov10tV3yRv_XAhafQ=', 6, 6, 2, '3:33', current_timestamp);


insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('听力口语别背单词别刷题，跟老马学30天一网打尽！', 'http://qc681nkfa.bkt.clouddn.com/%E5%90%AC%E5%8A%9B%E5%8F%A3%E8%AF%AD%E5%88%AB%E8%83%8C%E5%8D%95%E8%AF%8D%E5%88%AB%E5%88%B7%E9%A2%98.png?e=1592745603&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:f3wTh9x2zv7t8YRHhL-IVXspHMM=', 'http://qc681nkfa.bkt.clouddn.com/%E5%90%AC%E5%8A%9B%E5%8F%A3%E8%AF%AD%E5%88%AB%E8%83%8C%E5%8D%95%E8%AF%8D%E5%88%AB%E5%88%B7%E9%A2%98%282%29.mp4?e=1592745637&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:mMUwiw4etdG4uM7z_dS40rm685Y=', 6, 6, 2, '05:28', current_timestamp);


insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('揭美帝！战公知！你希望特朗普连任嘛？【膨胀说】', 'http://qc681nkfa.bkt.clouddn.com/%E6%8F%AD%E7%BE%8E%E5%B8%9D%EF%BC%81%E6%88%98%E5%85%AC%E7%9F%A5%EF%BC%81.png?e=1592745725&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:E3yUgnymmw4aO6TfDAsdOHxnQXw=', 'http://qc681nkfa.bkt.clouddn.com/%E6%8F%AD%E7%BE%8E%E5%B8%9D%EF%BC%81%E6%88%98%E5%85%AC%E7%9F%A5%EF%BC%81%282%29.mp4?e=1592745763&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:UE6huWVBXjv5yPyO9ec2-hhyf_g=', 6, 6, 2, '07:18', current_timestamp);

insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('B站最全学习通考试攻略-避雷区&注意事项', 'http://qc681nkfa.bkt.clouddn.com/B%E7%AB%99%E6%9C%80%E5%85%A8%E5%AD%A6%E4%B9%A0%E9%80%9A%E8%80%83%E8%AF%95%E6%94%BB%E7%95%A5-.png?e=1592745826&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:y6bDyLTR9i7rk-ummrx9xM6drTg=', 'http://qc681nkfa.bkt.clouddn.com/b%E7%AB%99%E6%9C%80%E5%85%A8%E5%AD%A6%E4%B9%A0%E9%80%9A%E8%80%83%E8%AF%95%E6%94%BB%E7%95%A5-%282%29.mp4?e=1592745834&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:-TZ1mXyz-ROoPD_DdtLT7V2Dcdk=', 6, 6, 2, '01:47', current_timestamp);

insert into mylook.video(name, video_cover, video_url, hobby_id, user_id, state, time, create_time)
values('带你学习黑人口语 有没有味你说的算', 'http://qc681nkfa.bkt.clouddn.com/%E5%B8%A6%E4%BD%A0%E5%AD%A6%E4%B9%A0%E9%BB%91%E4%BA%BA%E5%8F%A3%E8%AF%AD.png?e=1592745942&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:DQH6BVp8a5CGgyng8xHJtjLYf5Q=', 'http://qc681nkfa.bkt.clouddn.com/%E5%B8%A6%E4%BD%A0%E5%AD%A6%E4%B9%A0%E9%BB%91%E4%BA%BA%E5%8F%A3%E8%AF%AD%282%29.mp4?e=1592745956&token=y1X5Vv33kms6HY7oA8T6MDjfoMtcOSRX5h_d0Tp8:WRLqg32_2JitlU9tooa1lNucXwA=', 6, 6, 2, '00:51', current_timestamp);



