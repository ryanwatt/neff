//
//  ViewController.m
//  NeffProject
//
//  Created by Ryan S. Watt on 3/23/15.
//  Copyright (c) 2015 Ryan S. Watt. All rights reserved.
//

#import "ViewController.h"
#import "CustomLoginViewController.h"
#import "CustomSignUpViewController.h"
#import "CameraViewController.h"
#import "AddReportViewController.h"
#import "ViewReportsViewController.h"
#import "ViewReportsCollectionView.h"
#import <Parse/Parse.h>


@interface ViewController () <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (![PFUser currentUser]) { // No user logged in
        // Create the log in view controller
        CustomLoginViewController *logInViewController = [[CustomLoginViewController alloc] init];
        [logInViewController setDelegate:self]; // Set ourselves as the delegate
        
        
        // Create the sign up view controller
        CustomSignUpViewController *signUpViewController = [[CustomSignUpViewController alloc] init];
        [signUpViewController setDelegate:self]; // Set ourselves as the delegate
        
        // Assign our sign up controller to be displayed from the login controller
        [logInViewController setSignUpController:signUpViewController];
        
        // Present the log in view controller
        [self presentViewController:logInViewController animated:YES completion:NULL];
}
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
        
    self.navigationController.navigationBar.translucent = NO;
    
    [self viewButtons];
    
}
    // Sent to the delegate to determine whether the log in request should be submitted to the server.
- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
    // Check if both fields are completed
    if (username && password && username.length != 0 && password.length != 0) {
        return YES; // Begin login process
    }
    
    [[[UIAlertView alloc] initWithTitle:@"Missing Information"
                                message:@"Make sure you fill out all of the information!"
                               delegate:nil
                      cancelButtonTitle:@"ok"
                      otherButtonTitles:nil] show];
    return NO; // Interrupt login process
}

// Sent to the delegate when a PFUser is logged in.
- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

// Sent to the delegate when the log in attempt fails.
- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    NSLog(@"Failed to log in...");
}

// Sent to the delegate when the log in screen is dismissed.
- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    [self.navigationController popViewControllerAnimated:YES];
}

// Sent to the delegate to determine whether the sign up request should be submitted to the server.
- (BOOL)signUpViewController:(PFSignUpViewController *)signUpController shouldBeginSignUp:(NSDictionary *)info {
    BOOL informationComplete = YES;
    
    // loop through all of the submitted data
    for (id key in info) {
        NSString *field = [info objectForKey:key];
        if (!field || field.length == 0) { // check completion
            informationComplete = NO;
            break;
        }
    }
    
    // Display an alert if a field wasn't completed
    if (!informationComplete) {
        [[[UIAlertView alloc] initWithTitle:@"Missing Information"
                                    message:@"Make sure you fill out all of the information!"
                                   delegate:nil
                          cancelButtonTitle:@"ok"
                          otherButtonTitles:nil] show];
    }
    
    return informationComplete;
}

// Sent to the delegate when a PFUser is signed up.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:nil]; // Dismiss the PFSignUpViewController
}

// Sent to the delegate when the sign up attempt fails.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error {
    NSLog(@"Failed to sign up...");
}

