//
//  RegisterViewController.h
//  FanWeighIn
//
//  Created by arvind on 8/6/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "RegisterVO.h"
#import "AppDelegate.h"
@interface RegisterViewController : UIViewController<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
{
    UILabel *registerLabel,*nameLabel,*dateLabel,*genderLabel,*emailLabel,*currentLabel,*goalLabel;
    UITextField *nameTextField,*dateTextField,*genderTextField,*emailTextField,*currentTextField,*goalTextField;
    UIButton *registerButton;
    UIImageView *fanImageView;
    UIPickerView *weighPickerView,*genderPicker;;
    NSArray *weighArray,*genderArray;
    HomeViewController *homeViewController;
    UIDatePicker *datePicker;
}
@property(nonatomic,retain)IBOutlet UILabel *registerLabel,*nameLabel,*dateLabel,*genderLabel,*emailLabel,*currentLabel,*goalLabel;
@property(nonatomic,retain)IBOutlet UITextField *nameTextField,*dateTextField,*genderTextField,*emailTextField,*currentTextField,*goalTextField;
@property(nonatomic,retain) UIButton *registerButton;
@property(nonatomic,retain)UIImageView *fanImageView;
@property(nonatomic,retain) UIPickerView *weighPickerView,*genderPicker;
@property(nonatomic,retain)NSArray *weighArray,*genderArray;
@property(nonatomic,retain)HomeViewController *homeViewController;
@property(nonatomic,retain) IBOutlet UIDatePicker *datePicker;
@property(nonatomic,retain) IBOutlet UIScrollView *scrollView;
@property(nonatomic,retain) NSDateFormatter *starttime;
@property(nonatomic,retain) NSString *theDate,*timeDuration;
@property(nonatomic,retain) IBOutlet UIImageView *bgimage;
@property(nonatomic,readwrite) BOOL viewUp;
@property(nonatomic,retain) IBOutlet UIToolbar *dateToobar,*genderToolbar,*goalToolbar;
@property(nonatomic,retain) IBOutlet UIActivityIndicatorView *activityIndicator;
@property(nonatomic,retain) RegisterVO *registerVO;
@property(nonatomic,retain) NSMutableArray *allUserData;
@property(nonatomic,retain) AppDelegate *appDelegate;

-(void)showPicker;
-(void)showGender;
-(void)goToHome;
-(void)showDate;
-(void)onDateValueChanged:(UIDatePicker*)datePickers;
@end
