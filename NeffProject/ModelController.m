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

- (NSArray *)pictures
{
    PFQuery *query = [PFQuery queryWithClassName:@"Picture"];
//    PFObject *picture = [PFObject objectWithClassName:@"Picture"];
//    [query whereKey:picture.ACL equalTo:[PFUser currentUser].objectId];
    return [query findObjects];
}

- (void)savePicture:(PFFile *)picture withNotes:(NSString *)notes
{
    Picture *newPicture = [Picture objectWithClassName:@"Picture"];
    newPicture.ACL = [PFACL ACLWithUser:[PFUser currentUser]];
    newPicture[@"picture"] = picture;
//    newPicture.info[@""]
    [newPicture saveInBackground];
}



@end
