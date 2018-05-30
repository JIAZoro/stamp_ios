//
//  GetNounesView.m
//  PlanBDemo
//
//  Created by jia on 2018/5/26.
//  Copyright © 2018年 JiaJingWei. All rights reserved.
//

#import "GetNounesView.h"

@interface GetNounesView ()

@property (nonatomic) UIView *mainView;

@end

@implementation GetNounesView


+ (instancetype)displayViewWithSuccessHandler:(void (^)(GetNounesView *nounView))successHandler failureHandler:(void (^)(GetNounesView *nounView))failureHandler closeHandler:(void (^)(GetNounesView *nounView))closeHandler{
    
    GetNounesView *view = [[GetNounesView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    return view;
    
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIView *bgView = [[UIView alloc] initWithFrame:self.bounds];
        bgView.backgroundColor = [UIColor grayColor];
        bgView.alpha = 0.6;
        [self addSubview:bgView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeWindow)];
        [bgView addGestureRecognizer:tap];
        
        
        [self setUI];
    }
    return self;
}
- (void)setUI{
    [self addSubview:self.mainView];

    CGFloat spaceWidth = 10;
    CGFloat btWidth = 55;
    CGFloat btHeight = 50;
    for (int i = 0; i < 3; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(10+i*(spaceWidth+btWidth), 10, btWidth, btHeight);
        [button setImage:[UIImage imageNamed:@"img_off_baoxaing7"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"img_on_baoxaing7"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(clickBox:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100+i;
        [self.mainView addSubview:button];
    }
    
    
    
    
    
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}
- (void)clickBox:(UIButton *)button{
    button.selected = !button.selected;
}
- (UIView *)mainView{
    if (!_mainView) {
        _mainView = [[UIView alloc] initWithFrame:CGRectMake(00, 0, self.frame.size.width*0.8, 300)];
        _mainView.center = self.center;
        _mainView.layer.borderWidth = 1.0;
        _mainView.layer.borderColor = [UIColor yellowColor].CGColor;
        _mainView.backgroundColor = [UIColor whiteColor];
        _mainView.layer.cornerRadius = 5;
        
    }
    return _mainView;
}

- (void)closeWindow{
    [self removeFromSuperview];
}

@end
