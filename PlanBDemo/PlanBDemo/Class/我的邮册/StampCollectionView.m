//
//  StampCollectionView.m
//  PlanBDemo
//
//  Created by jia on 2018/5/7.
//  Copyright © 2018年 JiaJingWei. All rights reserved.
//

#import "StampCollectionView.h"
#import "StampCollectionViewCell.h"
@interface StampCollectionView () <UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation StampCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self registerClass:[StampCollectionViewCell class] forCellWithReuseIdentifier:@"stampCollectionCell"];
        
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    StampCollectionViewCell *cell = [self dequeueReusableCellWithReuseIdentifier:@"stampCollectionCell" forIndexPath:indexPath];


    return cell;
}


- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (void)setDataArray:(NSArray *)dataArray{
    [self reloadData];
}


@end
