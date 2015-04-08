//
//  ViewReportsDataSource.m
//  NeffProject
//
//  Created by Ryan S. Watt on 4/8/15.
//  Copyright (c) 2015 Ryan S. Watt. All rights reserved.
//

#import "ViewReportsDataSource.h"
#import <Parse/Parse.h>

@interface ViewReportsDataSource ()

@property (nonatomic, strong) ViewReportsTableViewCell *cell;

@end

@implementation ViewReportsDataSource

- (void)registerTableView:(UITableView *)tableView {
    
    [tableView registerClass:[ViewReportsTableViewCell class] forCellReuseIdentifier:NSStringFromClass([ViewReportsTableViewCell class])];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ViewReportsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ViewReportsTableViewCell class])];

    return cell;
}


@end
