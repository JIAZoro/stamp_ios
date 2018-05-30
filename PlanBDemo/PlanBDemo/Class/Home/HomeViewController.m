//
//  HomeViewController.m
//  PlanBDemo
//
//  Created by Norchant on 2018/4/28.
//  Copyright © 2018年 JiaJingWei. All rights reserved.
//

#import "HomeViewController.h"
#import "CardView.h"
#import "CustomCardView.h"
#import <Masonry.h>
#import <UICountingLabel.h>
#import "RandomData.h"
#import "ImageFix.h"
#import "ShowImageViewController.h"

#import "GetNounesView.h"

@interface HomeViewController () <CardViewDelegate,CardViewDataSource>

@property (weak, nonatomic) IBOutlet CardView *cardView;

@property (nonatomic) NSMutableArray *dataArray;
@property (nonatomic) NSMutableArray *array;
@property (nonatomic) UICountingLabel *goldLabel;   //个人金币数字

@property (nonatomic) UIView *titleBaseView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;   //隐藏导航栏
    
    [self.view addSubview:self.titleBaseView];
    
    typeof(self) weakself = self;
    [self.titleBaseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.view).mas_offset(40);
        make.size.mas_equalTo(CGSizeMake(200, 44));
        make.centerX.equalTo(weakself.view);
    }];
    

    
    
    self.dataArray = [NSMutableArray new];
    self.array = [NSMutableArray new];
    for (int i=0; i<10; i++) {
        [self.array addObject:@(i)];
    }
    
    [self.dataArray addObjectsFromArray:[[RandomData sharemanager] randomWithCount:5]];
    
    [self setCardView];
    
    [self.cardView reloadData];
}
- (IBAction)getNoun:(id)sender {
    [GetNounesView displayViewWithSuccessHandler:^(GetNounesView *nounView) {
        
    } failureHandler:^(GetNounesView *nounView) {
        
    } closeHandler:^(GetNounesView *nounView) {
        
    }];
    
}

- (void)viewWillLayoutSubviews{
//    typeof(self) weakself = self;
//
//    [self.cardView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(weakself.titleBaseView.mas_bottom).mas_offset(20);
//        make.left.mas_equalTo(weakself.view).mas_offset(30);
//        make.right.mas_equalTo(weakself.view).mas_offset(-30);
//        make.height.mas_equalTo(300);
//    }];
}
- (IBAction)undo:(id)sender {
}
- (IBAction)unlike:(id)sender {
    [self.cardView deleteTheTopItemViewWithLeft:YES];
}
- (IBAction)like:(id)sender {
    [self.cardView deleteTheTopItemViewWithLeft:NO];
}
- (IBAction)save:(id)sender {
    UIImage *image = [ImageFix shotWithView:self.view scope:CGRectMake(_cardView.frame.origin.x, _cardView.frame.origin.y, _cardView.frame.size.width, _cardView.frame.size.width)];
    ShowImageViewController *vc = [[ShowImageViewController alloc] init];
    vc.image = image;
    
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)cardViewNeedMoreData:(CardView *)cardView {
    NSLog(@"需要新数据");
    [self performSelector:@selector(moreData) withObject:nil afterDelay:0];
}

- (void)moreData {
    NSArray *array = [[RandomData sharemanager] randomWithCount:1000];
//    NSLog(@"%@",array);
    
    [self.dataArray addObjectsFromArray:array];
    [self.cardView reloadData];
}

- (CardItemView *)cardView:(CardView *)cardView itemViewAtIndex:(NSInteger)index {
    static NSString *reuseIdentitfier = @"card";
    CustomCardView *itemView = (CustomCardView *)[cardView dequeueReusableCellWithIdentifier:reuseIdentitfier];
    
    if (itemView == nil) {
        itemView = [[CustomCardView alloc] initWithReuseIdentifier:reuseIdentitfier];
    }
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"https://",@"img",@"特别纪念邮票(2008)",@"name",@"103/200(张)",@"grade",@"发行量：50W",@"count", nil];
    itemView.stampInfo = self.dataArray[index];
    
    typeof(self) weakself = self;
    itemView.removeItemBlock = ^(BOOL isLeft) {
        NSLog(@"%@",isLeft ? @"NO" : @"LIKE");
        CGFloat count = [[NSUSERDEFAULT objectForKey:@"gold"] floatValue] + 10;
        [NSUSERDEFAULT setValue:[NSString stringWithFormat:@"%lf",count] forKey:@"gold"];
        
        [weakself setGoldCountWithLeft:isLeft];

    };
    
    return itemView;
}
- (void)setGoldCountWithLeft:(BOOL)isleft{
    CGFloat goldNum = [self.goldLabel currentValue];
    [self.goldLabel countFrom:goldNum to:[[NSUSERDEFAULT objectForKey:@"gold"] floatValue]];
}
- (NSInteger)numberOfItemViewsInCardView:(CardView *)cardView {
    return self.dataArray.count;
}

- (void)cardView:(CardView *)cardView didClickItemAtIndex:(NSInteger)index{
    NSLog(@"点击了第%ld个View",index);
}


#pragma mark --Lazy
- (UICountingLabel *)goldLabel{
    if (!_goldLabel) {
        _goldLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(0, 20, 100, 30)];
        
        [_goldLabel setFont:[UIFont boldSystemFontOfSize:34]];
        [_goldLabel setAdjustsFontSizeToFitWidth:YES];
        _goldLabel.backgroundColor = [UIColor clearColor];
        _goldLabel.format = @"%.2f";
        _goldLabel.textAlignment = NSTextAlignmentLeft;
        _goldLabel.animationDuration = 1.0f;
        [_goldLabel countFromZeroTo:[[NSUSERDEFAULT objectForKey:@"gold"] floatValue]];
    }
    return _goldLabel;
}

- (void)setCardView{
    _cardView.delegate = self;
    _cardView.dataSource = self;
}
- (UIView *)titleBaseView{
    if (!_titleBaseView) {
        _titleBaseView = [[UIView alloc] init];
        
        UIImageView *goldImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"金币.png"]];
        goldImgView.frame = CGRectMake(0, 0, 44, 44);
        [_titleBaseView addSubview:goldImgView];
        
        [_titleBaseView addSubview:self.goldLabel];
        typeof(self) weakself = self;
        [self.goldLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(goldImgView.mas_right).mas_offset(10);
            make.bottom.top.right.mas_equalTo(weakself.titleBaseView).mas_offset(0);
        }];
    }
    return _titleBaseView;
}

@end
