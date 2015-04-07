//
//  Picture.h
//  NeffProject
//
//  Created by Ryan S. Watt on 3/25/15.
//  Copyright (c) 2015 Ryan S. Watt. All rights reserved.
//

#import <Parse/Parse.h>
#import "Store.h"
#import "Picture.h"
@class Display;
#import "State.h"

static NSString *pictureStoreKey = @"pictureStoreKey";
static NSString *pictureDisplayKey = @"pictureDisplayKey";


@interface Picture : PFObject

@property (nonatomic,strong) PFFile *picture;
@property (nonatomic, strong) Store *store;
@property (nonatomic, strong) Display *display;

@end
