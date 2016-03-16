//
//  RegisterViewController.m
//  FanWeighIn
//
//  Created by arvind on 8/6/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import "RegisterViewController.h"
#import "HomeViewController.h"
#import "Reachability.h"
@interface RegisterViewController ()

@end

@implementation RegisterViewController
@synthesize registerLabel,nameLabel,dateLabel,genderLabel,emailLabel,currentLabel,goalLabel;
@synthesize nameTextField,dateTextField,genderTextField,emailTextField,currentTextField,goalTextField;
@synthesize registerButton;
@synthesize fanImageView;
@synthesize weighPickerView,genderPicker;
@synthesize weighArray,genderArray;
@synthesize homeViewController;
@synthesize datePicker,scrollView,starttime,theDate,bgimage,dateToobar,viewUp,genderToolbar,goalToolbar,activityIndicator,registerVO,appDelegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    [activityIndicator stopAnimating];
    appDelegate=[[UIApplication sharedApplication] delegate];
    //datepicker.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    
    CGFloat yheight = [UIScreen mainScreen].bounds.size.height;
    if(yheight>=568){
        //self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
        bgimage.image=[UIImage imageNamed:@"background.png"];
        datePicker.frame=CGRectMake(0, 350,self.view.bounds.size.width, 162);
        
    }else{
        bgimage.image=[UIImage imageNamed:@"background.png"];
        datePicker.frame=CGRectMake(0, 350,self.view.bounds.size.width, 162);
    }
    
    
    dateTextField.layer.borderColor=[[UIColor blackColor]CGColor];
    dateToobar.hidden=YES;
    
    datePicker.hidden=YES;
    datePicker.layer.backgroundColor = [UIColor whiteColor].CGColor;
    [datePicker removeFromSuperview];
    [self.view addSubview:datePicker];
    weighArray=[[NSArray alloc] initWithObjects:@"Strawweight 0-115",@"Flyweight 116-125",@"Bantamweight 126-135",@"Featherweight 136-145",@" Lightweight 146-155",@"Welterweight 156-170",@"Middleweight 156-170",@"LightHeavyweight 186-205",@"Heavyweight 206-265",@"SuperHeavyweight 265-600",nil];
    genderArray=[[NSArray alloc]initWithObjects:@"Male",@"Female",nil];
    UIGraphicsBeginImageContext(self.view.frame.size);

    [[UIImage imageNamed:@"bg1.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat yzheight = [UIScreen mainScreen].bounds.size.height;
    if(yzheight>=568){
        scrollView.contentSize=CGSizeMake(width, yzheight+300);
    }else{
        scrollView.contentSize=CGSizeMake(width, yzheight+400);
    }
      RegisterViewController *registers;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        registers=[[RegisterViewController alloc] initWithNibName:@"RegisterViewController~ipad" bundle:nil];

        datePicker=[[UIDatePicker alloc] initWithFrame:CGRectMake(0,650,self.view.bounds.size.width,162)];
        datePicker.layer.backgroundColor = [UIColor whiteColor].CGColor;
        [datePicker removeFromSuperview];
        [self.view addSubview:datePicker];
           }else
    {
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    if(height>=480 && height<568){
        fanImageView=[[UIImageView alloc] initWithFrame:CGRectMake(5,0,300,90)];
        
        UIImage *imageFan = [UIImage imageNamed: @"fanweighinlogo.png"];
        
        [fanImageView setImage:imageFan];
        [self.scrollView addSubview:fanImageView];
        
        registerLabel = [[UILabel alloc] initWithFrame:CGRectMake(100,95,125,30)];
        registerLabel.backgroundColor = [UIColor clearColor];
        registerLabel.text=@"Register";
        registerLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fon = [registerLabel.font.fontDescriptor
                                  fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                  | UIFontDescriptorTraitItalic];
        registerLabel.font = [UIFont fontWithDescriptor:fon size:30];     [self.scrollView addSubview:registerLabel];
        
        nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(25,125,200,21)];
        nameLabel.backgroundColor = [UIColor clearColor];
        nameLabel.text=@"Name";
        UIFontDescriptor * fontDs = [nameLabel.font.fontDescriptor
                                     fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                     | UIFontDescriptorTraitItalic];
        nameLabel.font = [UIFont fontWithDescriptor:fontDs size:30];
        
        
        nameLabel.textColor=[UIColor whiteColor];
        [self.scrollView addSubview:nameLabel];
        
        nameTextField=[[UITextField alloc] initWithFrame:CGRectMake(25,160,290,30)];
        nameTextField.borderStyle = UITextBorderStyleRoundedRect;
        nameTextField.backgroundColor=[UIColor whiteColor];
        nameTextField.tag=1;
        nameTextField.delegate=self;
        [self.scrollView addSubview:nameTextField];
        
        /*dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(25,195,250,21)];
        dateLabel.backgroundColor = [UIColor clearColor];
        dateLabel.text=@"Date Of Birth";
        UIFontDescriptor * fontDss = [dateLabel.font.fontDescriptor
                                      fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                      | UIFontDescriptorTraitItalic];
        dateLabel.font = [UIFont fontWithDescriptor:fontDss size:30];
        dateLabel.textColor=[UIColor whiteColor];
        [self.scrollView addSubview:dateLabel];
        
        dateTextField=[[UITextField alloc] initWithFrame:CGRectMake(25,225,290,30)];
        dateTextField.borderStyle = UITextBorderStyleRoundedRect;
        dateTextField.backgroundColor=[UIColor whiteColor];
        dateTextField.tag=2;
        dateTextField.delegate=self;
        [self.scrollView addSubview:dateTextField];*/
        
        genderLabel = [[UILabel alloc] initWithFrame:CGRectMake(25,195,200,21)];
        genderLabel.backgroundColor = [UIColor clearColor];
        genderLabel.text=@"Gender";
        UIFontDescriptor * fontDsss = [genderLabel.font.fontDescriptor
                                       fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                       | UIFontDescriptorTraitItalic];
        genderLabel.font = [UIFont fontWithDescriptor:fontDsss size:30];
        genderLabel.textColor=[UIColor whiteColor];
        [self.scrollView addSubview:genderLabel];
        
        genderTextField=[[UITextField alloc] initWithFrame:CGRectMake(25,225,290,30)];
        genderTextField.borderStyle = UITextBorderStyleRoundedRect;
        genderTextField.backgroundColor=[UIColor whiteColor];
        genderTextField.tag=3;
        genderTextField.text=@"Male";
        genderTextField.delegate=self;
        [self.scrollView addSubview:genderTextField];
        
        /*emailLabel = [[UILabel alloc] initWithFrame:CGRectMake(25,325,250,21)];
        emailLabel.backgroundColor = [UIColor clearColor];
        emailLabel.text=@"Email Address";
        UIFontDescriptor * fontDssss = [emailLabel.font.fontDescriptor
                                        fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                        | UIFontDescriptorTraitItalic];
        emailLabel.font = [UIFont fontWithDescriptor:fontDssss size:30];
        
        
        emailLabel.textColor=[UIColor whiteColor];
        
        [self.scrollView addSubview:emailLabel];
        
        emailTextField=[[UITextField alloc] initWithFrame:CGRectMake(25,355,290,30)];
        emailTextField.borderStyle = UITextBorderStyleRoundedRect;
        emailTextField.backgroundColor=[UIColor whiteColor];
        emailTextField.tag=4;
        emailTextField.delegate=self;
        [emailTextField setKeyboardType:UIKeyboardTypeEmailAddress];
        [self.scrollView addSubview:emailTextField];*/
        
        currentLabel = [[UILabel alloc] initWithFrame:CGRectMake(25,260,270,30)];
        currentLabel.backgroundColor = [UIColor clearColor];
        currentLabel.text=@"Current Weight";
        UIFontDescriptor * font = [currentLabel.font.fontDescriptor
                                   fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                   | UIFontDescriptorTraitItalic];
        currentLabel.font = [UIFont fontWithDescriptor:font size:30];
        currentLabel.textColor=[UIColor whiteColor];
        [self.scrollView addSubview:currentLabel];
        
        currentTextField=[[UITextField alloc] initWithFrame:CGRectMake(25,300,290,30)];
        currentTextField.borderStyle = UITextBorderStyleRoundedRect;
        currentTextField.backgroundColor=[UIColor whiteColor];
        [currentTextField setKeyboardType:UIKeyboardTypeNumberPad];
        UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
        numberToolbar.barStyle = UIBarStyleBlackTranslucent;
        numberToolbar.items = @[[[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                                [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
        [numberToolbar sizeToFit];
        currentTextField.inputAccessoryView = numberToolbar;
        
        currentTextField.delegate=self;
        [self.scrollView addSubview:currentTextField];
        
        goalLabel = [[UILabel alloc] initWithFrame:CGRectMake(25,335,250,30)];
        goalLabel.backgroundColor = [UIColor clearColor];
        goalLabel.text=@"Goal Weight";
        UIFontDescriptor * fonte = [goalLabel.font.fontDescriptor
                                    fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                    | UIFontDescriptorTraitItalic];
        goalLabel.font = [UIFont fontWithDescriptor:fonte size:30];
        goalLabel.textColor=[UIColor whiteColor];
        [self.scrollView addSubview:goalLabel];
        
        goalTextField=[[UITextField alloc] initWithFrame:CGRectMake(25,370,290,30)];
        goalTextField.borderStyle = UITextBorderStyleRoundedRect;
        goalTextField.backgroundColor=[UIColor whiteColor];
        goalTextField.delegate=self;
        [self.scrollView addSubview:goalTextField];
        
        registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [registerButton addTarget:self action:@selector(registerAction)forControlEvents:UIControlEventTouchUpInside];
        registerButton.frame = CGRectMake(100,440,155,40);
        
        [registerButton setBackgroundImage: [UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
        [registerButton setTitle:@"Register" forState:UIControlStateNormal];
        [registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        registerButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
        [self.scrollView addSubview:registerButton];
        
        datePicker=[[UIDatePicker alloc] initWithFrame:CGRectMake(0,350,self.view.bounds.size.width-90,162)];
        datePicker.layer.backgroundColor = [UIColor whiteColor].CGColor;
        [datePicker removeFromSuperview];
        [self.view addSubview:datePicker];
 }else if(height>=568 && height<600){
    

     fanImageView=[[UIImageView alloc] initWithFrame:CGRectMake(5,0,300,90)];
     
     UIImage *imageFan = [UIImage imageNamed: @"fanweighinlogo.png"];
     
     [fanImageView setImage:imageFan];
     [self.scrollView addSubview:fanImageView];
     
     registerLabel = [[UILabel alloc] initWithFrame:CGRectMake(100,95,125,30)];
     registerLabel.backgroundColor = [UIColor clearColor];
     registerLabel.text=@"Register";
     registerLabel.textColor=[UIColor whiteColor];
     UIFontDescriptor * fon = [registerLabel.font.fontDescriptor
                               fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                               | UIFontDescriptorTraitItalic];
     registerLabel.font = [UIFont fontWithDescriptor:fon size:30];     [self.scrollView addSubview:registerLabel];
     
     nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(25,125,200,21)];
     nameLabel.backgroundColor = [UIColor clearColor];
     nameLabel.text=@"Name";
     UIFontDescriptor * fontDs = [nameLabel.font.fontDescriptor
                                  fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                  | UIFontDescriptorTraitItalic];
     nameLabel.font = [UIFont fontWithDescriptor:fontDs size:30];
    
     
     nameLabel.textColor=[UIColor whiteColor];
     [self.scrollView addSubview:nameLabel];
     
     nameTextField=[[UITextField alloc] initWithFrame:CGRectMake(25,160,290,30)];
     nameTextField.borderStyle = UITextBorderStyleRoundedRect;
     nameTextField.backgroundColor=[UIColor whiteColor];
     nameTextField.tag=1;
     nameTextField.delegate=self;
     [self.scrollView addSubview:nameTextField];
     
     /*dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(25,195,250,21)];
     dateLabel.backgroundColor = [UIColor clearColor];
     dateLabel.text=@"Date Of Birth";
     UIFontDescriptor * fontDss = [dateLabel.font.fontDescriptor
                                   fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                   | UIFontDescriptorTraitItalic];
     dateLabel.font = [UIFont fontWithDescriptor:fontDss size:30];
     dateLabel.textColor=[UIColor whiteColor];
     [self.scrollView addSubview:dateLabel];
     
     dateTextField=[[UITextField alloc] initWithFrame:CGRectMake(25,225,290,30)];
     dateTextField.borderStyle = UITextBorderStyleRoundedRect;
     dateTextField.backgroundColor=[UIColor whiteColor];
     dateTextField.tag=2;
     dateTextField.delegate=self;
     [self.scrollView addSubview:dateTextField];*/
     
     genderLabel = [[UILabel alloc] initWithFrame:CGRectMake(25,195,200,21)];
     genderLabel.backgroundColor = [UIColor clearColor];
     genderLabel.text=@"Gender";
     UIFontDescriptor * fontDsss = [genderLabel.font.fontDescriptor
                                    fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                    | UIFontDescriptorTraitItalic];
     genderLabel.font = [UIFont fontWithDescriptor:fontDsss size:30];
     genderLabel.textColor=[UIColor whiteColor];
     [self.scrollView addSubview:genderLabel];
     
     genderTextField=[[UITextField alloc] initWithFrame:CGRectMake(25,225,290,30)];
     genderTextField.borderStyle = UITextBorderStyleRoundedRect;
     genderTextField.backgroundColor=[UIColor whiteColor];
     genderTextField.tag=3;
     genderTextField.delegate=self;
     genderTextField.text=@"Male";
     [self.scrollView addSubview:genderTextField];
     
    /* emailLabel = [[UILabel alloc] initWithFrame:CGRectMake(25,260,250,21)];
     emailLabel.backgroundColor = [UIColor clearColor];
     emailLabel.text=@"Email Address";
     UIFontDescriptor * fontDssss = [emailLabel.font.fontDescriptor
                                     fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                     | UIFontDescriptorTraitItalic];
     emailLabel.font = [UIFont fontWithDescriptor:fontDssss size:30];
    
     
     emailLabel.textColor=[UIColor whiteColor];
     
     [self.scrollView addSubview:emailLabel];
     
     emailTextField=[[UITextField alloc] initWithFrame:CGRectMake(25,288,290,30)];
     emailTextField.borderStyle = UITextBorderStyleRoundedRect;
     emailTextField.backgroundColor=[UIColor whiteColor];
     emailTextField.tag=4;
     emailTextField.delegate=self;
     [emailTextField setKeyboardType:UIKeyboardTypeEmailAddress];
     [self.scrollView addSubview:emailTextField];*/
     
     currentLabel = [[UILabel alloc] initWithFrame:CGRectMake(25,260,270,30)];
     currentLabel.backgroundColor = [UIColor clearColor];
     currentLabel.text=@"Current Weight";
     UIFontDescriptor * font = [currentLabel.font.fontDescriptor
                                fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                | UIFontDescriptorTraitItalic];
     currentLabel.font = [UIFont fontWithDescriptor:font size:30];
     currentLabel.textColor=[UIColor whiteColor];
     [self.scrollView addSubview:currentLabel];
     
     currentTextField=[[UITextField alloc] initWithFrame:CGRectMake(25,295,290,30)];
     currentTextField.borderStyle = UITextBorderStyleRoundedRect;
     currentTextField.backgroundColor=[UIColor whiteColor];
     [currentTextField setKeyboardType:UIKeyboardTypeNumberPad];
     UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
     numberToolbar.barStyle = UIBarStyleBlackTranslucent;
     numberToolbar.items = @[[[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                             [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                             [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
     [numberToolbar sizeToFit];
     currentTextField.inputAccessoryView = numberToolbar;

     currentTextField.delegate=self;
     [self.scrollView addSubview:currentTextField];
     
     goalLabel = [[UILabel alloc] initWithFrame:CGRectMake(25,330,250,30)];
     goalLabel.backgroundColor = [UIColor clearColor];
     goalLabel.text=@"Goal Weight";
     UIFontDescriptor * fonte = [goalLabel.font.fontDescriptor
                               fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                               | UIFontDescriptorTraitItalic];
     goalLabel.font = [UIFont fontWithDescriptor:fonte size:30];
     goalLabel.textColor=[UIColor whiteColor];
     [self.scrollView addSubview:goalLabel];
     
     goalTextField=[[UITextField alloc] initWithFrame:CGRectMake(25,370,290,30)];
     goalTextField.borderStyle = UITextBorderStyleRoundedRect;
     goalTextField.backgroundColor=[UIColor whiteColor];
     goalTextField.delegate=self;
     [self.scrollView addSubview:goalTextField];
     
     registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
     [registerButton addTarget:self action:@selector(registerAction)forControlEvents:UIControlEventTouchUpInside];
     registerButton.frame = CGRectMake(100,450,155,40);
     
     [registerButton setBackgroundImage: [UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
     [registerButton setTitle:@"Register" forState:UIControlStateNormal];
     [registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
     registerButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
     [self.scrollView addSubview:registerButton];
 
     datePicker=[[UIDatePicker alloc] initWithFrame:CGRectMake(0,350,self.view.bounds.size.width-90,220)];
     datePicker.layer.backgroundColor = [UIColor whiteColor].CGColor;
     [datePicker removeFromSuperview];
     [self.view addSubview:datePicker];
 }else{
     fanImageView=[[UIImageView alloc] initWithFrame:CGRectMake(5,5,320,100)];
     
     UIImage *imageFan = [UIImage imageNamed: @"fanweighinlogo.png"];
     
     [fanImageView setImage:imageFan];
     [self.scrollView addSubview:fanImageView];
     
     registerLabel = [[UILabel alloc] initWithFrame:CGRectMake(100,105,250,40)];
     registerLabel.backgroundColor = [UIColor clearColor];
     registerLabel.text=@"Register";
     registerLabel.textColor=[UIColor whiteColor];
     UIFontDescriptor * fontD = [registerLabel.font.fontDescriptor
                                 fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                 | UIFontDescriptorTraitItalic];
     registerLabel.font = [UIFont fontWithDescriptor:fontD size:30];
     [self.scrollView addSubview:registerLabel];
     
     nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(25,150,250,21)];
     nameLabel.backgroundColor = [UIColor clearColor];
     nameLabel.text=@"Name";
     UIFontDescriptor * fontDs = [nameLabel.font.fontDescriptor
                                 fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                 | UIFontDescriptorTraitItalic];
     nameLabel.font = [UIFont fontWithDescriptor:fontDs size:30];
     nameLabel.textColor=[UIColor whiteColor];
     [self.scrollView addSubview:nameLabel];
     
     nameTextField=[[UITextField alloc] initWithFrame:CGRectMake(25,180,290,30)];
     nameTextField.borderStyle = UITextBorderStyleRoundedRect;
     nameTextField.backgroundColor=[UIColor whiteColor];
     nameTextField.tag=1;
     nameTextField.delegate=self;
     [self.scrollView addSubview:nameTextField];
     
    /* dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(25,220,250,21)];
     dateLabel.backgroundColor = [UIColor clearColor];
     dateLabel.text=@"Date Of Birth";
     UIFontDescriptor * fontDss = [dateLabel.font.fontDescriptor
                                  fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                  | UIFontDescriptorTraitItalic];
     dateLabel.font = [UIFont fontWithDescriptor:fontDss size:30];
     dateLabel.textColor=[UIColor whiteColor];
     [self.scrollView addSubview:dateLabel];
     
     dateTextField=[[UITextField alloc] initWithFrame:CGRectMake(25,245,290,30)];
     dateTextField.borderStyle = UITextBorderStyleRoundedRect;
     dateTextField.backgroundColor=[UIColor whiteColor];
     dateTextField.tag=2;
     dateTextField.delegate=self;
     [self.scrollView addSubview:dateTextField];*/
     
     genderLabel = [[UILabel alloc] initWithFrame:CGRectMake(25,220,250,21)];
     genderLabel.backgroundColor = [UIColor clearColor];
     genderLabel.text=@"Gender";
     UIFontDescriptor * fontDsss = [genderLabel.font.fontDescriptor
                                   fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                   | UIFontDescriptorTraitItalic];
     genderLabel.font = [UIFont fontWithDescriptor:fontDsss size:30];
     genderLabel.textColor=[UIColor whiteColor];
     [self.scrollView addSubview:genderLabel];
     
     genderTextField=[[UITextField alloc] initWithFrame:CGRectMake(25,255,290,30)];
     genderTextField.borderStyle = UITextBorderStyleRoundedRect;
     genderTextField.backgroundColor=[UIColor whiteColor];
     genderTextField.tag=3;
     genderTextField.delegate=self;
     genderTextField.text=@"Male";
     [self.scrollView addSubview:genderTextField];
     
     /*emailLabel = [[UILabel alloc] initWithFrame:CGRectMake(25,355,250,21)];
     emailLabel.backgroundColor = [UIColor clearColor];
     emailLabel.text=@"Email Address";
     UIFontDescriptor * fontDssss = [emailLabel.font.fontDescriptor
                                    fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                    | UIFontDescriptorTraitItalic];
     emailLabel.font = [UIFont fontWithDescriptor:fontDssss size:30];
     emailLabel.textColor=[UIColor whiteColor];
     
     [self.scrollView addSubview:emailLabel];
     
     emailTextField=[[UITextField alloc] initWithFrame:CGRectMake(25,285,290,30)];
     emailTextField.borderStyle = UITextBorderStyleRoundedRect;
     emailTextField.backgroundColor=[UIColor whiteColor];
     emailTextField.tag=4;
     emailTextField.delegate=self;
     [emailTextField setKeyboardType:UIKeyboardTypeEmailAddress];
     [self.scrollView addSubview:emailTextField];*/
     
     currentLabel = [[UILabel alloc] initWithFrame:CGRectMake(25,310,250,30)];
     currentLabel.backgroundColor = [UIColor clearColor];
     currentLabel.text=@"Current Weight";
     UIFontDescriptor * font = [currentLabel.font.fontDescriptor
                                     fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                     | UIFontDescriptorTraitItalic];
     currentLabel.font = [UIFont fontWithDescriptor:font size:30];
     currentLabel.textColor=[UIColor whiteColor];
     [self.scrollView addSubview:currentLabel];
     
     currentTextField=[[UITextField alloc] initWithFrame:CGRectMake(25,355,290,30)];
     currentTextField.borderStyle = UITextBorderStyleRoundedRect;
     currentTextField.backgroundColor=[UIColor whiteColor];
     [currentTextField setKeyboardType:UIKeyboardTypeNumberPad];
     UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
     numberToolbar.barStyle = UIBarStyleBlackTranslucent;
     numberToolbar.items = @[[[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                             [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                             [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
     [numberToolbar sizeToFit];
     currentTextField.inputAccessoryView = numberToolbar;
     //currentTextField.tag=5;
     currentTextField.delegate=self;
     [self.scrollView addSubview:currentTextField];
     
     goalLabel = [[UILabel alloc] initWithFrame:CGRectMake(25,410,250,30)];
     goalLabel.backgroundColor = [UIColor clearColor];
     goalLabel.text=@"Goal Weight";
     UIFontDescriptor * fon = [goalLabel.font.fontDescriptor
                                fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                | UIFontDescriptorTraitItalic];
     goalLabel.font = [UIFont fontWithDescriptor:fon size:30];
     goalLabel.textColor=[UIColor whiteColor];
     [self.scrollView addSubview:goalLabel];
     
     goalTextField=[[UITextField alloc] initWithFrame:CGRectMake(25,475,290,30)];
     goalTextField.borderStyle = UITextBorderStyleRoundedRect;
     goalTextField.backgroundColor=[UIColor whiteColor];
     goalTextField.tag=6;
     goalTextField.delegate=self;
     [self.scrollView addSubview:goalTextField];
     
     registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
     [registerButton addTarget:self action:@selector(registerAction)forControlEvents:UIControlEventTouchUpInside];
     registerButton.frame = CGRectMake(100,550,155,40);
     
     [registerButton setBackgroundImage: [UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
     [registerButton setTitle:@"Register" forState:UIControlStateNormal];
     [registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
     registerButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
     [self.scrollView addSubview:registerButton];
     
     datePicker=[[UIDatePicker alloc] initWithFrame:CGRectMake(0,350,self.view.bounds.size.width,162)];
     datePicker.layer.backgroundColor = [UIColor whiteColor].CGColor;
     [datePicker removeFromSuperview];
     [self.view addSubview:datePicker];
    }
    }
    
    datePicker.datePickerMode=UIDatePickerModeDate;
    datePicker.hidden=YES;
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    if([prefs stringForKey:@"loggedin"]!=nil){
      
        homeViewController =[[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
        [self.navigationController pushViewController:homeViewController animated:YES];    }
}
-(void)doneWithNumberPad{
    [currentTextField resignFirstResponder];
}

-(IBAction)doneBtnPresseds{
    NSDateFormatter *f2 = [[NSDateFormatter alloc] init];
    [f2 setDateFormat:@"dd/MM/YYYY"];
    NSString *s = [f2 stringFromDate:datePicker.date];
    dateTextField.text=[[NSString alloc]initWithFormat:@"%@",s];
    
    genderToolbar.hidden=YES;
    goalToolbar.hidden=YES;
    dateToobar.hidden=YES;
    
    weighPickerView.hidden=YES;
    genderPicker.hidden=YES;
    datePicker.hidden=YES;
}


- (void) threadStartAnimating:(id)data {
    [activityIndicator startAnimating];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat yzheight = [UIScreen mainScreen].bounds.size.height;
    activityIndicator.center = CGPointMake(width / 2.0,yzheight/ 2.0);
    
}

-(IBAction)registerAction{
    Reachability *myNetwork = [Reachability reachabilityWithHostname:@"google.com"];
    NetworkStatus myStatus = [myNetwork currentReachabilityStatus];
    if(myStatus == NotReachable)
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"No internet connection available!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [activityIndicator stopAnimating];
    }else{

    [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
    
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    if ([nameTextField.text isEqualToString:@""] || [currentTextField.text isEqualToString:@""] || [goalTextField.text isEqualToString:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Faninweight"
                                                        message:@"Please fill up all mandatory fields!!!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [activityIndicator stopAnimating];
        
    }else{
        NSString *urlString = [[NSString alloc]initWithFormat:@"http://millionairesorg.com/fanweighin/registeruser.php?username=%@&dateofbirth=%@&gender=%@&email=%@&currentweight=%@&goalweight=%@&deviceid=%@&devicetype=iphone",nameTextField.text,@"",genderTextField.text,@"",currentTextField.text,goalTextField.text,appDelegate.deviceToken];
        NSData *mydata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
        
        NSString *content = [[NSString alloc]  initWithBytes:[mydata bytes]
                                                      length:[mydata length] encoding: NSUTF8StringEncoding];
        
                    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Faninweight" message:@"You have been Register Successfully !!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
        
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            [prefs setObject:content forKey:@"loggedin"];
            [prefs synchronize];
            
            NSUserDefaults *prefsusername = [NSUserDefaults standardUserDefaults];
            [prefsusername setObject:nameTextField.text forKey:@"name"];
            [prefsusername synchronize];
            
            NSUserDefaults *prefscutwght = [NSUserDefaults standardUserDefaults];
            [prefscutwght setObject:currentTextField.text forKey:@"currentweight"];
            [prefscutwght synchronize];
            
            NSUserDefaults *prefsgolwght = [NSUserDefaults standardUserDefaults];
            [prefsgolwght setObject:goalTextField.text forKey:@"goalweight"];
            [prefsgolwght synchronize];
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            homeViewController =[[HomeViewController alloc]initWithNibName:@"HomeViewController~ipad" bundle:nil];
            [self.navigationController pushViewController:homeViewController animated:YES];
        }else{
            homeViewController =[[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
            [self.navigationController pushViewController:homeViewController animated:YES];
        }
        [activityIndicator stopAnimating];

    }
    }
    [activityIndicator stopAnimating];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (textField ==genderTextField) {
        
        genderToolbar.hidden=YES;
        goalToolbar.hidden=YES;
        dateToobar.hidden=YES;
        weighPickerView.hidden=YES;
        genderPicker.hidden=YES;
        datePicker.hidden=YES;
        
        genderPicker = [[UIPickerView alloc] init];
        [genderPicker setDataSource: self];
        [genderPicker setDelegate: self];
        genderPicker.backgroundColor = [UIColor whiteColor];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
              [genderPicker setFrame: CGRectMake(0,655,self.view.bounds.size.width,250)];
            genderToolbar= [[UIToolbar alloc] initWithFrame:CGRectMake(0,615,self.view.bounds.size.width,44)];

        }else{
            [genderPicker setFrame: CGRectMake(0,355,self.view.bounds.size.width,250)];
            genderToolbar= [[UIToolbar alloc] initWithFrame:CGRectMake(0,315,self.view.bounds.size.width,44)];

        }
        genderPicker.showsSelectionIndicator = YES;
        [genderPicker selectRow:2 inComponent:0 animated:YES];
        [self.view addSubview: genderPicker];
        genderPicker.hidden=NO;
        [genderToolbar setBarStyle:UIBarStyleBlackOpaque];
        UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                          style:UIBarButtonItemStyleBordered target:self action:@selector(doneBtnPresseds)];
        genderToolbar.items = @[barButtonDone];
        barButtonDone.tintColor=[UIColor whiteColor];
        [self.view addSubview:genderToolbar];
        
        genderToolbar.hidden=NO;
        [genderTextField resignFirstResponder];
        
        return NO;

    }
    else if (textField==goalTextField){
        genderToolbar.hidden=YES;
        goalToolbar.hidden=YES;
        dateToobar.hidden=YES;
        
        weighPickerView.hidden=YES;
        genderPicker.hidden=YES;
        datePicker.hidden=YES;
        
        weighPickerView = [[UIPickerView alloc] init];
        [weighPickerView setDataSource: self];
        [weighPickerView setDelegate: self];
        weighPickerView.backgroundColor = [UIColor whiteColor];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [weighPickerView setFrame: CGRectMake(0,655,self.view.bounds.size.width,250)];
            goalToolbar= [[UIToolbar alloc] initWithFrame:CGRectMake(0,615,self.view.bounds.size.width,44)];

        }else{
            [weighPickerView setFrame: CGRectMake(0,355,self.view.bounds.size.width,250)];
            goalToolbar= [[UIToolbar alloc] initWithFrame:CGRectMake(0,315,self.view.bounds.size.width,44)];

        }
        weighPickerView.showsSelectionIndicator = YES;
        [weighPickerView selectRow:2 inComponent:0 animated:YES];
        [self.view addSubview: weighPickerView];
        weighPickerView.hidden=NO;
        [goalToolbar setBarStyle:UIBarStyleBlackOpaque];
        UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                          style:UIBarButtonItemStyleBordered target:self action:@selector(doneBtnPresseds)];
        goalToolbar.items = @[barButtonDone];
        barButtonDone.tintColor=[UIColor whiteColor];
        [self.view addSubview:goalToolbar];
        
        goalToolbar.hidden=NO;
        [goalTextField resignFirstResponder];
        
        return NO;

    }
    else if(textField==dateTextField){
        
            if(viewUp==YES){
                viewUp=NO;
                //[self animateTextView:NO];
            }
            
            if(viewUp==NO){
                viewUp=YES;
                //[self animateTextView:YES];
            }
            
            dateToobar.hidden=YES;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            dateToobar= [[UIToolbar alloc] initWithFrame:CGRectMake(0,607,self.view.bounds.size.width,44)];

        }else{
            dateToobar= [[UIToolbar alloc] initWithFrame:CGRectMake(0,307,self.view.bounds.size.width,44)];

        }
            [dateToobar setBarStyle:UIBarStyleBlackOpaque];
            UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                              style:UIBarButtonItemStyleBordered target:self action:@selector(doneBtnPresseds)];
            dateToobar.items = @[barButtonDone];
            barButtonDone.tintColor=[UIColor whiteColor];
            [self.view addSubview:dateToobar];
            dateToobar.hidden=NO;
            datePicker.hidden=NO;
            [dateTextField resignFirstResponder];
        return NO;
    }
    else{
        NSLog(@"Other Textfield");
    }
    genderToolbar.hidden=YES;
    goalToolbar.hidden=YES;
    dateToobar.hidden=YES;
    weighPickerView.hidden=YES;
    genderPicker.hidden=YES;
    datePicker.hidden=YES;
 return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField*)aTextField
{
    [aTextField resignFirstResponder];
    return YES;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView; {
    return 1;
}
//Rows in each Column

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component; {
    if(pickerView==weighPickerView){
    return [weighArray count];
    }
    else{
        return [genderArray count];
    }
}
-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=YES;
    
}

-(NSString*) pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(pickerView==weighPickerView){

    return [weighArray objectAtIndex:row];
    }
else{
    return [genderArray objectAtIndex:row];
    
}
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
{
    if(pickerView==weighPickerView){

   goalTextField.text=[NSString stringWithFormat:@"%@",[weighArray objectAtIndex:row]];
    }
    else{
        genderTextField.text=[NSString stringWithFormat:@"%@",[genderArray objectAtIndex:row]];
    }
    
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}

// tell the picker the width of each row for a given component
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    CGFloat componentWidth = 0.0;
    componentWidth = 300.0;
    return componentWidth;
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
