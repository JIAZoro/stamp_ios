//
//  LineLayer.m
//  PlanBDemo
//
//  Created by jia on 2018/5/14.
//  Copyright © 2018年 JiaJingWei. All rights reserved.
//

#import "LineLayer.h"

@implementation LineLayer
- (void)drawInContext:(CGContextRef)ctx{
    CGContextSaveGState(ctx);
    
    CGContextMoveToPoint(ctx, arc4random()%275, arc4random()%275);
    CGContextAddLineToPoint(ctx, arc4random()%275, arc4random()%275);
    
    // 设置第一条线的状态
    CGContextSetLineWidth(ctx, 1);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    [[UIColor redColor] set];
    
    // 渲染
    CGContextStrokePath(ctx);
    
    
    
    CGContextRestoreGState(ctx);
}
@end
