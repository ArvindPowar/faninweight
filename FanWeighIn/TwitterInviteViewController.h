//
//  TwitterInviteViewController.h
//  FirstPlay
//
//  Created by mansoor shaikh on 06/06/14.
//  Copyright (c) 2014 MobiWebCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "FHSTwitterEngine.h"

@interface TwitterInviteViewController : UIViewController<FHSTwitterEngineAccessTokenDelegate>
@property(nonatomic,retain) AppDelegate *appDelegate;
@property(nonatomic,retain) NSMutableArray *selectedFriendNames;
@property(nonatomic,retain) NSString *name,*goalwght,*curwghts,*dateStr,*curtdftvalue,*DateContentStr;

-(IBAction)popViewController;
-(IBAction)inviteFriends;
@end
