//
//  ViewReportsCVDataSource.m
//  NeffProject
//
//  Created by Ryan S. Watt on 4/8/15.
//  Copyright (c) 2015 Ryan S. Watt. All rights reserved.
//

#import "ViewReportsCVDataSource.h"
#import "ModelController.h"

@implementation ViewReportsCVDataSource

-(void)registerCollectionView:(UICollectionView *)collectionView
{
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[ModelController sharedInstance].pictures count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:cell.frame];
    imageView.image = [UIImage imageWithContentsOfFile:[[ModelController sharedInstance].pictures objectAtIndex:indexPath.row]];
    
    return cell;
}

@end
