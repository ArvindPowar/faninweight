//
//  UpdateViewController.m
//  FanWeighIn
//
//  Created by arvind on 8/6/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import "UpdateViewController.h"
#import "Reachability.h"

@interface UpdateViewController ()

@end

@implementation UpdateViewController
@synthesize fanImageView;
@synthesize weighPickerView;
@synthesize weighArray;
@synthesize currentButton,goalButton;
@synthesize currentTextField,goalTextField;
@synthesize currentLabel,goalLabel,backBtn,goalToolbar,goalwght,curwghts,dateStr,activityIndicator;
- (void)viewDidLoad {
    [super viewDidLoad];
    [activityIndicator stopAnimating];

    self.navigationController.navigationBarHidden=YES;
    NSUserDefaults *prefscutwght = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *prefsgolwght = [NSUserDefaults standardUserDefaults];
    [currentTextField setDelegate:self];
    [goalTextField setDelegate:self];

    weighArray=[[NSArray alloc] initWithObjects:@"Strawweight 0-115",@"Flyweight 116-125",@"Bantamweight 126-135",@"Featherweight 136-145",@" Lightweight 146-155",@"Welterweight 156-170",@"Middleweight 156-170",@"LightHeavyweight 186-205",@"Heavyweight 206-265",@"SuperHeavyweight 265-600",nil];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    
    [[UIImage imageNamed:@"bg1.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    UpdateViewController *update;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        update=[[UpdateViewController alloc] initWithNibName:@"UpdateViewController~ipad" bundle:nil];
        
        
    }else
    {
        

    if(height>=480 && height<568){
        fanImageView=[[UIImageView alloc] initWithFrame:CGRectMake(40,10, 285,100)];
        
        UIImage *imageFan = [UIImage imageNamed: @"fanweighinlogo.png"];
        [fanImageView setImage:imageFan];
        [self.view addSubview:fanImageView];
        
        currentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,135,310,32)];
        currentLabel.backgroundColor = [UIColor clearColor];
        currentLabel.text=@"Update Current Weight";
        currentLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fontt = [currentLabel.font.fontDescriptor
                                    fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                    | UIFontDescriptorTraitItalic];
        currentLabel.font = [UIFont fontWithDescriptor:fontt size:26];
        [self.view addSubview:currentLabel];
        
        currentTextField=[[UITextField alloc] initWithFrame:CGRectMake(25,197,270,40)];
        currentTextField.borderStyle = UITextBorderStyleRoundedRect;
        currentTextField.backgroundColor=[UIColor whiteColor];
        [currentTextField setKeyboardType:UIKeyboardTypeNumberPad];
        currentTextField.text=[prefscutwght objectForKey:@"currentweight"];
        UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
        numberToolbar.barStyle = UIBarStyleBlackTranslucent;
        numberToolbar.items = @[[[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                                [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                                [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
        [numberToolbar sizeToFit];
        currentTextField.inputAccessoryView = numberToolbar;
        currentTextField.delegate=self;
        [self.view addSubview:currentTextField];

        
        currentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [currentButton addTarget:self action:@selector(updateWeight)forControlEvents:UIControlEventTouchUpInside];
        currentButton.frame = CGRectMake(80,250,155,40);
        
        [currentButton setBackgroundImage: [UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
        [currentButton setTitle:@"UPDATE" forState:UIControlStateNormal];
        [currentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        currentButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
        [self.view addSubview:currentButton];
        
        goalLabel = [[UILabel alloc] initWithFrame:CGRectMake(25,327,280,32)];
        goalLabel.backgroundColor = [UIColor clearColor];
        goalLabel.text=@"Update Goal";
        goalLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * font = [goalLabel.font.fontDescriptor
                                   fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                   | UIFontDescriptorTraitItalic];
        goalLabel.font = [UIFont fontWithDescriptor:font size:30];
        [self.view addSubview:goalLabel];
        
        goalTextField=[[UITextField alloc] initWithFrame:CGRectMake(25,379,270,40)];
        goalTextField.borderStyle = UITextBorderStyleRoundedRect;
        goalTextField.backgroundColor=[UIColor whiteColor];
        goalTextField.text=[prefsgolwght objectForKey:@"goalweight"];
        goalTextField.tag=1;
        goalTextField.placeholder=@"Select Weigh Class";
        goalTextField.delegate=self;
        [self.view addSubview:goalTextField];
        
        goalButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [goalButton addTarget:self action:@selector(updateWeight)forControlEvents:UIControlEventTouchUpInside];
        goalButton.frame = CGRectMake(80,432,155,40);
        
        [goalButton setBackgroundImage: [UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
        [goalButton setTitle:@"UPDATE" forState:UIControlStateNormal];
        [goalButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        goalButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
        [self.view addSubview:goalButton];

    }else if(height>=568 && height<600){

    fanImageView=[[UIImageView alloc] initWithFrame:CGRectMake(40,10, 285,100)];
    
    UIImage *imageFan = [UIImage imageNamed: @"fanweighinlogo.png"];
    [fanImageView setImage:imageFan];
    [self.view addSubview:fanImageView];
    
    currentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,135,310,32)];
    currentLabel.backgroundColor = [UIColor clearColor];
    currentLabel.text=@"Update Current Weight";
    currentLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fontt = [currentLabel.font.fontDescriptor
                                    fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                    | UIFontDescriptorTraitItalic];
        currentLabel.font = [UIFont fontWithDescriptor:fontt size:26];
        [self.view addSubview:currentLabel];
    
    currentTextField=[[UITextField alloc] initWithFrame:CGRectMake(25,197,270,40)];
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
        currentTextField.text=[prefscutwght objectForKey:@"currentweight"];
    currentTextField.delegate=self;
    [self.view addSubview:currentTextField];
    
    currentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [currentButton addTarget:self action:@selector(updateWeight)forControlEvents:UIControlEventTouchUpInside];
    currentButton.frame = CGRectMake(80,250,155,40);
    
    [currentButton setBackgroundImage: [UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
    [currentButton setTitle:@"UPDATE" forState:UIControlStateNormal];
    [currentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    currentButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
    [self.view addSubview:currentButton];
    
    goalLabel = [[UILabel alloc] initWithFrame:CGRectMake(25,337,280,32)];
    goalLabel.backgroundColor = [UIColor clearColor];
    goalLabel.text=@"Update Goal";
    goalLabel.textColor=[UIColor whiteColor];
    UIFontDescriptor * font = [goalLabel.font.fontDescriptor
                                   fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                   | UIFontDescriptorTraitItalic];
        goalLabel.font = [UIFont fontWithDescriptor:font size:30];
        [self.view addSubview:goalLabel];
    
    goalTextField=[[UITextField alloc] initWithFrame:CGRectMake(25,389,270,40)];
    goalTextField.borderStyle = UITextBorderStyleRoundedRect;
    goalTextField.backgroundColor=[UIColor whiteColor];
        goalTextField.text=[prefsgolwght objectForKey:@"goalweight"];
    goalTextField.tag=1;
    goalTextField.placeholder=@"Select Weigh Class";
    goalTextField.delegate=self;
    [self.view addSubview:goalTextField];
    
    goalButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [goalButton addTarget:self action:@selector(updateWeight)forControlEvents:UIControlEventTouchUpInside];
    goalButton.frame = CGRectMake(80,442,155,40);
    
    [goalButton setBackgroundImage: [UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
    [goalButton setTitle:@"UPDATE" forState:UIControlStateNormal];
    [goalButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    goalButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
    [self.view addSubview:goalButton];
    }else{
        fanImageView=[[UIImageView alloc] initWithFrame:CGRectMake(45,5,320,100)];
        
        UIImage *imageFan = [UIImage imageNamed: @"fanweighinlogo.png"];
        [fanImageView setImage:imageFan];
        [self.view addSubview:fanImageView];
        
        currentLabel = [[UILabel alloc] initWithFrame:CGRectMake(15,150,320,32)];
        currentLabel.backgroundColor = [UIColor clearColor];
        currentLabel.text=@"Update Current Weight";
        currentLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * fontt = [currentLabel.font.fontDescriptor
                                    fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                    | UIFontDescriptorTraitItalic];
        currentLabel.font = [UIFont fontWithDescriptor:fontt size:25];
        [self.view addSubview:currentLabel];
        
        currentTextField=[[UITextField alloc] initWithFrame:CGRectMake(45,197,270,40)];
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
        currentTextField.text=[prefscutwght objectForKey:@"currentweight"];
        currentTextField.delegate=self;
        [self.view addSubview:currentTextField];
        
        currentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [currentButton addTarget:self action:@selector(updateWeight)forControlEvents:UIControlEventTouchUpInside];
        currentButton.frame = CGRectMake(100,250,155,40);
        
        [currentButton setBackgroundImage: [UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
        [currentButton setTitle:@"UPDATE" forState:UIControlStateNormal];
        [currentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        currentButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
        [self.view addSubview:currentButton];
        
        goalLabel = [[UILabel alloc] initWithFrame:CGRectMake(70,337,280,32)];
        goalLabel.backgroundColor = [UIColor clearColor];
        goalLabel.text=@"Update Goal";
        goalLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * font = [goalLabel.font.fontDescriptor
                                    fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                    | UIFontDescriptorTraitItalic];
        goalLabel.font = [UIFont fontWithDescriptor:font size:30];
        [self.view addSubview:goalLabel];
        
        goalTextField=[[UITextField alloc] initWithFrame:CGRectMake(45,389,270,40)];
        goalTextField.borderStyle = UITextBorderStyleRoundedRect;
        goalTextField.backgroundColor=[UIColor whiteColor];
        goalTextField.text=[prefsgolwght objectForKey:@"goalweight"];
        goalTextField.tag=1;
        goalTextField.placeholder=@"Select Weigh Class";
        goalTextField.delegate=self;
        [self.view addSubview:goalTextField];
        
        goalButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [goalButton addTarget:self action:@selector(updateWeight)forControlEvents:UIControlEventTouchUpInside];
        goalButton.frame = CGRectMake(100,442,155,40);
        
        [goalButton setBackgroundImage: [UIImage imageNamed:@"btnbg.png"] forState:UIControlStateNormal];
        [goalButton setTitle:@"UPDATE" forState:UIControlStateNormal];
        [goalButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        goalButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:22];
        [self.view addSubview:goalButton];

    }
        backBtn= [[UIButton alloc] initWithFrame:CGRectMake(5,15,50,50)];
        [backBtn setBackgroundImage: [UIImage imageNamed:@"back1.png"] forState:UIControlStateNormal];
        [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        backBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:25];
        [backBtn addTarget:self action:@selector(backAction)forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:backBtn];
        [self.view addSubview:activityIndicator];
        [self.view bringSubviewToFront:activityIndicator];

    }
    currentTextField.text=[prefscutwght objectForKey:@"currentweight"];
    goalTextField.text=[prefsgolwght objectForKey:@"goalweight"];

  }
- (void) threadStartAnimating:(id)data {
    [activityIndicator startAnimating];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat yzheight = [UIScreen mainScreen].bounds.size.height;
    activityIndicator.center = CGPointMake(width / 2.0,yzheight/ 2.0);
    
}
-(void)doneWithNumberPad{
    [currentTextField resignFirstResponder];
}
-(IBAction)updateWeight{
    
    goalwght=goalTextField.text;
    NSString *curweight =[[NSString alloc]init];
    curweight=currentTextField.text;
    NSArray* foo = [goalwght componentsSeparatedByString: @"-"];
    NSArray* fooss = [goalwght componentsSeparatedByString: @" "];
    NSString* firstBits = [fooss objectAtIndex:[foo count]-1];
    NSArray* difarr = [firstBits componentsSeparatedByString: @"-"];
    NSString* firstBitd = [difarr objectAtIndex:[foo count]-2];
    NSString* firstBit = [foo objectAtIndex:[foo count]-1];
    int dif1 = [curweight intValue];
    int dif2 = [firstBitd intValue];
    int dif3 = [curweight intValue];
    int dif4 = [firstBit intValue];
    int difdec=dif2-10;
    int difinc=dif4+10;
    if(dif1>=dif2 && dif3<=dif4)
    {
        Reachability *myNetwork = [Reachability reachabilityWithHostname:@"google.com"];
        NetworkStatus myStatus = [myNetwork currentReachabilityStatus];
        if(myStatus == NotReachable)
        {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"No internet connection available!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            [activityIndicator stopAnimating];
        }else{

        [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
        NSURL *url;
        NSMutableString *httpBodyString;
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        httpBodyString=[[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"userid=%@&currentweight=%@&goalweight=%@&type=made",[prefs objectForKey:@"loggedin"],currentTextField.text,goalTextField.text]];
        NSString *urlString = [[NSString alloc]initWithFormat:@"http://millionairesorg.com/fanweighin/postweightdetails.php"];
        url=[[NSURL alloc] initWithString:urlString];
        NSMutableURLRequest *urlRequest=[NSMutableURLRequest requestWithURL:url];
        
        [urlRequest setHTTPMethod:@"POST"];
        [urlRequest setHTTPBody:[httpBodyString dataUsingEncoding:NSISOLatin1StringEncoding]];
        
        [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
            // your data or an error will be ready here
            if (error)
            {
                NSLog(@"Failed to submit request");
                [activityIndicator stopAnimating];
            }
            else
            {
                NSString *content = [[NSString alloc]  initWithBytes:[data bytes]
                                                              length:[data length] encoding: NSUTF8StringEncoding];
                if ([content isEqualToString:@"success"]) {
                    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"FaninWeight" message:@"Profile update successfully!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];
                }
                
            }
            [activityIndicator stopAnimating];
        }];
    }
    }else if (dif1>=difdec && dif3<=difinc){
        Reachability *myNetwork = [Reachability reachabilityWithHostname:@"google.com"];
        NetworkStatus myStatus = [myNetwork currentReachabilityStatus];
        if(myStatus == NotReachable)
        {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"No internet connection available!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            [activityIndicator stopAnimating];
        }else{

        [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
            NSURL *url;
            NSMutableString *httpBodyString;
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            httpBodyString=[[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"userid=%@&currentweight=%@&goalweight=%@&type=close",[prefs objectForKey:@"loggedin"],currentTextField.text,goalTextField.text]];
            NSString *urlString = [[NSString alloc]initWithFormat:@"http://millionairesorg.com/fanweighin/postweightdetails.php"];
            url=[[NSURL alloc] initWithString:urlString];
            NSMutableURLRequest *urlRequest=[NSMutableURLRequest requestWithURL:url]; 
            
            [urlRequest setHTTPMethod:@"POST"];
            [urlRequest setHTTPBody:[httpBodyString dataUsingEncoding:NSISOLatin1StringEncoding]];
            
            [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                // your data or an error will be ready here
                if (error)
                {
                    NSLog(@"Failed to submit request");
                    [activityIndicator stopAnimating];
                }
                else
                {
                    NSString *content = [[NSString alloc]  initWithBytes:[data bytes]
                                                                  length:[data length] encoding: NSUTF8StringEncoding];
                    if ([content isEqualToString:@"success"]) {
                        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"FaninWeight" message:@"Profile update successfully!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        [alert show];
                    }

                }
                [activityIndicator stopAnimating];
            }];
        }
}
    else{
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"FaninWeight" message:@"update successfully!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    NSUserDefaults *prefscutwght = [NSUserDefaults standardUserDefaults];
    [prefscutwght setObject:currentTextField.text forKey:@"currentweight"];
    [prefscutwght synchronize];
    
    NSUserDefaults *prefsgolwght = [NSUserDefaults standardUserDefaults];
    [prefsgolwght setObject:goalTextField.text forKey:@"goalweight"];
    [prefsgolwght synchronize];
    [activityIndicator stopAnimating];

}
-(IBAction)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField*)aTextField
{
    [aTextField resignFirstResponder];
    return YES;
}
-(IBAction)doneBtnPresseds{
       goalToolbar.hidden=YES;
       weighPickerView.hidden=YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
   if (textField==goalTextField){
        goalToolbar.hidden=YES;
       
        weighPickerView.hidden=YES;
       
        weighPickerView = [[UIPickerView alloc] init];
        [weighPickerView setDataSource: self];
        [weighPickerView setDelegate: self];
        weighPickerView.backgroundColor = [UIColor whiteColor];
        [weighPickerView setFrame: CGRectMake(0,355,self.view.bounds.size.width,250)];
        weighPickerView.showsSelectionIndicator = YES;
        [weighPickerView selectRow:2 inComponent:0 animated:YES];
        [self.view addSubview: weighPickerView];
        weighPickerView.hidden=NO;
        goalToolbar= [[UIToolbar alloc] initWithFrame:CGRectMake(0,315,self.view.bounds.size.width,44)];
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
    
    else{
        NSLog(@"Other Textfield");
    }
       goalToolbar.hidden=YES;
    weighPickerView.hidden=YES;
    return YES;
}
-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=YES;
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView; {
    return 1;
}
//Rows in each Column

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component; {
    return [weighArray count];
}

-(NSString*) pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [weighArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
{
    goalTextField.text=[NSString stringWithFormat:@"%@",[weighArray objectAtIndex:row]];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
