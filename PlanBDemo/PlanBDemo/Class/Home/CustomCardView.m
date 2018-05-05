//
//  CustomCardView.m
//  PlanBDemo
//
//  Created by jia on 2018/4/30.
//  Copyright © 2018年 JiaJingWei. All rights reserved.
//

#import "CustomCardView.h"
@interface CustomCardView ()

@property (nonatomic) UIImageView *stampImageView;  //邮票图片
@property (nonatomic) UILabel *stampName;           //邮票名字
@property (nonatomic) UILabel *stampGrade;          //邮票等级
@property (nonatomic) UILabel *issueCount;          //发行总量
@property (nonatomic) UIImageView *stampBgView;         //邮票的背景图片

@end

@implementation CustomCardView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setCardUI];
        [self setUserInteractionEnabled:YES];
    }
    return self;
}
- (void)setCardUI{

    
    
    [self.stampBgView addSubview:self.stampImageView];
    
    [self addSubview:self.stampBgView];
    [self addSubview:self.stampName];
    [self addSubview:self.stampGrade];
//    [self addSubview:self.issueCount];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    typeof(self) weakself = self;
    [self.stampBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(weakself).mas_offset(0);
        make.height.mas_equalTo(weakself.stampBgView.mas_width);
    }];
    
    [self.stampImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakself.stampBgView).mas_offset(20);
        make.right.mas_equalTo(weakself.stampBgView).mas_offset(-20);
        make.top.mas_equalTo(weakself.stampBgView).mas_offset(20);
        make.bottom.mas_equalTo(weakself.stampBgView).mas_equalTo(-20);
    }];
    
    [self.stampName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakself.stampBgView.mas_bottom).mas_offset(10);
        make.left.mas_equalTo(weakself).mas_offset(10);
        make.right.mas_equalTo(weakself).mas_offset(-10);
        make.height.mas_equalTo(20);
    }];
    
    [self.stampGrade mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakself.stampName);
        make.top.mas_equalTo(weakself.stampName.mas_bottom).mas_offset(8);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(20);
    }];
    
//    [self.issueCount mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(weakself.stampGrade.mas_right).mas_offset(10);
//        make.top.mas_equalTo(weakself.stampGrade);
//        make.right.mas_equalTo(weakself).mas_offset(-10);
//        make.height.mas_equalTo(weakself.stampGrade);
//    }];
}

- (void)setStampInfo:(NSDictionary *)stampInfo{
    [_stampImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:stampInfo[@"img"]]]]];
    _stampName.text = stampInfo[@"name"];
    _stampGrade.text = stampInfo[@"grade"];
    _issueCount.text = stampInfo[@"count"];
}

- (UIImageView *)stampImageView{
    if (!_stampImageView) {
        _stampImageView = [[UIImageView alloc] init];
        _stampImageView.contentMode = UIViewContentModeScaleAspectFit;
        _stampImageView.backgroundColor = [UIColor purpleColor];
    }
    return _stampImageView;
}
- (UILabel *)stampName{
    if (!_stampName) {
        _stampName = [[UILabel alloc] init];
//        _stampName.backgroundColor = [UIColor redColor];
        [_stampName setFont:[UIFont boldSystemFontOfSize:17]];
        [_stampName setAdjustsFontSizeToFitWidth:YES];
    }
    return _stampName;
}
- (UILabel *)stampGrade{
    if (!_stampGrade) {
        _stampGrade = [[UILabel alloc] init];
//        _stampGrade.backgroundColor = [UIColor blueColor];
        [_stampGrade setAdjustsFontSizeToFitWidth:YES];
        [_stampGrade setFont:[UIFont systemFontOfSize:15]];
    }
    return _stampGrade;
}
- (UILabel *)issueCount{
    if (!_issueCount) {
        _issueCount = [[UILabel alloc] init];
//        _issueCount.backgroundColor = [UIColor yellowColor];
    }
    return _issueCount;
}

- (UIImageView *)stampBgView{
    if (!_stampBgView) {
        _stampBgView = [[UIImageView alloc] init];
        [_stampBgView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"stamp_bg_%d",arc4random()%5]]];
    }
    return _stampBgView;
}
@end
