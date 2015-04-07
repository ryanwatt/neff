//
//  ModelController.m
//  NeffProject
//
//  Created by Ryan S. Watt on 3/25/15.
//  Copyright (c) 2015 Ryan S. Watt. All rights reserved.
//

#import "ModelController.h"
#import <Parse/Parse.h>

@implementation ModelController

+ (ModelController *)sharedInstance {
    static ModelController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [ModelController new];
    });
    return sharedInstance;
}

- (void)savePicture:(PFFile *)picture withDisplay:(Display *)display andStore:(Store *)store {
    Picture *newPicture = [Picture objectWithClassName:@"Picture"];
    newPicture[@"picture"] = picture;
    newPicture[@"store"] = store;
    newPicture[@"display"] = display;
    [newPicture saveInBackground];
}


-(void)savePicture:(PFFile *)picture
{
    Picture *newPicture = [Picture objectWithClassName:@"Picture"];
    newPicture[@"picture"] = picture;
    [newPicture saveInBackground];
}
- (void)saveStore:(PFObject *)store withName:(NSString *)name andDisplays:(PFObject *)display andStoreId:(NSString *)storeId {
    Store *newStore = [Store objectWithClassName:@"Store"];
    newStore[@"store"] = store;
    newStore[@"name"] = name;
    newStore[@"display"] = display;
    newStore[@"storeId"] = storeId;
    [newStore saveInBackground];
    
}

//- (NSArray *)picturesArray {
//    
//}
//
//- (NSArray *)storesArray {
//    
//}


@end
