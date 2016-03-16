//
//  AppDelegate.h
//  FanWeighIn
//
//  Created by arvind on 8/6/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navController;
@property(nonatomic,retain) NSMutableArray *firstCollectionsArray,*twitterUsersList,*selectedSourceSongsArray,*songDetailsArray,*sourcesArray,*sourcesIDArray,*twitterFriendsArray;
@property(nonatomic,retain) UIImage *twitterProfileImage;
@property(nonatomic,retain) NSString *loginMethod;
@property(nonatomic,retain) NSString *deviceToken;
@end

