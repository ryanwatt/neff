//
//  SubmitPictureViewController.m
//  NeffProject
//
//  Created by Ryan S. Watt on 3/30/15.
//  Copyright (c) 2015 Ryan S. Watt. All rights reserved.
//

#import "SubmitPictureViewController.h"
#import "CameraViewController.h"
#import "ModelController.h"
#import "ViewController.h"

@interface SubmitPictureViewController ()

@end

@implementation SubmitPictureViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    self.view.backgroundColor = [UIColor blackColor];
    [self layoutStructures];
}

- (void)layoutStructures {
    
    UIView *backdropView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    backdropView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:backdropView];
    
    UIImageView *thumbnailView = [[UIImageView alloc] initWithImage:self.thumbnail];
    thumbnailView.backgroundColor = [UIColor redColor];
    thumbnailView.frame = CGRectMake(85, 0, 200, 240);
    thumbnailView.image = self.thumbnail;
    [self.view addSubview:thumbnailView];
    
    UILabel *notesLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 350, self.view.frame.size.height - 425, 100, 30)];
    notesLabel.text = @"Notes:";
    notesLabel.textColor = [UIColor whiteColor];
    notesLabel.font = [UIFont fontWithName:@"BanglaSangamMN" size:18];
    [self.view addSubview:notesLabel];
    
    UITextView *notesView = [[UITextView alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 350, self.view.frame.size.height - 400, 325, 230)];
    notesView.backgroundColor = [UIColor clearColor];
    notesView.textColor = [UIColor whiteColor];
    notesView.allowsEditingTextAttributes = YES;
    notesView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    notesView.layer.borderWidth = 0.5f;
    [self.view addSubview:notesView];
    
    UIButton *submitButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 320 , notesView.frame.size.height + notesView.frame.origin.y + 5 , 265, 60)];
    submitButton.backgroundColor = [UIColor blackColor];
    [submitButton setTitle:@"Submit to Neff" forState:UIControlStateNormal];
    [submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    submitButton.layer.borderColor = [UIColor whiteColor].CGColor;
    submitButton.layer.borderWidth = 0.5f;
    submitButton.titleLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-SemiBold" size:24];
    [submitButton addTarget:self action:@selector(submitToNeff:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitButton];
    
//    UIButton *homeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 50, 50, 50)];
//    [backButton setTitle:@"X" forState:UIControlStateNormal];
//    backButton.titleLabel.textColor = [UIColor whiteColor];
//    backButton.titleLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-SemiBold" size:50];
//    [backButton addTarget:self action:@selector(backToHome:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:backButton];
    
}

- (void)submitToNeff:(id)sender {
   
}

//- (void)backToHome:(id)sender {
//    [self.navigationController popToRootViewControllerAnimated:YES];
//}






@end
