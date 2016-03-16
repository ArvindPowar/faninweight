//
//  InviteFriendsViewController.h
//  FirstPlay
//
//  Created by mansoor shaikh on 05/06/14.
//  Copyright (c) 2014 MobiWebCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#import <Accounts/ACAccountStore.h>
#import <Accounts/ACAccountType.h>
#import <Accounts/Accounts.h>
//#import <FacebookSDK/FacebookSDK.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface InviteFriendsViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,ABPeoplePickerNavigationControllerDelegate>
@property(nonatomic,retain) ACAccount *myAccount;
@property(nonatomic,retain) IBOutlet UITableView *tblview;
@property(nonatomic,retain) NSMutableArray *optionsArray;
@property(nonatomic,retain) AppDelegate *appDelegate;
@property(nonatomic,retain) UITextField *firstName, *lastName,*number;
-(IBAction)popViewController;
@end
