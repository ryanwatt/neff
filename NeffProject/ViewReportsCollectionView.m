//
//  ViewReportsCollectionView.m
//  NeffProject
//
//  Created by Ryan S. Watt on 4/8/15.
//  Copyright (c) 2015 Ryan S. Watt. All rights reserved.
//

#import "ViewReportsCollectionView.h"
#import "ViewReportsCVDataSource.h"

@interface ViewReportsCollectionView ()
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) ViewReportsCVDataSource *dataSource;
@end

@implementation ViewReportsCollectionView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [ViewReportsCVDataSource new];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self.dataSource;
    [self.dataSource registerCollectionView:self.collectionView];
    
    [self.view addSubview:self.collectionView];
    
    // Do any additional setup after loading the view.
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
