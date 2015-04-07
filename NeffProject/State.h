//
//  State.h
//  NeffProject
//
//  Created by Ryan S. Watt on 3/25/15.
//  Copyright (c) 2015 Ryan S. Watt. All rights reserved.
//

#import <Parse/Parse.h>
#import <Foundation/Foundation.h>

static NSString *storeKey = @"storeKey";

@interface State : PFObject

@property (nonatomic, strong) NSArray *storesArray;

@end
