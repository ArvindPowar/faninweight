//
//  UserLIstViewController.h
//  FanWeighIn
//
//  Created by arvind on 8/22/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "userListVO.h"
@interface UserLIstViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,NSXMLParserDelegate>
@property(nonatomic,retain) IBOutlet UITableView *userlistTableView;
@property(nonatomic,retain) NSMutableArray *madeWghtUserlist,*closewghtUserList;
@property(nonatomic,retain) IBOutlet UIActivityIndicatorView *activityIndicator;
@property(nonatomic,retain) AppDelegate *appDelegate;
@property(nonatomic,retain)UIButton *currentButton,*goalButton,*backBtn;
@property(nonatomic,retain)UIImageView *fanImageView;
@property(nonatomic,retain) UILabel *usernameLbl,*currentWeightLbl,*goalWeightLbl;
@property(nonatomic,retain) userListVO *userVO;
@property(nonatomic,retain) NSString *characters;

@end
