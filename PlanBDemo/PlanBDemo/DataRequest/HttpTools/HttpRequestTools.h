//
//  HttpRequestTools.h
//  GenSoundProject
//
//  Created by Norchant on 2018/5/2.
//  Copyright © 2018年 Gensound. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,NetWorkRequestType) {
    NetWorkRequestTypeGET,          //GET请求
    NetWorkRequestTypePOST,         //POST请求
};

//成功回调
typedef void(^HttpSuccess)(id data);

//失败回调
typedef void(^HttpFailure)(NSError *error);

//请求过程
typedef void(^LoadingProgress)(NSProgress *progress);

@interface HttpRequestTools : NSObject

@property (nonatomic,copy) HttpSuccess success;
@property (nonatomic,copy) HttpFailure failure;
@property (nonatomic,copy) LoadingProgress progress;

+ (instancetype)shareInstance;

- (void)managerType:(NetWorkRequestType)type URL:(NSString *)urlString parameters:(id)paramaters progress:(LoadingProgress)progress success:(HttpSuccess)success failure:(HttpFailure)failure;


@end
