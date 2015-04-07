//
//  Store.h
//  NeffProject
//
//  Created by Ryan S. Watt on 3/25/15.
//  Copyright (c) 2015 Ryan S. Watt. All rights reserved.
//

#import <Parse/Parse.h>

static NSString *storePictureKey = @"storePictureKey";
static NSString *storeDisplayKey = @"storeDisplayKey";
static NSString *storeIdKey = @"storeIdKey";

@interface Store : PFObject

@property (nonatomic) NSArray *storePicture;
@property (nonatomic, strong) NSArray *storeDisplay;
@property (nonatomic, strong) NSString *storeId;

@end
