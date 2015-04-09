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

@interface SubmitPictureViewController () <UITextViewDelegate>

@property (nonatomic, strong) UITextView *notesView;




@end

@implementation SubmitPictureViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tapGesture];

    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    self.view.backgroundColor = [UIColor blackColor];
    [self layoutStructures];
    
    self.notesView.delegate = self;
    
}

- (void)layoutStructures {
    
//    UIView *backdropView = [[UIView alloc] initWithFrame:CGRectMake(0, 55, self.view.frame.size.width, 300)];
//    backdropView.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:backdropView];
    
    UIImageView *thumbnailView = [[UIImageView alloc] initWithImage:self.thumbnail];
    thumbnailView.backgroundColor = [UIColor redColor];
    thumbnailView.frame = CGRectMake(85, 65, 200, 240);
    thumbnailView.image = self.thumbnail;
    [self.view addSubview:thumbnailView];
    
    UILabel *notesLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 350, self.view.frame.size.height - 350, 100, 30)];
    notesLabel.text = @"Notes:";
    notesLabel.textColor = [UIColor whiteColor];
    notesLabel.font = [UIFont fontWithName:@"BanglaSangamMN" size:18];
    [self.view addSubview:notesLabel];
    
    self.notesView = [[UITextView alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 350, self.view.frame.size.height - 325, 325, 230)];
    self.notesView.backgroundColor = [UIColor clearColor];
    self.notesView.textColor = [UIColor whiteColor];
    self.notesView.allowsEditingTextAttributes = YES;
    self.notesView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.notesView.layer.borderWidth = 0.5f;
    [self.view addSubview:self.notesView];
    
    
    UIButton *submitButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 320 , self.notesView.frame.size.height + self.notesView.frame.origin.y + 5 , 265, 60)];
    submitButton.backgroundColor = [UIColor blackColor];
    [submitButton setTitle:@"Submit to Neff" forState:UIControlStateNormal];
    [submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    submitButton.layer.borderColor = [UIColor whiteColor].CGColor;
    submitButton.layer.borderWidth = 0.5f;
    submitButton.titleLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-SemiBold" size:24];
    [submitButton addTarget:self action:@selector(submitToNeff:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitButton];
    
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 25, 60, 30)];
    [backButton setTitle:@"Cancel" forState:UIControlStateNormal];
    backButton.titleLabel.textColor = [UIColor whiteColor];
    backButton.titleLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-SemiBold" size:18];
    [backButton addTarget:self action:@selector(backToCamera:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
}

-(void)dismissKeyboard
{
    [self.notesView resignFirstResponder];
}

- (void)submitToNeff:(id)sender {
    PFFile *picture = [ModelController sharedInstance].picture;
    [[ModelController sharedInstance] savePicture:picture withNotes:self.notesView.text];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)backToCamera:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}








@end
