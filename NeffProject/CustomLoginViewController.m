//
//  CustomLoginViewController.m
//  NeffProject
//
//  Created by Ryan S. Watt on 3/30/15.
//  Copyright (c) 2015 Ryan S. Watt. All rights reserved.
//

#import "CustomLoginViewController.h"

@interface CustomLoginViewController ()

@property (nonatomic, strong)UILabel *titleLabel;

@end

@implementation CustomLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.logInView.dismissButton setAlpha:0.0f];
    
    [self.logInView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]]];
    [self.logInView setTintColor:[UIColor blackColor]];
    [self.logInView setLogo: [[UIImageView alloc] initWithImage:[UIImage imageNamed:nil]]];
    [self.logInView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"neffModel"]]];
    
    self.logInView.signUpButton.backgroundColor = [UIColor whiteColor];
    [self.logInView.signUpButton setBackgroundImage:nil forState:UIControlStateNormal];
    [self.logInView.signUpButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.logInView.logInButton setBackgroundImage:nil forState:UIControlStateNormal];
    self.logInView.logInButton.backgroundColor = [UIColor blackColor];
    [self.logInView.logInButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.logInView.passwordForgottenButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    
    
    
}

- (void)viewDidLayoutSubviews {
    
    [self.logInView.usernameField setFrame:CGRectMake(0, self.logInView.frame.size.height - 300, self.view.frame.size.width, 50)];
    self.logInView.usernameField.placeholder = @"Username";
    [self.logInView.passwordField setFrame:CGRectMake(0, self.logInView.frame.size.height - 250, self.view.frame.size.width, 50)];
    self.logInView.passwordField.placeholder = @"Neff Id";
    [self.logInView.passwordForgottenButton setFrame:CGRectMake(0, self.logInView.frame.size.height - 195, self.view.frame.size.width - 225, 30)];
    [self.logInView.logInButton setFrame:CGRectMake(0, self.logInView.frame.size.height - 120, self.view.frame.size.width, 70)];
    [self.logInView.signUpButton setFrame:CGRectMake(0, self.logInView.frame.size.height - 50, self.view.frame.size.width, 50)];
    
    [self.logInView.logo setFrame:CGRectMake(0, 75, self.view.frame.size.width, 40)];
    
    
    //    NSDictionary *dictionary = NSDictionaryOfVariableBindings(self.logInView.usernameField, self.logInView.passwordField, self.logInView.logInButton, self.logInView.signUpButton);
    //    NSArray *vertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_logInView.usernameField]-[_logInView.password]-[_logInView.logInButton]-[_logInView.signUpButton]-|" options:0 metrics:nil views:dictionary];
    //    [self.view addConstraints:vertical];
    //
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
