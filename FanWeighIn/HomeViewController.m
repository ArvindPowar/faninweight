//
//  HomeViewController.m
//  FanWeighIn
//
//  Created by arvind on 8/6/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import "HomeViewController.h"
#import "UserLIstViewController.h"
#import "CotchingViewController.h"
#import "InviteFriendsViewController.h"
#import <Twitter/Twitter.h>
#import "TwitterInviteViewController.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import <FacebookSDK/FacebookSDK.h>
#import "Reachability.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize fanImageView,currentWeighImageView,goalWeighImageView,coundownImageView1,countdownImageView2,countdownImageView3;
@synthesize nameLabel,currentLabel,goalLabel,nextLabel,diffLabel,timeLabel,hourLabel,dateLabel,dayLabel,minLabel;
@synthesize updateButton,workoutButton;
@synthesize updateViewController,workViewController,displaynameLbl,currentWghtLbl,goalwghtLbl,goalwght,curwght,goalwghts,starttime,theDate,timeDuration,diffwght,curwghts,dateStr,curtdftvalue,DateContentStr,activityIndicator,cotchBtn,userList,faceBookBtn,twitterBtn,appDelegate,name,timer;
- (void)viewDidLoad {
    [super viewDidLoad];
    [activityIndicator stopAnimating];
    self.navigationController.navigationBarHidden=YES;
    appDelegate=(AppDelegate*)[[UIApplication sharedApplication] delegate];

 NSUserDefaults *prefsusername = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *prefscutwght = [NSUserDefaults standardUserDefaults];
     NSUserDefaults *prefsgolwght = [NSUserDefaults standardUserDefaults];
    UIGraphicsBeginImageContext(self.view.frame.size);
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    HomeViewController *home;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        displaynameLbl.text=[prefsusername objectForKey:@"name"];

    }else
    {

    if(height>=480 && height<568){
        
        [[UIImage imageNamed:@"bg1.png"] drawInRect:self.view.bounds];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        self.view.backgroundColor = [UIColor colorWithPatternImage:image];
        fanImageView=[[UIImageView alloc] initWithFrame:CGRectMake(5,5,300,90)];
        
        UIImage *imageFan = [UIImage imageNamed: @"fanweighinlogo.png"];
        [fanImageView setImage:imageFan];
        [self.view addSubview:fanImageView];
        
        nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(23,100,130,21)];
        nameLabel.backgroundColor = [UIColor clearColor];
        nameLabel.text=@"What's Up";
        nameLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fon = [nameLabel.font.fontDescriptor
                                  fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                  | UIFontDescriptorTraitItalic];
        nameLabel.font = [UIFont fontWithDescriptor:fon size:20];
        [self.view addSubview:nameLabel];
        
        displaynameLbl = [[UILabel alloc] initWithFrame:CGRectMake(135,100,152,21)];
        displaynameLbl.backgroundColor = [UIColor clearColor];
        displaynameLbl.textColor=[UIColor whiteColor];
        displaynameLbl.text=[prefsusername objectForKey:@"name"];
        UIFontDescriptor * fona = [displaynameLbl.font.fontDescriptor
                                   fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                   | UIFontDescriptorTraitItalic];
        displaynameLbl.font = [UIFont fontWithDescriptor:fona size:22];
        [self.view addSubview:displaynameLbl];
        
        UIImage *imageCount1 = [UIImage imageNamed: @"weightclassbg.png"];
        currentWeighImageView=[[UIImageView alloc] initWithFrame:CGRectMake(15,125,150,135)];
        [currentWeighImageView setImage:imageCount1];
        [self.view addSubview:currentWeighImageView];
        
        goalWeighImageView=[[UIImageView alloc] initWithFrame:CGRectMake(165, 125, 150, 135)];
        [goalWeighImageView setImage:imageCount1];
        [self.view addSubview:goalWeighImageView];
        
        currentLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,135,130,50)];
        currentLabel.backgroundColor = [UIColor clearColor];
        currentLabel.text =@"Current \n Weight Class";
        currentLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [currentLabel setNumberOfLines:4];
        currentLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * font = [currentLabel.font.fontDescriptor
                                   fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                   | UIFontDescriptorTraitItalic];
        currentLabel.font = [UIFont fontWithDescriptor:font size:20];
        currentLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:currentLabel];
        
        currentWghtLbl = [[UILabel alloc] initWithFrame:CGRectMake(25,180,130,30)];
        currentWghtLbl.backgroundColor = [UIColor clearColor];
        currentWghtLbl.lineBreakMode = NSLineBreakByWordWrapping;
        [currentWghtLbl setNumberOfLines:4];
        currentWghtLbl.textColor=[UIColor whiteColor];
        UIFontDescriptor * font1 = [currentWghtLbl.font.fontDescriptor
                                    fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                    | UIFontDescriptorTraitItalic];
        currentWghtLbl.font = [UIFont fontWithDescriptor:font1 size:30];
        currentWghtLbl.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:currentWghtLbl];
        
        curwght = [[UILabel alloc] initWithFrame:CGRectMake(15,205,160,30)];
        curwght.backgroundColor = [UIColor clearColor];
        //curwght.text =@"WelterWeight";
        curwght.lineBreakMode = NSLineBreakByWordWrapping;
        [curwght setNumberOfLines:4];
        curwght.textColor=[UIColor whiteColor];
        UIFontDescriptor * font12 = [curwght.font.fontDescriptor
                                     fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                     | UIFontDescriptorTraitItalic];
        curwght.font = [UIFont fontWithDescriptor:font12 size:18];
        curwght.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:curwght];
        
        goalLabel = [[UILabel alloc] initWithFrame:CGRectMake(175,135,130,50)];
        goalLabel.backgroundColor = [UIColor clearColor];
        goalLabel.text=@"Goal \n Weight Class";
        goalLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fonts = [goalLabel.font.fontDescriptor
                                    fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                    | UIFontDescriptorTraitItalic];
        goalLabel.font = [UIFont fontWithDescriptor:fonts size:20];
        goalLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [goalLabel setNumberOfLines:4];
        goalLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:goalLabel];
        
        goalwghtLbl = [[UILabel alloc] initWithFrame:CGRectMake(190,183,130,30)];
        goalwghtLbl.backgroundColor = [UIColor clearColor];
        goalwghtLbl.textColor=[UIColor whiteColor];
        UIFontDescriptor * fontz = [goalwghtLbl.font.fontDescriptor
                                    fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                    | UIFontDescriptorTraitItalic];
        goalwghtLbl.font = [UIFont fontWithDescriptor:fontz size:30];
        goalwghtLbl.lineBreakMode = NSLineBreakByWordWrapping;
        [goalwghtLbl setNumberOfLines:4];
        [self.view addSubview:goalwghtLbl];
        
        goalwghts= [[UILabel alloc] initWithFrame:CGRectMake(170,205,160,30)];
        goalwghts.backgroundColor = [UIColor clearColor];
        //goalwghts.text =@"Light Weight";
        goalwghts.lineBreakMode = NSLineBreakByWordWrapping;
        [goalwghts setNumberOfLines:4];
        goalwghts.textColor=[UIColor whiteColor];
        UIFontDescriptor * font123 = [goalwghts.font.fontDescriptor
                                      fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                      | UIFontDescriptorTraitItalic];
        goalwghts.font = [UIFont fontWithDescriptor:font123 size:18];
        goalwghts.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:goalwghts];
        
        diffLabel = [[UILabel alloc] initWithFrame:CGRectMake(30,260,210,30)];
        diffLabel.backgroundColor = [UIColor clearColor];
        diffLabel.text=@"To Make Weight :-";
        diffLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fontss = [diffLabel.font.fontDescriptor
                                     fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                     | UIFontDescriptorTraitItalic];
        diffLabel.font = [UIFont fontWithDescriptor:fontss size:20];
        [self.view addSubview:diffLabel];
        
        diffwght = [[UILabel alloc] initWithFrame:CGRectMake(200,260,150,30)];
        diffwght.backgroundColor = [UIColor clearColor];
        diffwght.textColor=[UIColor whiteColor];
        UIFontDescriptor * fontss2 = [diffwght.font.fontDescriptor
                                      fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                      | UIFontDescriptorTraitItalic];
        diffwght.font = [UIFont fontWithDescriptor:fontss2 size:20];
        [self.view addSubview:diffwght];
        
        nextLabel = [[UILabel alloc] initWithFrame:CGRectMake(30,290,250,35)];
        nextLabel.backgroundColor = [UIColor clearColor];
        nextLabel.text=@"Next Weight In";
        nextLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fontsss = [nextLabel.font.fontDescriptor
                                      fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                      | UIFontDescriptorTraitItalic];
        nextLabel.font = [UIFont fontWithDescriptor:fontsss size:30];
        [self.view addSubview:nextLabel];
        
        dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(30,320,290,25)];
        dateLabel.backgroundColor = [UIColor clearColor];
        
        dateLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fonta = [dateLabel.font.fontDescriptor
                                    fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                    | UIFontDescriptorTraitItalic];
        dateLabel.font = [UIFont fontWithDescriptor:fonta size:20];
        [self.view addSubview:dateLabel];
        
        UIImage *imagecount2 = [UIImage imageNamed: @"countdownbg.png"];
        coundownImageView1=[[UIImageView alloc] initWithFrame:CGRectMake(20,345,90,70)];
        [coundownImageView1 setImage:imagecount2];
        [self.view addSubview:coundownImageView1];
        
        countdownImageView2=[[UIImageView alloc] initWithFrame:CGRectMake(114,345,90,70)];
        [countdownImageView2 setImage:imagecount2];
        [self.view addSubview:countdownImageView2];
        
        countdownImageView3=[[UIImageView alloc] initWithFrame:CGRectMake(219,345,90,70)];
        [countdownImageView3 setImage:imagecount2];
        [self.view addSubview:countdownImageView3];
        
        dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(55,365,40,25)];
        dayLabel.backgroundColor = [UIColor clearColor];
        //dayLabel.text=@"20";
        dayLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fontaa = [dayLabel.font.fontDescriptor
                                     fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                     | UIFontDescriptorTraitItalic];
        dayLabel.font = [UIFont fontWithDescriptor:fontaa size:25];
        [self.view addSubview:dayLabel];
        
        hourLabel = [[UILabel alloc] initWithFrame:CGRectMake(145,365,200,25)];
        hourLabel.backgroundColor = [UIColor clearColor];
        //hourLabel.text=@"13";
        hourLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fontt = [hourLabel.font.fontDescriptor
                                    fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                    | UIFontDescriptorTraitItalic];
        hourLabel.font = [UIFont fontWithDescriptor:fontt size:25];
        [self.view addSubview:hourLabel];
        
        minLabel = [[UILabel alloc] initWithFrame:CGRectMake(250,365,40,25)];
        minLabel.backgroundColor = [UIColor clearColor];
        //minLabel.text=@"30";
        minLabel.textColor=[UIColor whiteColor];
        
        UIFontDescriptor * fonttt = [minLabel.font.fontDescriptor
                                     fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                     | UIFontDescriptorTraitItalic];
        minLabel.font = [UIFont fontWithDescriptor:fonttt size:25];
        [self.view addSubview:minLabel];
        
        timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(30,405,291,25)];
        timeLabel.backgroundColor = [UIColor clearColor];
        timeLabel.text=@"Days     Hours     Mintues";
        timeLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fontd = [timeLabel.font.fontDescriptor
                                    fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                    | UIFontDescriptorTraitItalic];
        timeLabel.font = [UIFont fontWithDescriptor:fontd size:23];
        
        [self.view addSubview:timeLabel];
        
        updateButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [updateButton addTarget:self action:@selector(goToUpdate)forControlEvents:UIControlEventTouchUpInside];
        updateButton.frame = CGRectMake(30,440,120,40);
        [updateButton setBackgroundImage: [UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
        [updateButton setTitle:@"UPDATE" forState:UIControlStateNormal];
        [updateButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        updateButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
        [self.view addSubview:updateButton];
        
        workoutButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [workoutButton addTarget:self action:@selector(goToWorkout)forControlEvents:UIControlEventTouchUpInside];
        workoutButton.frame = CGRectMake(185,440,120,40);
        [workoutButton setBackgroundImage: [UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
        [workoutButton setTitle:@"TRAINING" forState:UIControlStateNormal];
        [workoutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        workoutButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
        [self.view addSubview:workoutButton];
        
        cotchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [cotchBtn addTarget:self action:@selector(cotchingAction)forControlEvents:UIControlEventTouchUpInside];
        cotchBtn.frame = CGRectMake(30,485,130,40);
        [cotchBtn setBackgroundImage: [UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
        [cotchBtn setTitle:@"COACHING" forState:UIControlStateNormal];
        [cotchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        cotchBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
        [self.view addSubview:cotchBtn];
        
        userList = [UIButton buttonWithType:UIButtonTypeCustom];
        [userList addTarget:self action:@selector(userlistAction)forControlEvents:UIControlEventTouchUpInside];
        userList.frame = CGRectMake(175,485,120,40);
        [userList setBackgroundImage: [UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
        [userList setTitle:@"THE CARD" forState:UIControlStateNormal];
        [userList setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        userList.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
        [self.view addSubview:userList];
        
        faceBookBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [faceBookBtn addTarget:self action:@selector(facebookAction)forControlEvents:UIControlEventTouchUpInside];
        faceBookBtn.frame = CGRectMake(115,527,40,40);
        [faceBookBtn setBackgroundImage: [UIImage imageNamed:@"facebook.png"] forState:UIControlStateNormal];
        //[faceBookBtn setTitle:@"COTCHING" forState:UIControlStateNormal];
        [faceBookBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        faceBookBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
        [self.view addSubview:faceBookBtn];
        
        twitterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [twitterBtn addTarget:self action:@selector(twitterAction)forControlEvents:UIControlEventTouchUpInside];
        twitterBtn.frame = CGRectMake(175,527,40,40);
        [twitterBtn setBackgroundImage: [UIImage imageNamed:@"twitter.png"] forState:UIControlStateNormal];
        //[twitterBtn setTitle:@"USER LIST" forState:UIControlStateNormal];
        [twitterBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        twitterBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
        [self.view addSubview:twitterBtn];


    }else if(height>=568 && height<600){
    
        [[UIImage imageNamed:@"bg1.png"] drawInRect:self.view.bounds];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        self.view.backgroundColor = [UIColor colorWithPatternImage:image];
        fanImageView=[[UIImageView alloc] initWithFrame:CGRectMake(5,5,300,90)];
        
        UIImage *imageFan = [UIImage imageNamed: @"fanweighinlogo.png"];
        [fanImageView setImage:imageFan];
        [self.view addSubview:fanImageView];
        
        nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(23,100,130,21)];
        nameLabel.backgroundColor = [UIColor clearColor];
        nameLabel.text=@"What's Up";
        nameLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fon = [nameLabel.font.fontDescriptor
                                  fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                  | UIFontDescriptorTraitItalic];
        nameLabel.font = [UIFont fontWithDescriptor:fon size:20];
               [self.view addSubview:nameLabel];
        
        displaynameLbl = [[UILabel alloc] initWithFrame:CGRectMake(135,98,180,24)];
        displaynameLbl.backgroundColor = [UIColor clearColor];
        displaynameLbl.textColor=[UIColor whiteColor];
         displaynameLbl.text=[prefsusername objectForKey:@"name"];
        UIFontDescriptor * fona = [displaynameLbl.font.fontDescriptor
                                  fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                  | UIFontDescriptorTraitItalic];
        displaynameLbl.font = [UIFont fontWithDescriptor:fona size:21];
        [self.view addSubview:displaynameLbl];
        
        UIImage *imageCount1 = [UIImage imageNamed: @"weightclassbg.png"];
        currentWeighImageView=[[UIImageView alloc] initWithFrame:CGRectMake(15,125,150,135)];
        [currentWeighImageView setImage:imageCount1];
        [self.view addSubview:currentWeighImageView];
        
        goalWeighImageView=[[UIImageView alloc] initWithFrame:CGRectMake(165, 125, 150, 135)];
        [goalWeighImageView setImage:imageCount1];
        [self.view addSubview:goalWeighImageView];
        
        currentLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,135,130,50)];
        currentLabel.backgroundColor = [UIColor clearColor];
        currentLabel.text =@"Current \n Weight Class";
        currentLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [currentLabel setNumberOfLines:4];
        currentLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * font = [currentLabel.font.fontDescriptor
                                   fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                   | UIFontDescriptorTraitItalic];
        currentLabel.font = [UIFont fontWithDescriptor:font size:20];
        currentLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:currentLabel];
        
        currentWghtLbl = [[UILabel alloc] initWithFrame:CGRectMake(25,180,130,30)];
        currentWghtLbl.backgroundColor = [UIColor clearColor];
        currentWghtLbl.lineBreakMode = NSLineBreakByWordWrapping;
        [currentWghtLbl setNumberOfLines:4];
        currentWghtLbl.textColor=[UIColor whiteColor];
        UIFontDescriptor * font1 = [currentWghtLbl.font.fontDescriptor
                                   fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                   | UIFontDescriptorTraitItalic];
        currentWghtLbl.font = [UIFont fontWithDescriptor:font1 size:30];
        currentWghtLbl.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:currentWghtLbl];
        
        curwght = [[UILabel alloc] initWithFrame:CGRectMake(15,205,160,30)];
        curwght.backgroundColor = [UIColor clearColor];
        //curwght.text =@"WelterWeight";
        curwght.lineBreakMode = NSLineBreakByWordWrapping;
        [curwght setNumberOfLines:4];
        curwght.textColor=[UIColor whiteColor];
        UIFontDescriptor * font12 = [curwght.font.fontDescriptor
                                    fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                    | UIFontDescriptorTraitItalic];
        curwght.font = [UIFont fontWithDescriptor:font12 size:18];
        curwght.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:curwght];

        goalLabel = [[UILabel alloc] initWithFrame:CGRectMake(175,135,130,50)];
        goalLabel.backgroundColor = [UIColor clearColor];
        goalLabel.text=@"Goal \n Weight Class";
        goalLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fonts = [goalLabel.font.fontDescriptor
                                    fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                    | UIFontDescriptorTraitItalic];
        goalLabel.font = [UIFont fontWithDescriptor:fonts size:20];
        goalLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [goalLabel setNumberOfLines:4];
        goalLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:goalLabel];
        
        goalwghtLbl = [[UILabel alloc] initWithFrame:CGRectMake(193,183,130,30)];
        goalwghtLbl.backgroundColor = [UIColor clearColor];
        goalwghtLbl.textColor=[UIColor whiteColor];
        UIFontDescriptor * fontz = [goalwghtLbl.font.fontDescriptor
                                    fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                    | UIFontDescriptorTraitItalic];
        goalwghtLbl.font = [UIFont fontWithDescriptor:fontz size:30];
        goalwghtLbl.lineBreakMode = NSLineBreakByWordWrapping;
        [goalwghtLbl setNumberOfLines:4];
        [self.view addSubview:goalwghtLbl];

        goalwghts= [[UILabel alloc] initWithFrame:CGRectMake(170,205,160,30)];
        goalwghts.backgroundColor = [UIColor clearColor];
        //goalwghts.text =@"Light Weight";
        goalwghts.lineBreakMode = NSLineBreakByWordWrapping;
        [goalwghts setNumberOfLines:4];
        goalwghts.textColor=[UIColor whiteColor];
        UIFontDescriptor * font123 = [goalwghts.font.fontDescriptor
                                      fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                      | UIFontDescriptorTraitItalic];
        goalwghts.font = [UIFont fontWithDescriptor:font123 size:18];
        goalwghts.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:goalwghts];

        diffLabel = [[UILabel alloc] initWithFrame:CGRectMake(20,255,210,27)];
        diffLabel.backgroundColor = [UIColor clearColor];
        diffLabel.text=@"To Make Weight :-";
        diffLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fontss = [diffLabel.font.fontDescriptor
                                     fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                     | UIFontDescriptorTraitItalic];
        diffLabel.font = [UIFont fontWithDescriptor:fontss size:20];
         [self.view addSubview:diffLabel];
        
        diffwght = [[UILabel alloc] initWithFrame:CGRectMake(185,255,150,27)];
        diffwght.backgroundColor = [UIColor clearColor];
        diffwght.textColor=[UIColor whiteColor];
        UIFontDescriptor * fontss2 = [diffwght.font.fontDescriptor
                                     fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                     | UIFontDescriptorTraitItalic];
        diffwght.font = [UIFont fontWithDescriptor:fontss2 size:20];
        [self.view addSubview:diffwght];

        
        nextLabel = [[UILabel alloc] initWithFrame:CGRectMake(30,275,250,35)];
        nextLabel.backgroundColor = [UIColor clearColor];
        nextLabel.text=@"Next Weight In";
        nextLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fontsss = [nextLabel.font.fontDescriptor
                                      fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                      | UIFontDescriptorTraitItalic];
        nextLabel.font = [UIFont fontWithDescriptor:fontsss size:30];
        [self.view addSubview:nextLabel];
        
        dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(30,305,290,50)];
        dateLabel.backgroundColor = [UIColor clearColor];
        dateLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [dateLabel setNumberOfLines:0];
        dateLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fonta = [dateLabel.font.fontDescriptor
                                    fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                    | UIFontDescriptorTraitItalic];
        dateLabel.font = [UIFont fontWithDescriptor:fonta size:20];
        [self.view addSubview:dateLabel];
        
        UIImage *imagecount2 = [UIImage imageNamed: @"countdownbg.png"];
        coundownImageView1=[[UIImageView alloc] initWithFrame:CGRectMake(20,345,90,70)];
        [coundownImageView1 setImage:imagecount2];
        [self.view addSubview:coundownImageView1];
        
        countdownImageView2=[[UIImageView alloc] initWithFrame:CGRectMake(114,345,90,70)];
        [countdownImageView2 setImage:imagecount2];
        [self.view addSubview:countdownImageView2];
        
        countdownImageView3=[[UIImageView alloc] initWithFrame:CGRectMake(219,345,90,70)];
        [countdownImageView3 setImage:imagecount2];
        [self.view addSubview:countdownImageView3];
        
        dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(55,362,40,25)];
        dayLabel.backgroundColor = [UIColor clearColor];
        //dayLabel.text=@"20";
        dayLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fontaa = [dayLabel.font.fontDescriptor
                                     fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                     | UIFontDescriptorTraitItalic];
        dayLabel.font = [UIFont fontWithDescriptor:fontaa size:25];
        [self.view addSubview:dayLabel];
        
        hourLabel = [[UILabel alloc] initWithFrame:CGRectMake(145,362,200,25)];
        hourLabel.backgroundColor = [UIColor clearColor];
        //hourLabel.text=@"13";
        hourLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fontt = [hourLabel.font.fontDescriptor
                                    fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                    | UIFontDescriptorTraitItalic];
        hourLabel.font = [UIFont fontWithDescriptor:fontt size:25];
        [self.view addSubview:hourLabel];
        
        minLabel = [[UILabel alloc] initWithFrame:CGRectMake(250,362,40,25)];
        minLabel.backgroundColor = [UIColor clearColor];
        //minLabel.text=@"30";
        minLabel.textColor=[UIColor whiteColor];
       
        UIFontDescriptor * fonttt = [minLabel.font.fontDescriptor
                                     fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                     | UIFontDescriptorTraitItalic];
        minLabel.font = [UIFont fontWithDescriptor:fonttt size:25];
                [self.view addSubview:minLabel];
        
        timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(30,410,291,25)];
        timeLabel.backgroundColor = [UIColor clearColor];
        timeLabel.text=@"Days     Hours     Mintues";
        timeLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fontd = [timeLabel.font.fontDescriptor
                                    fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                    | UIFontDescriptorTraitItalic];
        timeLabel.font = [UIFont fontWithDescriptor:fontd size:23];

        [self.view addSubview:timeLabel];
        
        updateButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [updateButton addTarget:self action:@selector(goToUpdate)forControlEvents:UIControlEventTouchUpInside];
        updateButton.frame = CGRectMake(30,440,130,40);
        [updateButton setBackgroundImage: [UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
        [updateButton setTitle:@"UPDATE" forState:UIControlStateNormal];
        [updateButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        updateButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
        [self.view addSubview:updateButton];
        
        workoutButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [workoutButton addTarget:self action:@selector(goToWorkout)forControlEvents:UIControlEventTouchUpInside];
        workoutButton.frame = CGRectMake(175,440,120,40);
        [workoutButton setBackgroundImage: [UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
        [workoutButton setTitle:@"TRAINING" forState:UIControlStateNormal];
        [workoutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        workoutButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
        [self.view addSubview:workoutButton];
        
        cotchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [cotchBtn addTarget:self action:@selector(cotchingAction)forControlEvents:UIControlEventTouchUpInside];
        cotchBtn.frame = CGRectMake(30,485,130,40);
        [cotchBtn setBackgroundImage: [UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
        [cotchBtn setTitle:@"COACHING" forState:UIControlStateNormal];
        [cotchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        cotchBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
        [self.view addSubview:cotchBtn];
        
        userList = [UIButton buttonWithType:UIButtonTypeCustom];
        [userList addTarget:self action:@selector(userlistAction)forControlEvents:UIControlEventTouchUpInside];
        userList.frame = CGRectMake(175,485,120,40);
        [userList setBackgroundImage: [UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
        [userList setTitle:@"THE CARD" forState:UIControlStateNormal];
        [userList setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        userList.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
        [self.view addSubview:userList];
        
        faceBookBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [faceBookBtn addTarget:self action:@selector(facebookAction)forControlEvents:UIControlEventTouchUpInside];
        faceBookBtn.frame = CGRectMake(115,527,40,40);
        [faceBookBtn setBackgroundImage: [UIImage imageNamed:@"facebook.png"] forState:UIControlStateNormal];
        //[faceBookBtn setTitle:@"COTCHING" forState:UIControlStateNormal];
        [faceBookBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        faceBookBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
        [self.view addSubview:faceBookBtn];
        
        twitterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [twitterBtn addTarget:self action:@selector(twitterAction)forControlEvents:UIControlEventTouchUpInside];
        twitterBtn.frame = CGRectMake(175,527,40,40);
        [twitterBtn setBackgroundImage: [UIImage imageNamed:@"twitter.png"] forState:UIControlStateNormal];
        //[twitterBtn setTitle:@"USER LIST" forState:UIControlStateNormal];
        [twitterBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        twitterBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
        [self.view addSubview:twitterBtn];


    }else{
        [[UIImage imageNamed:@"bg1.png"] drawInRect:self.view.bounds];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        self.view.backgroundColor = [UIColor colorWithPatternImage:image];
        fanImageView=[[UIImageView alloc] initWithFrame:CGRectMake(5,5,320,100)];
        
        UIImage *imageFan = [UIImage imageNamed: @"fanweighinlogo.png"];
        [fanImageView setImage:imageFan];
        [self.view addSubview:fanImageView];
        
        nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(23,105,130,21)];
        nameLabel.backgroundColor = [UIColor clearColor];
        nameLabel.text=@"What's Up";
        nameLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fon = [nameLabel.font.fontDescriptor
                                  fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                  | UIFontDescriptorTraitItalic];
        nameLabel.font = [UIFont fontWithDescriptor:fon size:20];
        [self.view addSubview:nameLabel];
        
        displaynameLbl = [[UILabel alloc] initWithFrame:CGRectMake(135,102,152,24)];
        displaynameLbl.backgroundColor = [UIColor clearColor];
        displaynameLbl.textColor=[UIColor whiteColor];
        displaynameLbl.text=[prefsusername objectForKey:@"name"];
        UIFontDescriptor * fona = [displaynameLbl.font.fontDescriptor
                                   fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                   | UIFontDescriptorTraitItalic];
        displaynameLbl.font = [UIFont fontWithDescriptor:fona size:24];
        [self.view addSubview:displaynameLbl];

        
        UIImage *imageCount1 = [UIImage imageNamed: @"weightclassbg.png"];
        currentWeighImageView=[[UIImageView alloc] initWithFrame:CGRectMake(15,125,160,145)];
        [currentWeighImageView setImage:imageCount1];
        [self.view addSubview:currentWeighImageView];
        
        goalWeighImageView=[[UIImageView alloc] initWithFrame:CGRectMake(180, 125, 160, 145)];
        [goalWeighImageView setImage:imageCount1];
        [self.view addSubview:goalWeighImageView];
        
        currentLabel = [[UILabel alloc] initWithFrame:CGRectMake(33,120,130,85)];
        currentLabel.backgroundColor = [UIColor clearColor];
        currentLabel.text =@"Current \n Weight Class";
        currentLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [currentLabel setNumberOfLines:4];
        currentLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * font = [currentLabel.font.fontDescriptor
                                   fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                   | UIFontDescriptorTraitItalic];
        currentLabel.font = [UIFont fontWithDescriptor:font size:20];
        currentLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:currentLabel];
        
        currentWghtLbl = [[UILabel alloc] initWithFrame:CGRectMake(25,185,130,30)];
        currentWghtLbl.backgroundColor = [UIColor clearColor];
        currentWghtLbl.lineBreakMode = NSLineBreakByWordWrapping;
        [currentWghtLbl setNumberOfLines:4];
        currentWghtLbl.textColor=[UIColor whiteColor];
        UIFontDescriptor * font1 = [currentWghtLbl.font.fontDescriptor
                                    fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                    | UIFontDescriptorTraitItalic];
        currentWghtLbl.font = [UIFont fontWithDescriptor:font1 size:30];
        currentWghtLbl.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:currentWghtLbl];
        
        curwght = [[UILabel alloc] initWithFrame:CGRectMake(35,210,130,30)];
        curwght.backgroundColor = [UIColor clearColor];
        //curwght.text =@"Welter Weight";
        curwght.lineBreakMode = NSLineBreakByWordWrapping;
        [curwght setNumberOfLines:4];
        curwght.textColor=[UIColor whiteColor];
        UIFontDescriptor * font12 = [curwght.font.fontDescriptor
                                     fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                     | UIFontDescriptorTraitItalic];
        curwght.font = [UIFont fontWithDescriptor:font12 size:20];
        curwght.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:curwght];
        
        goalLabel = [[UILabel alloc] initWithFrame:CGRectMake(195,120,130,85)];
        goalLabel.backgroundColor = [UIColor clearColor];
        goalLabel.text=@"Goal \n Weight Class";
        goalLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fonts = [goalLabel.font.fontDescriptor
                                    fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                    | UIFontDescriptorTraitItalic];
        goalLabel.font = [UIFont fontWithDescriptor:fonts size:20];
        goalLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [goalLabel setNumberOfLines:4];
        goalLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:goalLabel];
        
        goalwghtLbl = [[UILabel alloc] initWithFrame:CGRectMake(215,195,130,30)];
        goalwghtLbl.backgroundColor = [UIColor clearColor];
        goalwghtLbl.textColor=[UIColor whiteColor];
        UIFontDescriptor * fontz = [goalwghtLbl.font.fontDescriptor
                                    fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                    | UIFontDescriptorTraitItalic];
        goalwghtLbl.font = [UIFont fontWithDescriptor:fontz size:30];
        goalwghtLbl.lineBreakMode = NSLineBreakByWordWrapping;
        [goalwghtLbl setNumberOfLines:4];
        [self.view addSubview:goalwghtLbl];
        
        goalwghts= [[UILabel alloc] initWithFrame:CGRectMake(200,215,130,30)];
        goalwghts.backgroundColor = [UIColor clearColor];
        //goalwghts.text =@"Light Weight";
        goalwghts.lineBreakMode = NSLineBreakByWordWrapping;
        [goalwghts setNumberOfLines:4];
        goalwghts.textColor=[UIColor whiteColor];
        UIFontDescriptor * font123 = [goalwghts.font.fontDescriptor
                                      fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                      | UIFontDescriptorTraitItalic];
        goalwghts.font = [UIFont fontWithDescriptor:font123 size:20];
        [self.view addSubview:goalwghts];
        
        diffLabel = [[UILabel alloc] initWithFrame:CGRectMake(30,275,240,30)];
        diffLabel.backgroundColor = [UIColor clearColor];
        diffLabel.text=@"To Make Weight :-";
        diffLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fontss = [diffLabel.font.fontDescriptor
                                     fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                     | UIFontDescriptorTraitItalic];
        diffLabel.font = [UIFont fontWithDescriptor:fontss size:23];
        [self.view addSubview:diffLabel];
        
        diffwght = [[UILabel alloc] initWithFrame:CGRectMake(220,275,140,30)];
        diffwght.backgroundColor = [UIColor clearColor];
        diffwght.textColor=[UIColor whiteColor];
        UIFontDescriptor * fontss2 = [diffwght.font.fontDescriptor
                                      fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                      | UIFontDescriptorTraitItalic];
        diffwght.font = [UIFont fontWithDescriptor:fontss2 size:23];
        [self.view addSubview:diffwght];
        
        nextLabel = [[UILabel alloc] initWithFrame:CGRectMake(30,315,250,35)];
        nextLabel.backgroundColor = [UIColor clearColor];
        nextLabel.text=@"Next Weight In";
        nextLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fontsss = [nextLabel.font.fontDescriptor
                                     fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                     | UIFontDescriptorTraitItalic];
        nextLabel.font = [UIFont fontWithDescriptor:fontsss size:35];
        [self.view addSubview:nextLabel];
        
        dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,353,360,25)];
        dateLabel.backgroundColor = [UIColor clearColor];
        //dateLabel.text=@"UFC 191-";
        dateLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fonta = [dateLabel.font.fontDescriptor
                                      fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                      | UIFontDescriptorTraitItalic];
        dateLabel.font = [UIFont fontWithDescriptor:fonta size:16];
        [self.view addSubview:dateLabel];
        
        UIImage *imagecount2 = [UIImage imageNamed: @"countdownbg.png"];
        coundownImageView1=[[UIImageView alloc] initWithFrame:CGRectMake(20,390,90,70)];
        [coundownImageView1 setImage:imagecount2];
        [self.view addSubview:coundownImageView1];
        
        countdownImageView2=[[UIImageView alloc] initWithFrame:CGRectMake(130,390,90,70)];
        [countdownImageView2 setImage:imagecount2];
        [self.view addSubview:countdownImageView2];
        
        countdownImageView3=[[UIImageView alloc] initWithFrame:CGRectMake(235,390,90,70)];
        [countdownImageView3 setImage:imagecount2];
        [self.view addSubview:countdownImageView3];
        
        dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(55,410,40,25)];
        dayLabel.backgroundColor = [UIColor clearColor];
        //dayLabel.text=@"20";
        dayLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fontaa = [dayLabel.font.fontDescriptor
                                    fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                    | UIFontDescriptorTraitItalic];
        dayLabel.font = [UIFont fontWithDescriptor:fontaa size:30];
        [self.view addSubview:dayLabel];
        
        hourLabel = [[UILabel alloc] initWithFrame:CGRectMake(160,410,40,25)];
        hourLabel.backgroundColor = [UIColor clearColor];
        //hourLabel.text=@"13";
        hourLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fontt = [hourLabel.font.fontDescriptor
                                     fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                     | UIFontDescriptorTraitItalic];
        hourLabel.font = [UIFont fontWithDescriptor:fontt size:30];
        [self.view addSubview:hourLabel];
        
        minLabel = [[UILabel alloc] initWithFrame:CGRectMake(265,410,40,25)];
        minLabel.backgroundColor = [UIColor clearColor];
       // minLabel.text=@"30";
        minLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fonttt = [minLabel.font.fontDescriptor
                                    fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                    | UIFontDescriptorTraitItalic];
        minLabel.font = [UIFont fontWithDescriptor:fonttt size:30];

        [self.view addSubview:minLabel];
        
        timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(30,480,300,25)];
        timeLabel.backgroundColor = [UIColor clearColor];
        timeLabel.text=@"Days     Hours     Mintues";
        timeLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fontd = [timeLabel.font.fontDescriptor
                                     fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                     | UIFontDescriptorTraitItalic];
        timeLabel.font = [UIFont fontWithDescriptor:fontd size:25];
        [self.view addSubview:timeLabel];
        
        updateButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [updateButton addTarget:self action:@selector(goToUpdate)forControlEvents:UIControlEventTouchUpInside];
        updateButton.frame = CGRectMake(30,515,130,40);
        [updateButton setBackgroundImage: [UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
        [updateButton setTitle:@"UPDATE" forState:UIControlStateNormal];
        [updateButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        updateButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
        [self.view addSubview:updateButton];
        
        workoutButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [workoutButton addTarget:self action:@selector(goToWorkout)forControlEvents:UIControlEventTouchUpInside];
        workoutButton.frame = CGRectMake(195,515,130,40);
        [workoutButton setBackgroundImage: [UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
        [workoutButton setTitle:@"TRAINING" forState:UIControlStateNormal];
        [workoutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        workoutButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
        [self.view addSubview:workoutButton];
        
        cotchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [cotchBtn addTarget:self action:@selector(cotchingAction)forControlEvents:UIControlEventTouchUpInside];
        cotchBtn.frame = CGRectMake(30,575,130,40);
        [cotchBtn setBackgroundImage: [UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
        [cotchBtn setTitle:@"COACHING" forState:UIControlStateNormal];
        [cotchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        cotchBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
        [self.view addSubview:cotchBtn];
        
        userList = [UIButton buttonWithType:UIButtonTypeCustom];
        [userList addTarget:self action:@selector(userlistAction)forControlEvents:UIControlEventTouchUpInside];
        userList.frame = CGRectMake(195,575,120,40);
        [userList setBackgroundImage: [UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
        [userList setTitle:@"THE CARD" forState:UIControlStateNormal];
        [userList setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        userList.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
        [self.view addSubview:userList];
        
        twitterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [twitterBtn addTarget:self action:@selector(twitterAction)forControlEvents:UIControlEventTouchUpInside];
        twitterBtn.frame = CGRectMake(195,620,40,40);
        [twitterBtn setBackgroundImage: [UIImage imageNamed:@"twitter.png"] forState:UIControlStateNormal];
        //[twitterBtn setTitle:@"USER LIST" forState:UIControlStateNormal];
        [twitterBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        twitterBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
        [self.view addSubview:twitterBtn];
        
        faceBookBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [faceBookBtn addTarget:self action:@selector(facebookAction)forControlEvents:UIControlEventTouchUpInside];
        faceBookBtn.frame = CGRectMake(115,620,40,40);
        [faceBookBtn setBackgroundImage: [UIImage imageNamed:@"facebook.png"] forState:UIControlStateNormal];
        //[faceBookBtn setTitle:@"COTCHING" forState:UIControlStateNormal];
        [faceBookBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        faceBookBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
        [self.view addSubview:faceBookBtn];


    }
    }
    [self.view addSubview:activityIndicator];
    [self.view bringSubviewToFront:activityIndicator];
}

- (void) threadStartAnimating:(id)data {
    [activityIndicator startAnimating];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat yzheight = [UIScreen mainScreen].bounds.size.height;
    activityIndicator.center = CGPointMake(width / 2.0,yzheight/ 2.0);
}

-(void)viewDidAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=YES;

    [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
    NSUserDefaults *prefscutwght = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *prefsgolwght = [NSUserDefaults standardUserDefaults];
    curwghts=[prefscutwght objectForKey:@"currentweight"];
    NSString *curtlbs = @"lbs";
    NSString *lastCharcurwght = [curwghts substringFromIndex:[curwghts length] - 1];
    curtdftvalue = [NSString stringWithFormat:@"%@%@",
                    curwghts,
                    curtlbs];
    currentWghtLbl.text=curtdftvalue;
    goalwght=[prefsgolwght objectForKey:@"goalweight"];
    NSArray* foo = [goalwght componentsSeparatedByString: @"-"];
    NSArray* fooss = [goalwght componentsSeparatedByString: @" "];
    NSString* firstBit = [foo objectAtIndex:[foo count]-1];
     NSString* firstBits = [fooss objectAtIndex:[foo count]-1];
    NSArray* difarr = [firstBits componentsSeparatedByString: @"-"];
    NSString* firstBitd = [difarr objectAtIndex:[foo count]-2];

    NSString *lastChargoalwght = [firstBit substringFromIndex:[firstBit length] - 1];
    NSString *wiglblstr= [fooss objectAtIndex:[foo count]-2];
    NSString *goallbs = @"lbs";
    NSString *texts = [NSString stringWithFormat:@"%@%@",
                       firstBit,
                       goallbs];
    goalwghtLbl.text=texts;
    goalwghts.text =wiglblstr;
   
    int valuecut = [curwghts intValue];
    int valuegoal = [firstBit intValue];
    int values=valuecut-valuegoal;
    NSString* myNewString = [NSString stringWithFormat:@"%i", values];
    NSArray* foos = [myNewString componentsSeparatedByString: @"-"];
    NSString* finalStr = [foos objectAtIndex:[foos count]-1];
    NSString *redText = @"lbs";
    NSString *text = [NSString stringWithFormat:@"%@%@",
                      finalStr,
                      redText];
    int dif1 = [curwghts intValue];
    int dif2 = [firstBitd intValue];
    int dif3 = [curwghts intValue];
    int dif4 = [firstBit intValue];
    
    if(dif1>=dif2 && dif3<=dif4) {
        diffwght.text=@"Weight made";
        curwght.text =wiglblstr;

    }else{
        curwght.text =@"";
    diffwght.text=text;
    }
    [self getDatefuction];
    [activityIndicator stopAnimating];


timer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(DateFunction) userInfo:nil repeats: YES];
}
-(void)getDatefuction{
    Reachability *myNetwork = [Reachability reachabilityWithHostname:@"google.com"];
    NetworkStatus myStatus = [myNetwork currentReachabilityStatus];
    if(myStatus == NotReachable)
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"No internet connection available!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [activityIndicator stopAnimating];
    }else{

    NSString *urlString = [[NSString alloc]initWithFormat:@"http://millionairesorg.com/fanweighin/nextweighindate.php"];
    NSData *mydata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    NSString *content = [[NSString alloc]  initWithBytes:[mydata bytes]
                                                  length:[mydata length] encoding: NSUTF8StringEncoding];
    DateContentStr=[[NSString alloc]init];
    DateContentStr=content;
    }
}
-(void)DateFunction{
       //NSString* string2 = [content stringByReplacingOccurrencesOfString:@"/" withString:@"-"];
    if (![DateContentStr isEqualToString:@""]) {
        NSArray* foos = [DateContentStr componentsSeparatedByString: @"#"];
        NSString* finalStr = [foos objectAtIndex:[foos count]-2];
        dateStr=[[NSString alloc] initWithString:finalStr];
        finalStr=[finalStr stringByAppendingString:@" 12:00AM"];
        NSString *txtStr=[[NSString alloc]init];
        txtStr=[foos objectAtIndex:[foos count]-1];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"MM-dd-yyyy HH:mma";
        NSDate *facebookdate = [formatter dateFromString:[finalStr stringByReplacingOccurrencesOfString:@"\/" withString:@"-"]];
        NSDate *today=[formatter dateFromString:[formatter stringFromDate:[NSDate date]]];
        
        long seconds= [self timeDifference:today ToDate:facebookdate];
        if (0<=seconds) {
            long diffinsec=seconds%60;
            diffinsec=seconds/60;
            long minutes=diffinsec%60;
            diffinsec=diffinsec/60;
            long hours=diffinsec%24;
            diffinsec=diffinsec/24;
            long days=diffinsec;
            
            hourLabel.text=[NSString stringWithFormat:@"%ld",hours];
            dayLabel.text=[NSString stringWithFormat:@"%ld",days];
            minLabel.text=[NSString stringWithFormat:@"%ld",minutes];
            
        }else{
            //[timer invalidate];
            hourLabel.text=@"00";
            dayLabel.text=@"00";
            minLabel.text=@"00";
        }
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"MM/dd/yyyy"];
        NSDate *date = [dateFormat dateFromString:dateStr];
        
        // Convert date object to desired output format
        [dateFormat setDateFormat:@"MMM dd, YYYY"];
        dateStr = [dateFormat stringFromDate:date];
        
        NSString *text1 = [NSString stringWithFormat:@"%@ %@ %@",
                           txtStr,@"-",
                           dateStr];
        dateLabel.text=text1;

    }else{
        hourLabel.text=@"00";
        dayLabel.text=@"00";
        minLabel.text=@"00";
    }
   }

- (int)timeDifference:(NSDate *)fromDate ToDate:(NSDate *)toDate{
    NSTimeInterval distanceBetweenDates = [toDate timeIntervalSinceDate:fromDate];
    
    return distanceBetweenDates;
}
-(void)goToUpdate{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        updateViewController =[[UpdateViewController alloc]initWithNibName:@"UpdateViewController~ipad" bundle:nil];
        [self.navigationController pushViewController:updateViewController animated:YES];

    }else{
        updateViewController =[[UpdateViewController alloc]initWithNibName:@"UpdateViewController" bundle:nil];
        [self.navigationController pushViewController:updateViewController animated:YES];

    }
}
-(IBAction)goToUpdates{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        updateViewController =[[UpdateViewController alloc]initWithNibName:@"UpdateViewController~ipad" bundle:nil];
        [self.navigationController pushViewController:updateViewController animated:YES];

    }else{
        updateViewController =[[UpdateViewController alloc]initWithNibName:@"UpdateViewController" bundle:nil];
        [self.navigationController pushViewController:updateViewController animated:YES];

    }
}

-(IBAction)cotchingActions{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        CotchingViewController *cotching=[[CotchingViewController alloc] initWithNibName:@"CotchingViewController~ipad" bundle:nil];
        [self.navigationController pushViewController:cotching animated:YES];
    }
    else{
        CotchingViewController *cotching=[[CotchingViewController alloc] initWithNibName:@"CotchingViewController" bundle:nil];
        [self.navigationController pushViewController:cotching animated:YES];
    }
   
}
-(IBAction)userlistActions{
    
    UserLIstViewController *userlistvc=[[UserLIstViewController alloc] initWithNibName:@"UserLIstViewController" bundle:nil];
    [self.navigationController pushViewController:userlistvc animated:YES];

}
-(IBAction)goToWorkouts{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
    workViewController =[[WorkoutViewController alloc]initWithNibName:@"WorkoutViewController~ipad" bundle:nil];
    [self.navigationController pushViewController:workViewController animated:YES];
    }
    else{
        workViewController =[[WorkoutViewController alloc]initWithNibName:@"WorkoutViewController" bundle:nil];
        [self.navigationController pushViewController:workViewController animated:YES];
  
    }
}
-(void)cotchingAction{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
    CotchingViewController *cotching=[[CotchingViewController alloc] initWithNibName:@"CotchingViewController~ipad" bundle:nil];
    [self.navigationController pushViewController:cotching animated:YES];
    }else{
        CotchingViewController *cotching=[[CotchingViewController alloc] initWithNibName:@"CotchingViewController" bundle:nil];
        [self.navigationController pushViewController:cotching animated:YES];
    }
}
-(void)userlistAction{
    UserLIstViewController *userlistvc=[[UserLIstViewController alloc] initWithNibName:@"UserLIstViewController" bundle:nil];
    [self.navigationController pushViewController:userlistvc animated:YES];
}
-(void)goToWorkout{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
    workViewController =[[WorkoutViewController alloc]initWithNibName:@"WorkoutViewController~ipad" bundle:nil];
    [self.navigationController pushViewController:workViewController animated:YES];
    }else{
        workViewController =[[WorkoutViewController alloc]initWithNibName:@"WorkoutViewController" bundle:nil];
        [self.navigationController pushViewController:workViewController animated:YES];

    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)facebookAction{
    NSUserDefaults *prefsusername = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *prefscutwght = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *prefsgolwght = [NSUserDefaults standardUserDefaults];
    name=[prefsusername objectForKey:@"name"];
    curwghts=[prefscutwght objectForKey:@"currentweight"];
    goalwght=[prefsgolwght objectForKey:@"goalweight"];
    NSArray* foo = [goalwght componentsSeparatedByString: @"-"];
    NSArray* fooss = [goalwght componentsSeparatedByString: @" "];
    NSString* firstBit = [foo objectAtIndex:[foo count]-1];
    NSString* firstBits = [fooss objectAtIndex:[foo count]-1];
    NSArray* difarr = [firstBits componentsSeparatedByString: @"-"];
    NSString* firstBitd = [difarr objectAtIndex:[foo count]-2];
    
    NSString *lastChargoalwght = [firstBit substringFromIndex:[firstBit length] - 1];
    NSString *wiglblstr= [fooss objectAtIndex:[foo count]-2];
    NSString *goallbs = @"lbs";
    NSString *texts = [NSString stringWithFormat:@"%@%@",
                       firstBit,
                       goallbs];
    
    int valuecut = [curwghts intValue];
    int valuegoal = [firstBit intValue];
    int values=valuecut-valuegoal;
    NSString* myNewString = [NSString stringWithFormat:@"%i", values];
    NSArray* foos = [myNewString componentsSeparatedByString: @"-"];
    NSString* finalStr = [foos objectAtIndex:[foos count]-1];
    NSString *redText = @"lbs";
    NSString *text = [NSString stringWithFormat:@"%@%@",
                      finalStr,
                      redText];
    int dif1 = [curwghts intValue];
    int dif2 = [firstBitd intValue];
    int dif3 = [curwghts intValue];
    int dif4 = [firstBit intValue];
    NSString *tweet = [[NSString alloc]init];
    if(dif1>=dif2 && dif3<=dif4) {
        tweet = [NSString stringWithFormat:@"Name:-%@ \n Current Weight:-%@ %@ \n Goal Weight:-%@ \n Sent from FANWeigh-In",name,curwghts,wiglblstr,goalwght];
    }else{
        tweet = [NSString stringWithFormat:@"Name:-%@ \n Current Weight:-%@ \n Goal Weight:-%@ \n Sent from FANWeigh-In",name,curwghts,goalwght];
    }
    
    NSMutableDictionary* params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   @"Fan Weigh In", @"name",
                                   @"http://fanweighin.com/", @"link",
                                   @"", @"caption",
                                   tweet, @"description",
                                   tweet, @"message",
                                   @"http://millionairesorg.com/fanweighin/images/iconfwi180.png",@"picture",
                                   nil];
    [self postToWall:params];
}

-(void) postToWall: (NSMutableDictionary*) params
{
    NSString *facebookID=[[NSUserDefaults standardUserDefaults] stringForKey:@"facebookid"];
    if(facebookID==nil || [facebookID isEqualToString:@""]){
        NSArray *permissions = @[@"user_location",@"email"];
        [FBSession openActiveSessionWithReadPermissions:permissions
                                           allowLoginUI:YES
                                      completionHandler:^(FBSession *session,
                                                          FBSessionState state,
                                                          NSError *error){
                                          if (error) {
                                              NSLog(@"ERROR %@", error.description);
                                          }else if (session.isOpen) {
                                                [FBSession setActiveSession:session];
                                              [FBWebDialogs presentFeedDialogModallyWithSession:nil
                                                                                     parameters:params
                                                                                        handler:
                                               ^(FBWebDialogResult result, NSURL *resultURL, NSError *error) {
                                                   if (error) {
                                                       NSLog(@"Error publishing story.");
                                                   } else {
                                                       if (result == FBWebDialogResultDialogNotCompleted) {
                                                           NSLog(@"User canceled story publishing.");
                                                       } else {
                                                           NSLog(@"Story published.");
                                                       }
                                                   }}];
                                          }
                                      }];
    }
}
-(void)facebookWall: (NSMutableDictionary*) params{
    [[FBSession activeSession] reauthorizeWithPublishPermissions:[NSArray arrayWithObjects:@"publish_actions",@"publish_stream",@"manage_friendlists", nil] defaultAudience:FBSessionDefaultAudienceFriends
                                               completionHandler:^(FBSession *session, NSError *error) {                                        if (!error){
                                            
                                            [FBRequestConnection startWithGraphPath:@"me/feed"
                                                                         parameters:params
                                                                         HTTPMethod:@"POST"
                                                                  completionHandler:^(
                                                                                      FBRequestConnection *connection,
                                                                                      id result,
                                                                                      NSError *error
                                                                                      ) {
                                                                      if(!error){
                                                                          NSLog(@"result %@",result);
                                                                          [activityIndicator stopAnimating];
                                                                          
                                                                      }
                                                                      else{
                                                                          NSLog(@"error %@",error);
                                                                          [activityIndicator stopAnimating];
                                                                      }
                                                                  }];
                                            
                                            
                                            
                                            
                                        }
                                    }];

}
-(IBAction)twitterAction{
    NSUserDefaults *prefsusername = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *prefscutwght = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *prefsgolwght = [NSUserDefaults standardUserDefaults];
    name=[prefsusername objectForKey:@"name"];
    curwghts=[prefscutwght objectForKey:@"currentweight"];
    goalwght=[prefsgolwght objectForKey:@"goalweight"];
    NSArray* foo = [goalwght componentsSeparatedByString: @"-"];
    NSArray* fooss = [goalwght componentsSeparatedByString: @" "];
    NSString* firstBit = [foo objectAtIndex:[foo count]-1];
    NSString* firstBits = [fooss objectAtIndex:[foo count]-1];
    NSArray* difarr = [firstBits componentsSeparatedByString: @"-"];
    NSString* firstBitd = [difarr objectAtIndex:[foo count]-2];
    
    NSString *lastChargoalwght = [firstBit substringFromIndex:[firstBit length] - 1];
    NSString *wiglblstr= [fooss objectAtIndex:[foo count]-2];
    NSString *goallbs = @"lbs";
    NSString *texts = [NSString stringWithFormat:@"%@%@",
                       firstBit,
                       goallbs];
    
    int valuecut = [curwghts intValue];
    int valuegoal = [firstBit intValue];
    int values=valuecut-valuegoal;
    NSString* myNewString = [NSString stringWithFormat:@"%i", values];
    NSArray* foos = [myNewString componentsSeparatedByString: @"-"];
    NSString* finalStr = [foos objectAtIndex:[foos count]-1];
    NSString *redText = @"lbs";
    NSString *text = [NSString stringWithFormat:@"%@%@",
                      finalStr,
                      redText];
    int dif1 = [curwghts intValue];
    int dif2 = [firstBitd intValue];
    int dif3 = [curwghts intValue];
    int dif4 = [firstBit intValue];
    NSString *tweet = [[NSString alloc]init];
    if(dif1>=dif2 && dif3<=dif4) {
        
        tweet = [NSString stringWithFormat:@"Name:-%@ Current Weight:-%@ %@ Goal Weight:-%@ Sent from FANWeigh-In",name,curwghts,wiglblstr,goalwght];
    }else{
        tweet = [NSString stringWithFormat:@"Name:-%@ Current Weight:-%@ Goal Weight:-%@ Sent from FANWeigh-In",name,curwghts,goalwght];
    }
    NSString *myString=[[NSString alloc]init];
    myString=[tweet stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
    NSURL *postURL = [NSURL URLWithString:[NSString stringWithFormat:@"twitter://post?message=%@",myString]];
    if ([[UIApplication sharedApplication] canOpenURL:postURL]) {
        [[UIApplication sharedApplication] openURL:postURL];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
