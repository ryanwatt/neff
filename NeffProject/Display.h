//
//  Display.h
//  NeffProject
//
//  Created by Ryan S. Watt on 3/25/15.
//  Copyright (c) 2015 Ryan S. Watt. All rights reserved.
//

#import <Parse/Parse.h>
#import "Store.h"
#import "Picture.h"

static NSString *displayNameKey = @"displayNameKey";
static NSString *displayStoreKey = @"displayStoreKey";

@interface Display : PFObject

@property (nonatomic ,strong) NSString *name;
@property (nonatomic, strong) Store *store;



@end
