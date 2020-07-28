//
//  BX_NetWorkManager.h
//  TextDemo
//
//  Created by 同城天下 on 2017/4/17.
//  Copyright © 2017年 Baoxun Yuan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AFNetworking.h>

@interface BX_NetWorkManager : NSObject

//单利创建对象
+ (BX_NetWorkManager *)shareManager;

/**
 *  GET 网络请求
 *
 *  @param url     请求的网址
 *  @param dic     请求需要的参数
 *  @param success 请求成功的回调
 *  @param conError   请求失败的回调
 */
+ (void)requestForGETWithUrl:(NSString *)url parameter:(NSDictionary *)dic success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))conError;

/**
 *  POST 网络请求
 *
 *  @param url     请求的网址
 *  @param dic     请求需要的参数
 *  @param success 请求成功的回调
 *  @param conError   请求失败的回调
 */
+ (void)requestForPOSTWithUrl:(NSString *)url parameter:(NSDictionary *)dic success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))conError;




/**
 上传图片
 
 @param url        请求上传的地址
 @param dic        参数
 @param imageArray 图片数组
 @param success    成功回调
 @param conError   失败回调
 */
+ (void)uploadImagesPOSTWithUrl:(NSString *)url parameter:(NSDictionary *)dic images:(NSArray *)imageArray success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))conError;

/*
 上传视频
 @param url 服务器地址
 @param parameters 字典 token
 @param fileData 要上传的数据
 @param name 服务器参数名称 后台给你
 @param fileName 文件名称 图片:xxx.jpg,xxx.png 视频:video.mov
 视频:video/quicktime
 @param progress
 @param success
 @param failure
 */
+ (void)uploadVideoWithUrlString:(NSString *)url parameter:(NSDictionary *)parameters fileData:(NSData *)fileData name:(NSString *)name fileName:(NSString *)fileName progress:(void(^)(NSProgress *progress))progress success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;

/**
 *  POST 请求   上传照片
 *
 *  @param url       URL
 *  @param imagesArray           存要传的照片
 *  @param imageParameters   与图片对应得参数
 *  @param parameters       常规参数
 *  @param progress         进程
 *  @param success          成功时回调
 *  @param failure          失败时回调
 */
//+ (void)POSTWithUrl:(NSString *)url images:(NSArray *)imagesArray imageParameters:(NSArray *)imageParameters parameters:(id)parameters progress:(void(^)(NSProgress *uploadProgress))progress success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;

//session  连接  加密
+ (void)connentionRequestForPOSTWithUrl:(NSString *)url parameter:(NSDictionary *)dic success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))conError;

/**
 * 检查手机网络
 *   0    手机 没有网络
 *  -1    不识别的网络
 *   1    有线网络
 *   2    无线WiFi网络
 */
- (void)judgeNetConnectWithBlock:(void(^)())block;


@end
