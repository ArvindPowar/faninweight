//
//  InviteFriendsViewController.m
//  FirstPlay
//
//  Created by mansoor shaikh on 05/06/14.
//  Copyright (c) 2014 MobiWebCode. All rights reserved.
//

#import "InviteFriendsViewController.h"
#import <Twitter/Twitter.h>
//#import <FacebookSDK/FacebookSDK.h>
#import "TwitterInviteViewController.h"
//#import "facebookSDk/FBWebDialogs.h"

#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@class GADBannerView;
@interface InviteFriendsViewController ()
@property (nonatomic, strong) ABPeoplePickerNavigationController *addressBookController;

@end

@implementation InviteFriendsViewController
@synthesize tblview,optionsArray,appDelegate,myAccount,firstName,lastName,number;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [titleLabel setFrame:CGRectMake(30, 0, 110, 35)];
    [titleLabel setText:@"Invite A Friends"];
    
    titleLabel.font =[UIFont systemFontOfSize:18];
    self.navigationItem.titleView = titleLabel;

    appDelegate=(AppDelegate*)[[UIApplication sharedApplication] delegate];
    optionsArray=[[NSMutableArray alloc] initWithObjects:@"Invite with Facebook",@"Invite with Twitter",@"Via sms", nil];
    

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)popViewController{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)twitterInvite{
    if([appDelegate.twitterUsersList count]>0){
        appDelegate.loginMethod=@"twitter";
        TwitterInviteViewController *twitterinvite=[[TwitterInviteViewController alloc] initWithNibName:@"TwitterInviteViewController" bundle:nil];
        [self.navigationController pushViewController:twitterinvite animated:YES];
    }else{
        [[FHSTwitterEngine sharedEngine]permanentlySetConsumerKey:@"PL1hfUff3AywZfSXyimHeb6QI" andSecret:@"x7O5IKSvMdcVOQrOddX58IKXgt5PE9xpEPj3S8xLyBbCHVbbcU"];
        [[FHSTwitterEngine sharedEngine]setDelegate:self];
        [[FHSTwitterEngine sharedEngine]loadAccessToken];
        
        UIViewController *loginController = [[FHSTwitterEngine sharedEngine]loginControllerWithCompletionHandler:^(BOOL success) {
            appDelegate.twitterUsersList=[[NSMutableArray alloc] init];
            appDelegate.twitterFriendsArray=[[NSMutableArray alloc] init];
            NSLog(success?@"L0L success":@"O noes!!! Loggen faylur!!!");
            NSString * username = [FHSTwitterEngine sharedEngine].authenticatedUsername;
            [[NSUserDefaults standardUserDefaults] setObject:FHSTwitterEngine.sharedEngine.authenticatedUsername forKey:@"twittername"];
            appDelegate.twitterProfileImage = [[FHSTwitterEngine sharedEngine] getProfileImageForUsername:@"mansoors2010" andSize:300];
            NSMutableDictionary *   dict1 = [[FHSTwitterEngine sharedEngine]listFriendsForUser:username isID:NO withCursor:@"-1"];
            
            NSLog(@"====> %@",[dict1 objectForKey:@"users"] );        // Here You get all the data
            NSMutableArray *array=[dict1 objectForKey:@"users"];
            for(int i=0;i<[array count];i++)
            {
                NSLog(@"names:%@",[[array objectAtIndex:i]objectForKey:@"screen_name"]);
                [appDelegate.twitterUsersList addObject:[[array objectAtIndex:i]objectForKey:@"name"]];
                [appDelegate.twitterFriendsArray addObject:[[array objectAtIndex:i]objectForKey:@"screen_name"]];
                [appDelegate.twitterFriendsArray addObject:[[array objectAtIndex:i]objectForKey:@"id"]];
            }
            TwitterInviteViewController *twitterinvite=[[TwitterInviteViewController alloc] initWithNibName:@"TwitterInviteViewController" bundle:nil];
            [self.navigationController pushViewController:twitterinvite animated:YES];
        }];
        [self presentViewController:loginController animated:YES completion:nil];
    }
}

/*-(void)facebookInvite{
    [FBWebDialogs presentRequestsDialogModallyWithSession:nil
     message:@"Check out FirstPlay.me App on appstore."
     title:nil
     parameters:nil
     handler:^(FBWebDialogResult result, NSURL *resultURL, NSError *error) {
         if (error) {
             // Error launching the dialog or sending the request.
             NSLog(@"Error sending request.");
         } else {
             if (result == FBWebDialogResultDialogNotCompleted) {
                 // User clicked the "x" icon
                 NSLog(@"User canceled request.");
             } else {
                 // Handle the send request callback
             }
         }
     }];
}*/



#pragma marl - UITableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [optionsArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellIdentifier = @"Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSInteger row = indexPath.row;
	
	if (nil == cell)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        cell.textLabel.textColor=[UIColor whiteColor];
	}
    
    UIButton *linkButton=[[UIButton alloc] initWithFrame:CGRectMake(5, 5, 310, 40)];
    linkButton.layer.borderColor = [UIColor grayColor].CGColor;
    linkButton.layer.borderWidth = 2.0f;
    [linkButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [linkButton setTitle:[optionsArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    if(indexPath.row==0){
        [linkButton addTarget:self
                       action:@selector(facebookInvite)
             forControlEvents:UIControlEventTouchUpInside];
    }else if(indexPath.row==1){
        [linkButton addTarget:self
                       action:@selector(twitterInvite)
             forControlEvents:UIControlEventTouchUpInside];
    }else if(indexPath.row==2){
        [linkButton addTarget:self
                       action:@selector(getContact)
             forControlEvents:UIControlEventTouchUpInside];
    }
    [cell.contentView addSubview:linkButton];
    return cell;
}

@end
