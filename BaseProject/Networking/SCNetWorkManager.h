//
//  SCDownloadManager.h
//  BaseProject
//
//  Created by wonderC on 2017/2/10.
//  Copyright © 2017年 wonderC. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,SCNetworkRequestStatus) {
    SCNetworkRequestStatusError,
    SCNetworkRequestStatusSuccess,
    SCNetworkRequestStatusFailure
};

@interface SCNetWorkManager : NSObject

typedef void(^successBlock)(NSDictionary *dic);

typedef void(^failureBlock)(NSError *error);

typedef void(^progressBlock)(CGFloat progress);

/**
 Get请求

 @param url 地址
 @param dic 参数
 @param progressBlock 进度
 @param successBlock 成功回调
 @param failureBlock 失败回调
 */
+ (void)GetNetworkUrl:(NSString *)url
            parametes:(NSDictionary *)dic
             progress:(progressBlock)progressBlock
              success:(successBlock)successBlock
              failure:(failureBlock)failureBlock;
    
/**
 Post请求

 @param url 地址
 @param dic 参数
 @param progressBlock 进度
 @param successBlock 成功回调
 @param failureBlock 失败回调
 */
+ (void)PostNetworkUrl:(NSString *)url
             parametes:(NSDictionary *)dic
              progress:(progressBlock)progressBlock
               success:(successBlock)successBlock
               failure:(failureBlock)failureBlock;

/**
 上传图片

 @param url 地址
 @param dic 参数
 @param imageArray 图片数组
 @param fileNames  名称数组
 @param progressBlock 进度
 @param successBlock 成功回调
 @param failureBlock 失败回调
 */
+ (void)UploadImageWithUrl:(NSString *)url
                 parametes:(NSDictionary *)dic
                imageArray:(NSArray <UIImage *> *)imageArray
                 fileNames:(NSArray <NSString *> *)fileNames
                  progress:(progressBlock)progressBlock
                   success:(successBlock)successBlock
                   failure:(failureBlock)failureBlock;

/**
 上传文件

 @param url 地址
 @param dic 参数
 @param filedataArray 文件流数组
 @param fileNames 文件名称数组
 @param progressBlock 进度
 @param successBlock 成功回调
 @param failureBlock 失败回调
 */
+ (void)UploadNetworkUrl:(NSString *)url
               parametes:(NSDictionary *)dic
                fileData:(NSArray <NSData *> *)filedataArray
               fileNames:(NSArray <NSString *> *)fileNames
                progress:(progressBlock)progressBlock
                 success:(successBlock)successBlock
                 failure:(failureBlock)failureBlock;

/**
 视频上传

 @param operations   上传视频预留参数---视具体情况而定 可移除
 @param videoPath    上传视频的本地沙河路径
 @param url          上传的url
 @param progressBlock 进度
 @param successBlock 成功的回调
 @param failureBlock 失败的回调
 */
+(void)UploadVideoWithOperaitons:(NSDictionary *)operations
                       videoPath:(NSString *)videoPath
                             url:(NSString *)url
                        progress:(progressBlock)progressBlock
                         success:(successBlock)successBlock
                         failure:(failureBlock)failureBlock;
    
/**
 下载文件
 
 @param url 地址
 @param savePath 保存路径
 @param failureBlock 失败回调
 */
+ (void)DownloadNetworkUrl:(NSString *)url
                  savePath:(NSString *)savePath
                   failure:(failureBlock)failureBlock;
    
/**
 取消指定的请求

 @param requestType 请求类型
 @param url 请求地址
 */    
+ (void)CancelHttpRequestWithRequestType:(NSString *)requestType
                              requestUrl:(NSString *)url;

/**
 取消所有请求
 */
+ (void)CancelAllRequest;
    
@end
