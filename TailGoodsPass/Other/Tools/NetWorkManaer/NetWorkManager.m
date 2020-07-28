//
//  NetWorkManager.m
//  TextDemo
//
//  Created by 同城天下 on 2017/4/17.
//  Copyright © 2017年 杨旭. All rights reserved.
//

#import "NetWorkManager.h"
#import "DESEncrypt.h"
#import "MBProgressHUD+Add.h"


@implementation NetWorkManager

+ (NetWorkManager *)shareManager {
    static NetWorkManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[NetWorkManager alloc] init];
    });
    return manager;
}

/**
 *  GET 网络请求
 *
 *  @param url     请求的网址
 *  @param dic     请求需要的参数
 *  @param success 请求成功的回调
 *  @param conError   请求失败的回调
 */
+ (void)requestForGETWithUrl:(NSString *)url parameter:(NSDictionary *)dic success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))conError {
    
    //创建一个网络请求管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //设置可接受的数据类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
    
    //开始网络请求
    [manager GET:[NSString stringWithFormat:@"%@%@", kServiceURL, url] parameters:dic headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
       
        //请求数据的进度
        NSLog(@"%f", downloadProgress.fractionCompleted);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //请求数据成功  回调数据
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //请求数据失败, 回调错误原因
        conError(error);
        
    }];
    
    
}

/**
 *  POST 网络请求
 *
 *  @param url     请求的网址
 *  @param dic     请求需要的参数
 *  @param success 请求成功的回调
 *  @param conError   请求失败的回调
 */
+ (void)requestForPOSTWithUrl:(NSString *)url parameter:(NSDictionary *)dic success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))conError {
    
    //创建一个网络请求管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //设置可接受的数据类型
    manager.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"text/html",@"application/json",@"text/plain",@"charset=utf-8", @"application/x-javascript", nil];
    //    [manager.requestSerializer setValue:@"application/json;text/plain;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    //post请求头 的设置
//    [manager.requestSerializer setValue:@"text/plain" forHTTPHeaderField:@"Content-Type"];
    [manager POST:[NSString stringWithFormat:@"%@%@", kServiceURL, url] parameters:dic headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        //上传数据的进度
//        NSLog(@"%f", uploadProgress.fractionCompleted);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //请求数据成功   responseObject 关键!!请求得到的数据
        //将请求成功返回的结果回调回去
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //回调请求失败的错误信息
        conError(error);
    }];

    
    
}




/**
 上传图片
 
 @param url        请求上传的地址
 @param dic        参数
 @param imageArray 图片数组
 @param success    成功回调
 @param conError   失败回调
 */
+ (void)uploadImagesPOSTWithUrl:(NSString *)url parameter:(NSDictionary *)dic images:(NSArray *)imageArray success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))conError {
    
    
    //向服务器提交图片
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //显示进度
    [manager POST:url parameters:dic headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
       
        //上传多张照片
        for (NSInteger i = 0; i < imageArray.count; i++) {
            
            NSData *imageData = UIImagePNGRepresentation([imageArray objectAtIndex:i]);
            //根据当前时间设置上传的名字
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            //设置日期格式
            formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
            //上传的参数名
            NSString *name = [NSString stringWithFormat:@"%@%zi", [NSDate date], i+1];
            //上传文件名字fileName
            NSString *fileName = [NSString stringWithFormat:@"%@.jpg", name];
            [formData appendPartWithFileData:imageData name:name fileName:fileName mimeType:@"image/jepg"];
        }
        
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"完成 %@", result);
        
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"错误 %@", error.localizedDescription);
        if (conError) {
            conError(error);
        }
    
    }];
    
    
}

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
+ (void)uploadVideoWithUrlString:(NSString *)url parameter:(NSDictionary *)parameters fileData:(NSData *)fileData name:(NSString *)name fileName:(NSString *)fileName progress:(void(^)(NSProgress *progress))progress success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure {
    
    
    //1.获取单利的网络管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //设置相应数据支持的类型
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript",@"application/json", @"application/x-www-form-urlencoded", nil]];
    
    [manager POST:url parameters:parameters headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:fileData name:name fileName:fileName mimeType:@"video/quicktime"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failure) {
            failure(error);
        }
        
    }];
    
}

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
//+ (void)POSTWithUrl:(NSString *)url images:(NSArray *)imagesArray imageParameters:(NSArray *)imageParameters parameters:(id)parameters progress:(void(^)(NSProgress *uploadProgress))progress success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure {
//    
//    
//    NSDate *nowDate = [NSDate date];
//    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
//    [inputFormatter setDateFormat:@"yyyyMMddHHmmss"];
//    NSString *imageName = [inputFormatter stringFromDate:nowDate];
//    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        for (int i = 0; i < imagesArray.count; i++) {
//            UIImage *image = imagesArray[i];
//            NSData *data = UIImageJPEGRepresentation(image, 0.5);
//            
//            NSString *parmeter;
//            if (imageParameters.count == 0) {
//                
//            }else if (imageParameters.count <= i) {
//                parmeter = [imageParameters lastObject];
//            }else {
//                parmeter = imageParameters[i];
//            }
//            
//            [formData appendPartWithFileData:data name:parmeter fileName:[NSString stringWithFormat:@"%@%d.jpeg",imageName,i] mimeType:@"jpeg"];
//            
//        }
//        
//    } progress:^(NSProgress * _Nonnull uploadProgress) {
//        
//        if (progress) {
//            progress(uploadProgress);
//        }
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if (success) {
//            
//            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
//            success(dict);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
//
//    
//    
//    
//}



/**
 * 检查手机网络
 *   0    手机 没有网络
 *  -1    不识别的网络
 *   1    有线网络
 *   2    无线WiFi网络
 */
- (void)judgeNetConnectWithBlock:(void(^)())block {
    
    AFNetworkReachabilityManager *netManager = [AFNetworkReachabilityManager sharedManager];
    
    //首先必须开启  关键⚠️  开启监听
    [netManager startMonitoring];
    
    [netManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        /**
         AFNetworkReachabilityStatusUnknown          = -1,
         AFNetworkReachabilityStatusNotReachable     = 0,
         AFNetworkReachabilityStatusReachableViaWWAN = 1,
         AFNetworkReachabilityStatusReachableViaWiFi = 2,
         */
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
            {
                NSLog(@"未知错误");
                block();
            }
                break;
            case AFNetworkReachabilityStatusNotReachable:
            {
                NSLog(@"当前无网");
                TTAlertNoTitle(@"请检查您的手机网络！");
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                NSLog(@"当前2G/3G/4G");
                block();
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                NSLog(@"当前Wifi");
                
                block();
            }
                break;
                
            default:
                break;
        }
    }];

}

