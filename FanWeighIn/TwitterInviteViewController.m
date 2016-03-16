//
//  TwitterInviteViewController.m
//  FirstPlay
//
//  Created by mansoor shaikh on 06/06/14.
//  Copyright (c) 2014 MobiWebCode. All rights reserved.
//

#import "TwitterInviteViewController.h"

@class GADBannerView;
@interface TwitterInviteViewController ()

@end

@implementation TwitterInviteViewController
@synthesize appDelegate,selectedFriendNames,goalwght,curwghts,dateStr,curtdftvalue,DateContentStr,name;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)popViewController{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=NO;

    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
  
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [titleLabel setFrame:CGRectMake(30, 0, 110, 35)];
    [titleLabel setText:@"Invite A Friends"];
    
    titleLabel.font =[UIFont systemFontOfSize:18];
    self.navigationItem.titleView = titleLabel;

    // Do any additional setup after loading the view from its nib.
    appDelegate=(AppDelegate*)[[UIApplication sharedApplication] delegate];
}

-(IBAction)inviteFriends{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @autoreleasepool {
            [[FHSTwitterEngine sharedEngine]permanentlySetConsumerKey:@"PL1hfUff3AywZfSXyimHeb6QI" andSecret:@"x7O5IKSvMdcVOQrOddX58IKXgt5PE9xpEPj3S8xLyBbCHVbbcU"];
            [[FHSTwitterEngine sharedEngine]setDelegate:self];
            [[FHSTwitterEngine sharedEngine]loadAccessToken];
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
                
                tweet = [NSString stringWithFormat:@"Name:-%@\nCurrent Weight:-%@ %@\nGoal Weight:-%@\n Sent from FANWeigh-In",name,curwghts,wiglblstr,goalwght];
            }else{
                tweet = [NSString stringWithFormat:@"Name:-%@\nCurrent Weight:-%@\nGoal Weight:-%@\n Sent from FANWeigh-In",name,curwghts,goalwght];
            }
            
           
            id returned = [[FHSTwitterEngine sharedEngine]postTweet:tweet];
            
            NSString *title = nil;
            NSString *message = nil;
            
            if ([returned isKindOfClass:[NSError class]]) {
                NSError *error = (NSError *)returned;
                title = [NSString stringWithFormat:@"Error %d",error.code];
                message = error.localizedDescription;
            } else {
                NSLog(@"%@",returned);
                title = @"Tweet Posted";
                message = tweet;
            }
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                @autoreleasepool {
                    UIAlertView *av = [[UIAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [av show];
                }
            });
        }
    });
}

#pragma marl - UITableView Data Source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [appDelegate.twitterUsersList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        [tableView reloadData];
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        selectedFriendNames=[[NSMutableArray alloc] init];
        [selectedFriendNames addObject:[appDelegate.twitterFriendsArray objectAtIndex:indexPath.row]];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellIdentifier = @"Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSInteger row = indexPath.row;
	if (nil == cell)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
	}
    cell.accessoryType=UITableViewCellAccessoryNone;
    cell.textLabel.textColor=[UIColor blackColor];
    cell.textLabel.text=[appDelegate.twitterUsersList objectAtIndex:indexPath.row];
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
