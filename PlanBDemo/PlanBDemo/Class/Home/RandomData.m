//
//  RandomData.m
//  PlanBDemo
//  随机数据
//  Created by jia on 2018/5/14.
//  Copyright © 2018年 JiaJingWei. All rights reserved.
//

#import "RandomData.h"
#import "StainLayer.h"

@implementation RandomData
+ (instancetype)sharemanager{
    static RandomData *random;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        random = [[RandomData alloc] init];
    });
    return random;
}

- (NSArray *)randomWithCount:(NSInteger)count{
    NSMutableArray *mutArray = [NSMutableArray array];
    
    for (int i = 0; i < count; i++) {
        NSMutableDictionary *infoDic = [NSMutableDictionary dictionary];
        NSInteger rank = random()%1000;
        
        if (rank >= 0 && rank <= 599) {
            [infoDic setObject:@"4" forKey:@"rank"];
            [infoDic setObject:@[@1,@2,@3,@0] forKey:@"mask"];
        }else if (rank > 599 && rank <= 839){
            [infoDic setObject:@"3" forKey:@"rank"];
            [infoDic setObject:[self randomwaysCount:3] forKey:@"mask"];
        }else if (rank > 839 && rank <= 939){
            [infoDic setObject:@"2" forKey:@"rank"];
            [infoDic setObject:[self randomwaysCount:2] forKey:@"mask"];

        }else if (rank > 939 && rank <= 998){
            [infoDic setObject:@"1" forKey:@"rank"];
            [infoDic setObject:[self randomwaysCount:1] forKey:@"mask"];
        }else{
            [infoDic setObject:@"0" forKey:@"rank"];
            [infoDic setObject:@[] forKey:@"mask"];
        }
        [mutArray addObject:infoDic];
    }
    [self randomwaysCount:3];
    return [NSArray arrayWithArray:mutArray];
}

- (NSArray *)randomwaysCount:(NSInteger)count{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        NSInteger value = random()%4;
        if ([array containsObject:@(value)]) {
            i--;
            
        }else{
            [array addObject:@(value)];
            
        }
    }
    return [NSArray arrayWithArray:array];
    
    
}


@end
