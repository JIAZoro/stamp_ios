//
//  ImageFix.h
//  PlanBDemo
//
//  Created by jia on 2018/5/17.
//  Copyright © 2018年 JiaJingWei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageFix : NSObject

+ (UIImage *)shotWithView:(UIView *)view scope:(CGRect)scope;
+ (UIImage *)colorControlsWithOriginalImage:(UIImage *)image saturation:(CGFloat)saturation brightness:(CGFloat)brightness contrast:(CGFloat)contrast;

@end
