//
//  ViewReportsViewController.m
//  NeffProject
//
//  Created by Ryan S. Watt on 3/31/15.
//  Copyright (c) 2015 Ryan S. Watt. All rights reserved.
//

#import "ViewReportsViewController.h"

@interface ViewReportsViewController () <UITableViewDelegate>

@end

@implementation ViewReportsViewController

-(void)viewDidAppear:(BOOL)animated {
    
    [self reloadTable];
}

- (void)reloadTable {
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setBackgroundColor:[UIColor blackColor]];
    [self.tableView setTintColor:[UIColor whiteColor]];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return self.view.frame.size.width;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