//讲数组转化成字符串
+ (NSString *)arrayToString:(NSArray *)arr {
    
    NSMutableString *string = [NSMutableString stringWithFormat:@"["];
    for (id obj in arr) {
        if ([obj isKindOfClass:[NSDictionary class]]) {
            [string appendString:[NetWorkManager dicToString:obj]];
        } else if ([obj isKindOfClass:[NSString class]]) {
            [string appendString:[NSString stringWithFormat:@"\"%@\"", obj]];
        } else if ([obj isKindOfClass:[NSArray class]]) {
            [string appendString:[NetWorkManager arrayToString:obj]];
        } else {
            [string appendString:[NSString stringWithFormat:@"%@", obj]];
        }
        if (!([arr indexOfObject:obj] >= arr.count)) {
            [string appendString:@","];
        }
    }
    [string appendString:@"]"];
    
    return string;
}
//字典转字符串
+ (NSString *)dicToString:(NSDictionary *)dic{
    NSMutableString *string = [NSMutableString stringWithFormat:@"{"];
    for (NSString *keyStr in dic.allKeys) {
        [string appendString:[NSString stringWithFormat:@"\"%@\":",keyStr]];
        if ([[dic valueForKey:keyStr] isKindOfClass:[NSArray class]]) {
            [string appendString:[NetWorkManager arrayToString:[dic valueForKey:keyStr]]];
        }else if ([[dic valueForKey:keyStr] isKindOfClass:[NSDictionary class]]) {
            [string appendString:[NetWorkManager dicToString:[dic valueForKey:keyStr]]];
        }else if ([[dic valueForKey:keyStr] isKindOfClass:[NSString class]]) {
            [string appendString:[NSString stringWithFormat:@"\"%@\"",[dic valueForKey:keyStr]]];
        }else{
            [string appendString:[NSString stringWithFormat:@"%@",[dic valueForKey:keyStr]]];
        }
        if ([dic.allKeys indexOfObject:keyStr] < dic.allKeys.count - 1) {
            [string appendString:@","];
        }
    }
    [string appendString:@"}"];
    
    return string;
}

//session  连接  加密
+ (void)connentionRequestForPOSTWithUrl:(NSString *)url parameter:(NSDictionary *)dic success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))conError {
    
    AFNetworkReachabilityManager *netManager = [AFNetworkReachabilityManager sharedManager];
    [netManager startMonitoring];
    if (netManager.networkReachabilityStatus != 0) {
        
        [self realRequestDataActionForPOSTWithUrl:url parameter:dic success:^(id responseObject) {
           
            success(responseObject);
            
        } failure:^(NSError *error) {
            
            conError(error);
            
        }];
    } else {
        //服务器连接异常
        NSError *error;
        conError(error);
        
    }
}


static AFHTTPSessionManager *manager;
+ (AFHTTPSessionManager *)sharedHTTPSession {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.requestSerializer.timeoutInterval = 30.0f;
    });
    return manager;
    
}
/**
 * 真正的数据请求
 */
+ (void)realRequestDataActionForPOSTWithUrl:(NSString *)url
                                  parameter:(NSDictionary *)dic
                                    success:(void(^)(id responseObject))success
                                    failure:(void(^)(NSError *error))conError{
    
    @synchronized (self) {
        
        AFHTTPSessionManager *manager = [self sharedHTTPSession];
        //设置可接受的数据类型
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/html",@"application/json",@"text/plain",@"charset=ISO-8859-1",@"text/html",@"charset=utf-8", nil];
    
        [manager POST:[NSString stringWithFormat:@"%@%@", kServiceURL, url] parameters:dic headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
           
            //上传数据的进度
            NSLog(@"%f", uploadProgress.fractionCompleted);
            
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            

            success(responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            
            conError(error);
            
        }];
        
    }
    
    
}

@end
