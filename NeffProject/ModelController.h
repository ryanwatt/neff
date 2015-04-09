//
//  ModelController.h
//  NeffProject
//
//  Created by Ryan S. Watt on 3/25/15.
//  Copyright (c) 2015 Ryan S. Watt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

#import "Picture.h"


@interface ModelController : NSObject

@property (nonatomic) NSArray *pictures;
@property (nonatomic, strong) PFFile *picture;

+ (ModelController *)sharedInstance;

- (void)savePicture:(PFFile *)picture withNotes:(NSString *)notes;



@end
