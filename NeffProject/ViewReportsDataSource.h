//
//  ViewReportsDataSource.h
//  NeffProject
//
//  Created by Ryan S. Watt on 4/8/15.
//  Copyright (c) 2015 Ryan S. Watt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ViewReportsTableViewCell.h"

@interface ViewReportsDataSource : NSObject <UITableViewDataSource>

-(void)registerTableView:(UITableView *)tableView;

@end
