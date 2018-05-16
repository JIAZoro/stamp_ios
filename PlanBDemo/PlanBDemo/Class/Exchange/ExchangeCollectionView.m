//
//  ExchangeCollectionView.m
//  PlanBDemo
//
//  Created by jia on 2018/5/8.
//  Copyright © 2018年 JiaJingWei. All rights reserved.
//

#import "ExchangeCollectionView.h"
#import "StampCollectionViewCell.h"

@interface ExchangeCollectionView() <UICollectionViewDelegate,UICollectionViewDataSource>
@end

@implementation ExchangeCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.delegate = self;
        self.dataSource = self;
    
        [self registerClass:[StampCollectionViewCell class] forCellWithReuseIdentifier:@"exchangeCell"];
    }
    return self;
}
- (void)setDataArray:(NSArray *)dataArray{
    [self reloadData];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    StampCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"exchangeCell" forIndexPath:indexPath];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


@end
