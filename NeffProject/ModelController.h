//
//  ModelController.h
//  NeffProject
//
//  Created by Ryan S. Watt on 3/25/15.
//  Copyright (c) 2015 Ryan S. Watt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "State.h"
#import "Store.h"
#import "Picture.h"
#import "Display.h"
#import "Team.h"

@interface ModelController : NSObject

@property (nonatomic, strong) NSArray *picturesArray;
@property (nonatomic, strong) NSArray *storesArray;

+ (ModelController *)sharedInstance;
-(void)savePicture:(PFFile *)picture;
- (void)savePicture:(PFFile *)picture withDisplay:(Display *)display andStore:(Store *)store;
- (void)saveStore:(PFObject *)store withName:(NSString *)name andDisplays:(PFObject *)display andStoreId:(NSString *)storeId;



@end
