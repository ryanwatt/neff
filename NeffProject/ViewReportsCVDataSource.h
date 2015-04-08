//
//  ViewReportsCVDataSource.h
//  NeffProject
//
//  Created by Ryan S. Watt on 4/8/15.
//  Copyright (c) 2015 Ryan S. Watt. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

static NSString * const cellIdentifier = @"cell";

@interface ViewReportsCVDataSource : NSObject <UICollectionViewDataSource>

-(void)registerCollectionView:(UICollectionView *)collectionView;

@end
