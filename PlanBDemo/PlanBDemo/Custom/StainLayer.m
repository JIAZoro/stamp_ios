//
//  StainLayer.m
//  PlanBDemo
//
//  Created by jia on 2018/5/9.
//  Copyright © 2018年 JiaJingWei. All rights reserved.
//

#import "StainLayer.h"


@implementation StainLayer

- (void)drawInContext:(CGContextRef)ctx{
    CGContextSaveGState(ctx);
//
//    CGContextScaleCTM(ctx, 1, -1);
//    CGContextTranslateCTM(ctx, 0, -100);
    //加圆形墨迹
    CGContextAddArc(ctx, arc4random()%270, arc4random()%270, 10, 10, -3.1415926, 1);

    CGContextFillPath(ctx);


//    //加邮戳
//    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"邮戳%d",arc4random()%2]];
//    CGContextDrawImage(ctx, CGRectMake(arc4random()%175, arc4random()%175, 100, 100), image.CGImage);
////
//    CGContextMoveToPoint(ctx, arc4random()%275, arc4random()%275);
//    CGContextAddLineToPoint(ctx, arc4random()%275, arc4random()%275);
//
//    // 设置第一条线的状态
//    CGContextSetLineWidth(ctx, 1);
//    CGContextSetLineCap(ctx, kCGLineCapRound);
//    [[UIColor whiteColor] set];

    // 渲染
    CGContextStrokePath(ctx);
    
    
    
    CGContextRestoreGState(ctx);
}

@end
