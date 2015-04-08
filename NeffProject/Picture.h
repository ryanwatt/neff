//
//  Picture.h
//  NeffProject
//
//  Created by Ryan S. Watt on 3/25/15.
//  Copyright (c) 2015 Ryan S. Watt. All rights reserved.
//

#import <Parse/Parse.h>
#import "Picture.h"
#import "PictureInfo.h"
@interface Picture : PFObject

@property (nonatomic,strong) PFFile *picture;
@property (nonatomic, strong) PictureInfo *info;

@end
