//
//  AddReportViewController.m
//  NeffProject
//
//  Created by Ryan S. Watt on 3/31/15.
//  Copyright (c) 2015 Ryan S. Watt. All rights reserved.
//

#import "AddReportViewController.h"
#import "CameraViewController.h"

@interface AddReportViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong)UILabel *picked;

@end

@implementation AddReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UILabel *chooseDisplayTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 75, 315, 75)];
    chooseDisplayTypeLabel.text = @"Choose Display Type:";
    chooseDisplayTypeLabel.textColor = [UIColor blackColor];
    chooseDisplayTypeLabel.font = [UIFont fontWithName:@"Bebas Neue" size:44];
    [self.view addSubview:chooseDisplayTypeLabel];
    
    UIButton *goToCameraButton= [UIButton buttonWithType:UIButtonTypeCustom];
    goToCameraButton.frame = CGRectMake(self.view.frame.size.width - 265, self.view.frame.size.height - 160, 150, 100);
//    goToCameraButton.clipsToBounds = YES;
//    goToCameraButton.layer.cornerRadius = goToCameraButton.bounds.size.width/1.0f;
//    goToCameraButton.layer.borderWidth = 0.75f;
//    goToCameraButton.layer.borderColor = [UIColor blackColor].CGColor;
    [goToCameraButton setImage:[UIImage imageNamed:@"Camera-50"] forState:UIControlStateNormal];
    [goToCameraButton addTarget:self action:@selector(goToCameraView:) forControlEvents:UIControlEventTouchUpInside];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.view addSubview:goToCameraButton];

    [self thePickerView];
}

-(void)thePickerView {
    UIPickerView *picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 450, self.view.frame.size.width - 40, 100)];
    picker.delegate = self;
    picker.dataSource = self;
    picker.transform = CGAffineTransformMakeScale(1.2, 1.5);
    
    [self.view addSubview:picker];
}

- (void)goToCameraView:(id)sender {
    CameraViewController *cameraVC = [CameraViewController new];
    [self.navigationController pushViewController:cameraVC animated:YES];
}
    

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    self.picked.text = [NSString stringWithFormat:@"%@ / %@", [self data][0][[pickerView selectedRowInComponent:0]], [self data][1][[pickerView selectedRowInComponent:1]]];
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.data[component][row];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return [self.data count];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.data[component] count];
}

- (NSArray *)data {
    
    return @[
             [self gender],
             [self displays]];
}

- (NSArray *)gender {
    
    return @[ @"Men",
              @"Women",
              @"Youth"];
}

- (NSArray *)displays {
    
    return @[ @"Tees",
              @"Tanks",
              @"Tops",
              @"Beanies",
              @"Caps",
              @"Watches",
              @"Shorts",
              @"Snow",
              @"Outerwear",
              @"Disney",
              @"Backpacks",
              @"Eyewear",
              @"Accessories"];
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
