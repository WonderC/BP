//
//  SCDownloadManager.m
//  BaseProject
//
//  Created by wonderC on 2017/2/10.
//  Copyright © 2017年 wonderC. All rights reserved.
//

#import "SCNetWorkManager.h"
#import <AVFoundation/AVFoundation.h>

@interface SCNetWorkManager()
@property (nonatomic,strong) AFHTTPSessionManager *shareManager;
@end

@implementation SCNetWorkManager

- (AFHTTPSessionManager *)shareManager{
    if (!_shareManager) {
        _shareManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:SCBaseURL]];
        _shareManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [_shareManager.requestSerializer setValue:@"headerValue" forHTTPHeaderField:@"HeaderInfo"];
        _shareManager.requestSerializer.timeoutInterval = 10.f;
        [_shareManager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json",@"text/javascript",@"text/html",@"text/css", nil]];
    }
    return _shareManager;
}

+(SCNetWorkManager *)shareSCNetWorkManager{
    
    static SCNetWorkManager *shareManager= nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[self alloc] init];
    });
    return shareManager;
}

+ (void)GetNetworkUrl:(NSString *)url
            parametes:(NSDictionary *)dic
             progress:(progressBlock)progressBlock
              success:(successBlock)successBlock
              failure:(failureBlock)failureBlock
{
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:{
            case AFNetworkReachabilityStatusNotReachable:
                //
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi:{
            case AFNetworkReachabilityStatusReachableViaWWAN:
                
                [[SCNetWorkManager shareSCNetWorkManager].shareManager GET:url parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
                    
                    progressBlock(downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
                } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                    NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
                    successBlock(responseDic);
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    
                    SCLog(@"%@",error.userInfo);
                    failureBlock(error);
                }];
                break;
            }
        }
    }];
    
}

+ (void)PostNetworkUrl:(NSString *)url
             parametes:(NSDictionary *)dic
              progress:(progressBlock)progressBlock
               success:(successBlock)successBlock
               failure:(failureBlock)failureBlock
{
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:{
                case AFNetworkReachabilityStatusNotReachable:
                //
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi:{
                case AFNetworkReachabilityStatusReachableViaWWAN:
                
                [[SCNetWorkManager shareSCNetWorkManager].shareManager POST:url parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
                    
                    progressBlock(uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
                } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    
                    NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
                    successBlock(responseDic);
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                    SCLog(@"%@",error.userInfo);
                    failureBlock(error);
                }];
                break;
            }
        }
    }];
}

+ (void)UploadImageWithUrl:(NSString *)url
                 parametes:(NSDictionary *)dic
                imageArray:(NSArray<UIImage *> *)imageArray
                 fileNames:(NSArray<NSString *> *)fileNames
                  progress:(progressBlock)progressBlock
                   success:(successBlock)successBlock
                   failure:(failureBlock)failureBlock
{

        NSMutableArray *array = [NSMutableArray array];
        for (NSInteger i = 0; i<imageArray.count; i++) {
            NSData * imgData = UIImageJPEGRepresentation([YYImage imageWithData:UIImagePNGRepresentation(imageArray[i]) scale:.5], 1);
            [array addObject:imgData];
            
        }    

    [self UploadNetworkUrl:url parametes:dic fileData:array fileNames:fileNames progress:progressBlock success:successBlock failure:failureBlock];
}

+ (void)UploadNetworkUrl:(NSString *)url
               parametes:(NSDictionary *)dic
                fileData:(NSArray<NSData *> *)filedataArray
               fileNames:(NSArray<NSString *> *)fileNames
                progress:(progressBlock)progressBlock
                 success:(successBlock)successBlock
                 failure:(failureBlock)failureBlock
{
    
    [[SCNetWorkManager shareSCNetWorkManager].shareManager POST:url parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {

        for (NSInteger i = 0; i < filedataArray.count; i++) {
            [formData appendPartWithFileData:filedataArray[i] name:@"upload" fileName:fileNames[i] mimeType:@""];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        progressBlock(uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        successBlock(responseDic);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        SCLog(@"%@",error.userInfo);
        failureBlock(error);

    }];
}

+ (void)UploadVideoWithOperaitons:(NSDictionary *)operations
                        videoPath:(NSString *)videoPath
                              url:(NSString *)url
                         progress:(progressBlock)progressBlock
                          success:(successBlock)successBlock
                          failure:(failureBlock)failureBlock
{
    /**获得视频资源*/
    AVURLAsset * avAsset = [AVURLAsset assetWithURL:[NSURL URLWithString:videoPath]];
    /**压缩*/
    AVAssetExportSession  *  avAssetExport = [[AVAssetExportSession alloc] initWithAsset:avAsset presetName:AVAssetExportPreset640x480];
    /**创建日期格式化器*/
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
    
    /**转化后直接写入Library---caches*/
    NSString *  videoWritePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingString:[NSString stringWithFormat:@"/output-%@.mp4",[formatter stringFromDate:[NSDate date]]]];
    
    avAssetExport.outputURL = [NSURL URLWithString:videoWritePath];
    avAssetExport.outputFileType =  AVFileTypeMPEG4;
    
    [avAssetExport exportAsynchronouslyWithCompletionHandler:^{
        switch ([avAssetExport status]) {
            case AVAssetExportSessionStatusCompleted:{

                [[SCNetWorkManager shareSCNetWorkManager].shareManager POST:url parameters:operations progress:^(NSProgress * _Nonnull uploadProgress) {
                    progressBlock(uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
                } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    successBlock(responseObject);
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    failureBlock(error);
                }];
                break;
            }
            
            default:
            break;
        }
    }];


}
    
+ (void)DownloadNetworkUrl:(NSString *)url
                  savePath:(NSString *)savePath
                   failure:(void(^)(NSError *error))failureBlock
{
    
    [[SCNetWorkManager shareSCNetWorkManager].shareManager downloadTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        return  [NSURL URLWithString:savePath];
        
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        
        if (error) {
            failureBlock(error);
        }
    }];
    
}
    
+ (void)CancelHttpRequestWithRequestType:(NSString *)requestType
                              requestUrl:(NSString *)url
{
    NSError * error;
    
    NSString * urlToPeCanced = [[[[SCNetWorkManager shareSCNetWorkManager].shareManager.requestSerializer requestWithMethod:requestType URLString:url parameters:nil error:&error] URL] path];
    //遍历
    for (NSOperation * operation in [SCNetWorkManager shareSCNetWorkManager].shareManager.operationQueue.operations) {
        //如果是请求队列
        if ([operation isKindOfClass:[NSURLSessionTask class]]) {
            
            BOOL hasMatchRequestType = [requestType isEqualToString:[[(NSURLSessionTask *)operation currentRequest] HTTPMethod]];
            BOOL hasMatchRequestUrlString = [urlToPeCanced isEqualToString:[[[(NSURLSessionTask *)operation currentRequest] URL] path]];
            if (hasMatchRequestType&&hasMatchRequestUrlString) {
                
                [operation cancel];
                
            }
        }
    }
}

+ (void)CancelAllRequest{
    
    [[SCNetWorkManager shareSCNetWorkManager].shareManager.operationQueue cancelAllOperations];
}
    
@end
