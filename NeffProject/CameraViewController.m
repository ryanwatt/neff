//
//  CameraViewController.m
//  NeffProject
//
//  Created by Ryan S. Watt on 3/25/15.
//  Copyright (c) 2015 Ryan S. Watt. All rights reserved.
//

#import "CameraViewController.h"
#import <Parse/Parse.h>
#import <AVFoundation/AVFoundation.h>
#import "ModelController.h"
#import "SubmitPictureViewController.h"

@interface CameraViewController ()

@property (nonatomic, strong) UIView *frameForCapture;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, retain) UIImage *image;

@end

@implementation CameraViewController
AVCaptureSession *session;
AVCaptureStillImageOutput *stillImageOutput;
AVCaptureVideoPreviewLayer *previewLayer;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    self.view.backgroundColor = [UIColor blackColor];
    
    
}
-(void)viewWillAppear:(BOOL)animated {
    self.frameForCapture = [UIView new];
    self.frameForCapture.frame = CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height);
    self.frameForCapture.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.frameForCapture];
    
//    self.imageView = [UIImageView new];
//    self.imageView.frame = CGRectMake(0, 525, 54, 75);
//    self.imageView.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:self.imageView];
    
    UIButton *takePhotoButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    takePhotoButton.frame = self.frameForCapture.frame;
    takePhotoButton.frame = CGRectMake(self.frameForCapture.frame.size.width/2.0 - 42.5, self.frameForCapture.frame.size.height - 90, 85, 85);
    takePhotoButton.clipsToBounds = YES;
    takePhotoButton.layer.cornerRadius = takePhotoButton.bounds.size.width/2.0f;
    takePhotoButton.layer.borderWidth = 2.0f;
    takePhotoButton.layer.borderColor = [UIColor whiteColor].CGColor;
    [takePhotoButton setTitle:@"neff" forState:UIControlStateNormal];
    takePhotoButton.titleLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-SemiBold" size:40];
    [takePhotoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    takePhotoButton.backgroundColor = [UIColor blackColor];
    [takePhotoButton addTarget:self action:@selector(takePhoto:) forControlEvents:UIControlEventTouchUpInside];
    [self.frameForCapture addSubview:takePhotoButton];
    
    
    session = [[AVCaptureSession alloc] init];
    [session setSessionPreset:AVCaptureSessionPresetPhoto];
    
    AVCaptureDevice *inputDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    NSError *error;
    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:inputDevice error:&error];
    
    if ([session canAddInput:deviceInput]) {
        [session addInput:deviceInput];
    }
    
    previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    [previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    CALayer *rootLayer = [[self view] layer];
    [rootLayer setMasksToBounds:YES];
    CGRect frame = self.frameForCapture.frame;
    
    [previewLayer setFrame:frame];
    
    [rootLayer insertSublayer:previewLayer atIndex:0];
    
    stillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys:AVVideoCodecJPEG, AVVideoCodecKey, nil];
    [stillImageOutput setOutputSettings:outputSettings];
    
    [session addOutput:stillImageOutput];
    
    [session startRunning];
    
}

- (void)takePhoto:(id)sender {
    AVCaptureConnection *videoConnection = nil;
    
    for (AVCaptureConnection *connection in stillImageOutput.connections) {
        for (AVCaptureInputPort *port in [connection inputPorts]) {
            if ([[port mediaType] isEqual:AVMediaTypeVideo]) {
                videoConnection = connection;
                break;
            }
        }
        if (videoConnection) {
            break;
        }
    }
    __block UIImage *blockImage = [UIImage new];

    [stillImageOutput captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        
        if (imageDataSampleBuffer != NULL) {
            NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
            self.image = [UIImage imageWithData:imageData];
            PFFile *imageFile = [PFFile fileWithName:@"newImage" data:imageData];
            [ModelController sharedInstance].picture = imageFile;
            //self.imageView.image = self.image;
            blockImage = self.image;
            SubmitPictureViewController *submit = [SubmitPictureViewController new];
            [submit setModalPresentationStyle:UIModalPresentationOverCurrentContext];
            submit.thumbnail = blockImage;
            [self presentViewController:submit animated:YES completion:nil];
        }
//        [session stopRunning];
//        [previewLayer removeFromSuperlayer];
//        session = nil;
//        previewLayer = nil;
        
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
