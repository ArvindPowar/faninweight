//
//  HomeViewController.h
//  FanWeighIn
//
//  Created by arvind on 8/6/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UpdateViewController.h"
#import "WorkoutViewController.h"
#import <Foundation/Foundation.h>

@class AppDelegate;
@interface HomeViewController : UIViewController
{
   
    UIImageView *fanImageView,*currentWeighImageView,*goalWeighImageView,*coundownImageView1,*countdownImageView2,*countdownImageView3;
    UILabel *nameLabel,*currentLabel,*goalLabel,*diffLabel,*nextLabel,*dateLabel,*dayLabel,*hourLabel,*minLabel,*timeLabel;
    UIButton *updateButton,*workoutButton;
    UpdateViewController *updateViewController;
    WorkoutViewController *workViewController;

}


@property(nonatomic,retain) UIImageView *fanImageView,*currentWeighImageView,*goalWeighImageView,*coundownImageView1,*countdownImageView2,*countdownImageView3;
@property(nonatomic,retain) IBOutlet UILabel *nameLabel,*currentLabel,*goalLabel,*diffLabel,*nextLabel,*dateLabel,*dayLabel,*hourLabel,*minLabel,*timeLabel,*displaynameLbl,*currentWghtLbl,*goalwghtLbl,*curwght,*goalwghts,*diffwght;
@property(nonatomic,retain) IBOutlet UIButton *updateButton,*workoutButton,*cotchBtn,*userList,*faceBookBtn,*twitterBtn;
@property(nonatomic,retain)    UpdateViewController *updateViewController;

@property(nonatomic,retain)    WorkoutViewController *workViewController;
@property(nonatomic,retain) NSString *goalwght,*curwghts,*dateStr,*curtdftvalue,*DateContentStr,*name;
@property(nonatomic,retain) NSDateFormatter *starttime;
@property(nonatomic,retain) NSString *theDate,*timeDuration;
@property(nonatomic,retain) IBOutlet UIActivityIndicatorView *activityIndicator;
@property(nonatomic,retain) AppDelegate *appDelegate;
@property(nonatomic,retain) NSTimer *timer;
-(void)goToUpdate;
-(void)goToWorkout;
@end
