//
//  GetNounesView.h
//  PlanBDemo
//
//  Created by jia on 2018/5/26.
//  Copyright © 2018年 JiaJingWei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GetNounesVie : UIView

@end


@interface GetNounesView : UIView

+ (instancetype)displayViewWithSuccessHandler:(void (^)(GetNounesView *nounView))successHandler failureHandler:(void (^)(GetNounesView *nounView))failureHandler closeHandler:(void (^)(GetNounesView *nounView))closeHandler;

@end
