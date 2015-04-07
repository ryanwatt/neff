//
//  CustomSignUpViewController.m
//  NeffProject
//
//  Created by Ryan S. Watt on 3/30/15.
//  Copyright (c) 2015 Ryan S. Watt. All rights reserved.
//

#import "CustomSignUpViewController.h"

@interface CustomSignUpViewController ()

@end

@implementation CustomSignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"neffLogo"]];
//    self.signUpView.logo = logoView;
    [self.signUpView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:nil]]];
    [self.signUpView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"neffParadiseHat2"]]];
    [self.signUpView.signUpButton setTitle:@"Request To Sign Up With Neff" forState:UIControlStateNormal];
    
    [self.signUpView.signUpButton setBackgroundImage:nil forState:UIControlStateNormal];
    [self.signUpView.signUpButton setBackgroundColor:[UIColor blackColor]];
    [self.signUpView.signUpButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
}

-(void)viewDidLayoutSubviews {
//    [self.signUpView.logo setFrame:CGRectMake(self.signUpView.frame.size.width - 75, self.signUpView.frame.size.height - 500, 75, 50)];
    [self.signUpView.usernameField setFrame:CGRectMake(0, self.signUpView.frame.size.height - 250, self.signUpView.frame.size.width, 50)];
    self.signUpView.usernameField.placeholder = @"Desired Neff Username";
    [self.signUpView.passwordField setAlpha:0.0];
//    [self.signUpView.passwordField setFrame:CGRectMake(0, self.signUpView.frame.size.height - 200, self.signUpView.frame.size.width, 50)];
    [self.signUpView.emailField setFrame:CGRectMake(0, self.signUpView.frame.size.height - 200, self.signUpView.frame.size.width, 50)];
    
    [self.signUpView.signUpButton setFrame:CGRectMake(0, self.signUpView.frame.size.height - 75, self.signUpView.frame.size.width, 75)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
