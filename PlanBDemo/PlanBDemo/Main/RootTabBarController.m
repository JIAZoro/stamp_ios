//
//  RootTabBarController.m
//  PlanBDemo
//
//  Created by Norchant on 2018/4/28.
//  Copyright © 2018年 JiaJingWei. All rights reserved.
//

#import "RootTabBarController.h"
#import "HomeViewController.h"
#import "AboutMeViewController.h"
@interface RootTabBarController ()
@property (nonatomic) NSMutableArray *controllers;
@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self setTabBarItems];
}

- (void)setTabBarItems{
    NSArray *classArray = @[@"HomeViewController",@"AboutMeViewController"];
    NSArray *itemNormalIconArray = @[@"item_home_normal",@"item_me_normal"];
    NSArray *itemSelectedIconArray = @[@"item_home_selected",@"item_me_selected"];
    NSArray *itemNameArray = @[@"首页",@"我"];
    
    for (int i = 0; i < classArray.count; i++) {
        UIViewController *viewController = [[NSClassFromString(classArray[i]) alloc] init];
        
        UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:viewController];
        navigation.tabBarItem.title = itemNameArray[i];
        
        [navigation.tabBarItem setSelectedImage:[UIImage imageNamed:itemSelectedIconArray[i]]];
        [navigation.tabBarItem setImage:[UIImage imageNamed:itemNormalIconArray[i]]];
        
        [self.controllers addObject:navigation];
    }
    self.viewControllers = _controllers;
}

- (NSMutableArray *)controllers{
    if (!_controllers) {
        _controllers = [NSMutableArray array];
    }
    return _controllers;
}
@end
