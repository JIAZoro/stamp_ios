//
//  HttpRequestTools.m
//  GenSoundProject
//
//  Created by Norchant on 2018/5/2.
//  Copyright © 2018年 Gensound. All rights reserved.
//

#import "HttpRequestTools.h"
#import "AFNetworking.h"

@interface HttpRequestTools ()
@property AFHTTPSessionManager *sessionManager;
@end

@implementation HttpRequestTools

+ (instancetype)shareInstance{
    static HttpRequestTools *httptools;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        httptools = [[HttpRequestTools alloc] init];
    });
    return httptools;
}
- (id)init{
    self = [super init];
    
    _sessionManager = [AFHTTPSessionManager manager];
    _sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];   //设置post的数据格式，此处为JSON格式
    
    _sessionManager.requestSerializer.timeoutInterval = 10.0;
    _sessionManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone]; //HTTPS签名
    
    [_sessionManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    [_sessionManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    return self;
}
- (void)managerType:(NetWorkRequestType)type URL:(NSString *)urlString parameters:(id)paramaters progress:(LoadingProgress)progress success:(HttpSuccess)success failure:(HttpFailure)failure{
    
    NSString* encodedString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    _sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    if (type == NetWorkRequestTypeGET) {
        [_sessionManager GET:encodedString parameters:paramaters progress:^(NSProgress * _Nonnull downloadProgress) {
            progress(downloadProgress);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }else{
        [_sessionManager POST:encodedString parameters:paramaters progress:^(NSProgress * _Nonnull uploadProgress) {
            progress(uploadProgress);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }
}
@end
