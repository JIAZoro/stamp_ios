//
//  PostMarkLayer.m
//  PlanBDemo
//
//  Created by jia on 2018/5/14.
//  Copyright © 2018年 JiaJingWei. All rights reserved.
//

#import "PostMarkLayer.h"

@implementation PostMarkLayer
- (void)drawInContext:(CGContextRef)ctx{
    CGContextSaveGState(ctx);
    
    //加邮戳
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"邮戳%d",arc4random()%2]];
    CGContextDrawImage(ctx, CGRectMake(arc4random()%175, arc4random()%175, 100, 100), image.CGImage);

    
    // 渲染
    CGContextStrokePath(ctx);
    CGContextRestoreGState(ctx);
}

@end
