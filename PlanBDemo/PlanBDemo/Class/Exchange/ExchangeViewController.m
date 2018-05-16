//
//  ExchangeViewController.m
//  PlanBDemo
//
//  Created by jia on 2018/5/8.
//  Copyright © 2018年 JiaJingWei. All rights reserved.
//

#import "ExchangeViewController.h"
#import "ExchangeCollectionView.h"
@interface ExchangeViewController ()
@property (nonatomic) ExchangeCollectionView *collectionView;
@end

@implementation ExchangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"交易所";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self.view addSubview:self.collectionView];
    self.collectionView.dataArray = @[@"qwe",@"sd"];
    
}

- (ExchangeCollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(100, 100);
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 5;
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        
        _collectionView = [[ExchangeCollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    }
    return _collectionView;
}
@end
