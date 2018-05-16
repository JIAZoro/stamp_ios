//
//  RandomData.h
//  PlanBDemo
//
//  Created by jia on 2018/5/14.
//  Copyright © 2018年 JiaJingWei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RandomData : NSObject

+ (instancetype)sharemanager;

- (NSArray *)randomWithCount:(NSInteger)count;

@end
