//
//  Team.h
//  NeffProject
//
//  Created by Ryan S. Watt on 3/25/15.
//  Copyright (c) 2015 Ryan S. Watt. All rights reserved.
//

#import <Parse/Parse.h>
static NSString *teamNameKey = @"teamNameKey";
static NSString *teamIdKey = @"teamIDKey";

@interface Team : PFObject

@property (nonatomic, strong) NSString *teamName;
@property (nonatomic, strong) NSString *teamId;

@end
