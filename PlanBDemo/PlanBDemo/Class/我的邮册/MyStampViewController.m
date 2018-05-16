//
//  MyStampViewController.m
//  PlanBDemo
//
//  Created by jia on 2018/5/7.
//  Copyright © 2018年 JiaJingWei. All rights reserved.
//

#import "MyStampViewController.h"
#import "StampCollectionView.h"
#import "StampCollectionViewCell.h"
@interface MyStampViewController ()

@property (nonatomic) StampCollectionView *collectionView;

@end

@implementation MyStampViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的收藏";
    [self.view addSubview:self.collectionView];
    self.collectionView.dataArray = @[@"qwe",@"qwe"];
    

}

#pragma mark -lazy
- (StampCollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(100, 100);
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 5;
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        
        _collectionView = [[StampCollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
        _collectionView.showsVerticalScrollIndicator = YES;
        _collectionView.scrollEnabled = YES;

    }
    return _collectionView;
}

@end