// Sent to the delegate when the sign up screen is dismissed.
- (void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController {
    NSLog(@"User dismissed the signUpViewController");
}

- (void)viewButtons {
    
    UIButton *addReport = [UIButton buttonWithType:UIButtonTypeCustom];
    addReport.frame = CGRectMake(0, 0, self.view.frame.size.width, 303);
    [addReport setBackgroundImage:[UIImage imageNamed:@"groupSkateDark"] forState:UIControlStateNormal];
    [addReport setBackgroundImage:[UIImage imageNamed:@"groupSkate"] forState:UIControlStateHighlighted];
    [addReport setTitle:@"Add Report" forState:UIControlStateNormal];
    addReport.titleLabel.textAlignment = NSTextAlignmentCenter;
    UIFont *fonts = [UIFont fontWithName:@"Bebas Neue" size:90];
    addReport.titleLabel.font = fonts;
    [addReport setTitleColor:[UIColor colorWithRed:0.95 green:0.9 blue:0.95 alpha:0.85] forState:UIControlStateNormal];
    addReport.contentMode = UIViewContentModeScaleAspectFit;
    [addReport addTarget:self action:@selector(addReport:) forControlEvents:UIControlEventTouchUpInside];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.view addSubview:addReport];
    
    UIButton *viewReports = [UIButton buttonWithType:UIButtonTypeCustom];
    viewReports.frame = CGRectMake(0, 303, self.view.frame.size.width, 300);
    [viewReports setBackgroundImage:[UIImage imageNamed:@"neffModelBlonde2Dark"] forState:UIControlStateNormal];
    [viewReports setBackgroundImage:[UIImage imageNamed:@"neffModelBlonde2"] forState:UIControlStateHighlighted];
    viewReports.contentMode = UIViewContentModeScaleToFill;
    [viewReports setTitle:@"View Reports" forState:UIControlStateNormal];
    [viewReports setTitleColor:[UIColor colorWithRed:0.0 green:0.9 blue:0.75 alpha:0.85] forState:UIControlStateNormal];
    viewReports.titleLabel.textAlignment = NSTextAlignmentCenter;
    viewReports.titleLabel.font = [UIFont fontWithName:@"Bebas Neue" size:80];
    [viewReports addTarget:self action:@selector(viewReports:) forControlEvents:UIControlEventTouchUpInside];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.view addSubview:viewReports];
    
    // vertical effect
    UIInterpolatingMotionEffect *verticalMotionEffect =
    [[UIInterpolatingMotionEffect alloc]
     initWithKeyPath:@"center.y"
     type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    verticalMotionEffect.minimumRelativeValue = @(-40);
    verticalMotionEffect.maximumRelativeValue = @(40);
    
    // horizontal effect
    UIInterpolatingMotionEffect *horizontalMotionEffect =
    [[UIInterpolatingMotionEffect alloc]
     initWithKeyPath:@"center.x"
     type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontalMotionEffect.minimumRelativeValue = @(-30);
    horizontalMotionEffect.maximumRelativeValue = @(30);
    
    // Create group to combine both
    UIMotionEffectGroup *group = [UIMotionEffectGroup new];
    group.motionEffects = @[horizontalMotionEffect, verticalMotionEffect];
    
    // Add both effects to your view
    [viewReports.titleLabel addMotionEffect:group];
    [addReport.titleLabel addMotionEffect:group];
    
    
    
////    
//    UIButton *goToCameraButton= [UIButton buttonWithType:UIButtonTypeCustom];
//    goToCameraButton.frame = CGRectMake(230, 543, 150, 70);
////    goToCameraButton.clipsToBounds = YES;
////    goToCameraButton.layer.cornerRadius = goToCameraButton.bounds.size.width/2.0f;
////    goToCameraButton.layer.borderWidth = 0.75f;
//    goToCameraButton.titleLabel.textAlignment = NSTextAlignmentLeft;
////    goToCameraButton.layer.borderColor = [UIColor blackColor].CGColor;
//    [goToCameraButton setTitle:@"Camera" forState:UIControlStateNormal];
//    goToCameraButton.titleLabel.font = [UIFont fontWithName:@"BanglaSangamMN" size:30];
//    [goToCameraButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
////    [goToCameraButton setTitleColor:[UIColor whiteColor] forState:UIControlEventTouchDown];
//    [goToCameraButton addTarget:self action:@selector(goToCameraView:) forControlEvents:UIControlEventTouchUpInside];
//    [self dismissViewControllerAnimated:YES completion:nil];
//    [self.view addSubview:goToCameraButton];
    
    
}

- (void)addReport:(id)sender {
    AddReportViewController *addReportVC = [AddReportViewController new];
    [self.navigationController pushViewController:addReportVC animated:YES];
}

-(void)viewReports:(id)sender {
    ViewReportsCollectionView *viewReportsVC = [ViewReportsCollectionView new];
    [self.navigationController pushViewController:viewReportsVC animated:YES];
}

//- (void)goToCameraView:(id)sender {
//    CameraViewController *cameraVC = [CameraViewController new];
//    [self.navigationController pushViewController:cameraVC animated:YES];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
