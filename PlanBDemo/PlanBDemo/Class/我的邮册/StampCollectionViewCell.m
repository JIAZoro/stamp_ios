//
//  StampCollectionViewCell.m
//  PlanBDemo
//
//  Created by jia on 2018/5/7.
//  Copyright © 2018年 JiaJingWei. All rights reserved.
//

#import "StampCollectionViewCell.h"

@interface StampCollectionViewCell ()

@property (nonatomic) UIImageView *imageView;

@end

@implementation StampCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    [self addSubview:self.imageView];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
}
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        [_imageView setImage:[UIImage imageNamed:@"stamp_bg_0"]];
    }
    return _imageView;
}
@end
