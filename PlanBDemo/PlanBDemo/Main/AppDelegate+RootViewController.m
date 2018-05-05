//
//  AppDelegate+RootViewController.m
//  PlanBDemo
//
//  Created by Norchant on 2018/4/28.
//  Copyright © 2018年 JiaJingWei. All rights reserved.
//

#import "AppDelegate+RootViewController.h"
#import "RootTabBarController.h"

@implementation AppDelegate (RootViewController)
- (void)setRootViewController{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    RootTabBarController *rootVC = [[RootTabBarController alloc] init];
    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];
}
@end
