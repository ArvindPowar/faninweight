//
//  WorkoutViewController.m
//  FanWeighIn
//
//  Created by arvind on 8/6/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import "WorkoutViewController.h"
#import "Reachability.h"
@interface WorkoutViewController ()

@end

@implementation WorkoutViewController
@synthesize fanImageView;
@synthesize workoutLabel;
@synthesize descriptionView,backBtn,activityIndicator;
- (void)viewDidLoad {
    [super viewDidLoad];
    [activityIndicator stopAnimating];
    self.navigationController.navigationBarHidden=YES;
   
    UIGraphicsBeginImageContext(self.view.frame.size);
    
    [[UIImage imageNamed:@"bg1.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    WorkoutViewController *work;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        work=[[WorkoutViewController alloc] initWithNibName:@"WorkoutViewController~ipad" bundle:nil];
        
        
    }else
    {
        backBtn= [[UIButton alloc] initWithFrame:CGRectMake(5,15,50,50)];
        [backBtn setBackgroundImage: [UIImage imageNamed:@"back1.png"] forState:UIControlStateNormal];
        [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        backBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:25];
        [backBtn addTarget:self action:@selector(backAction)forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:backBtn];
    if(height>=480 && height<568){
        fanImageView=[[UIImageView alloc] initWithFrame:CGRectMake(40,5, 285,100)];
        
        UIImage *imageFan = [UIImage imageNamed: @"fanweighinlogo.png"];
        
        [fanImageView setImage:imageFan];
        [self.view addSubview:fanImageView];
        
        workoutLabel = [[UILabel alloc] initWithFrame:CGRectMake(75,115,300,36)];
        workoutLabel.backgroundColor = [UIColor clearColor];
        workoutLabel.text=@"Training Camp";
        workoutLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * font = [workoutLabel.font.fontDescriptor
                                   fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                   | UIFontDescriptorTraitItalic];
        workoutLabel.font = [UIFont fontWithDescriptor:font size:25];
        [self.view addSubview:workoutLabel];
        
        descriptionView = [[UITextView alloc] initWithFrame:CGRectMake(25, 165,280, 300)];
        //descriptionView.text = @"Today's workout description will be here in the textbox and will be updated daily with a schedule release time daily for 4am.";
        //fhfdescriptionView.userInteractionEnabled=NO;
        descriptionView.layer.borderColor=[[UIColor grayColor]CGColor];
        descriptionView.layer.borderWidth=2.0;
        descriptionView.layer.cornerRadius=8;
        descriptionView.scrollEnabled = YES;
        self.descriptionView.delegate = self;
        descriptionView.font = [UIFont italicSystemFontOfSize:20.0f];
        descriptionView.backgroundColor=[UIColor grayColor];
        [self.view addSubview:descriptionView];
    
    }else if(height>=568 && height<600){

    fanImageView=[[UIImageView alloc] initWithFrame:CGRectMake(40,5, 285,100)];
    UIImage *imageFan = [UIImage imageNamed: @"fanweighinlogo.png"];
    [fanImageView setImage:imageFan];
    [self.view addSubview:fanImageView];
    
    workoutLabel = [[UILabel alloc] initWithFrame:CGRectMake(75,130,300,36)];
    workoutLabel.backgroundColor = [UIColor clearColor];
    workoutLabel.text=@"Training Camp";
    workoutLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * font = [workoutLabel.font.fontDescriptor
                                   fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                   | UIFontDescriptorTraitItalic];
        workoutLabel.font = [UIFont fontWithDescriptor:font size:27];
    [self.view addSubview:workoutLabel];
    
   descriptionView = [[UITextView alloc] initWithFrame:CGRectMake(25, 185,280, 350)];
    //descriptionView.text = @"Today's workout description will be here in the textbox and will be updated daily with a schedule release time daily for 4am.";
    //fhfdescriptionView.userInteractionEnabled=NO;
    descriptionView.layer.borderColor=[[UIColor grayColor]CGColor];
    descriptionView.layer.borderWidth=2.0;
    descriptionView.layer.cornerRadius=8;
        descriptionView.scrollEnabled = YES;
        self.descriptionView.delegate = self;
        descriptionView.font = [UIFont italicSystemFontOfSize:20.0f];
    descriptionView.backgroundColor=[UIColor grayColor];
    [self.view addSubview:descriptionView];
    }else{
        fanImageView=[[UIImageView alloc] initWithFrame:CGRectMake(45,5, 320,100)];
        
        UIImage *imageFan = [UIImage imageNamed: @"fanweighinlogo.png"];
        
        [fanImageView setImage:imageFan];
        [self.view addSubview:fanImageView];
        
        workoutLabel = [[UILabel alloc] initWithFrame:CGRectMake(25,135,280,36)];
        workoutLabel.backgroundColor = [UIColor clearColor];
        workoutLabel.text=@"Training Camp";
        workoutLabel.textColor=[UIColor whiteColor];
        UIFontDescriptor * font = [workoutLabel.font.fontDescriptor
                                   fontDescriptorWithSymbolicTraits:UIFontDescriptorTraitBold
                                   | UIFontDescriptorTraitItalic];
        workoutLabel.font = [UIFont fontWithDescriptor:font size:30];
        [self.view addSubview:workoutLabel];
        
        descriptionView = [[UITextView alloc] initWithFrame:CGRectMake(25, 185,280, 350)];
        //descriptionView.text = @"Today's workout description will be here in the textbox and will be updated daily with a schedule release time daily for 4am.";
        descriptionView.userInteractionEnabled=NO;
        descriptionView.layer.borderColor=[[UIColor grayColor]CGColor];
        descriptionView.layer.borderWidth=2.0;
        descriptionView.layer.cornerRadius=8;
        descriptionView.scrollEnabled = YES;
        self.descriptionView.delegate = self;
        descriptionView.font = [UIFont italicSystemFontOfSize:20.0f];
        descriptionView.backgroundColor=[UIColor clearColor];
        [self.view addSubview:descriptionView];
    }
    }
    [self getData];
    [self.view addSubview:activityIndicator];
    [self.view bringSubviewToFront:activityIndicator];
    }

- (void)scrollToCaretInTextView:(UITextView *)textView animated:(BOOL)animated
{
    CGRect rect = [textView caretRectForPosition:textView.selectedTextRange.end];
    rect.size.height += textView.textContainerInset.bottom;
    [descriptionView scrollRectToVisible:rect animated:animated];
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([descriptionView.text hasSuffix:@"\n"]) {
        [CATransaction setCompletionBlock:^{
            [self scrollToCaretInTextView:descriptionView animated:NO];
        }];
    }
    else
    {
        [self scrollToCaretInTextView:descriptionView animated:NO];
    }
    [descriptionView resignFirstResponder];
}
-(void)getData{
    Reachability *myNetwork = [Reachability reachabilityWithHostname:@"google.com"];
    NetworkStatus myStatus = [myNetwork currentReachabilityStatus];
    if(myStatus == NotReachable)
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"No internet connection available!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [activityIndicator stopAnimating];
    }else{

    [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];

    NSString *urlString = [[NSString alloc]initWithFormat:@"http://millionairesorg.com/fanweighin/workoutdetails.php"];
    NSData *mydata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    NSString *content = [[NSString alloc]  initWithBytes:[mydata bytes]
                                                  length:[mydata length] encoding: NSUTF8StringEncoding];
    descriptionView.text = content;
    [activityIndicator stopAnimating];
}
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) threadStartAnimating:(id)data {
    [activityIndicator startAnimating];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat yzheight = [UIScreen mainScreen].bounds.size.height;
    activityIndicator.center = CGPointMake(width / 2.0,yzheight/ 2.0);
    
}
-(IBAction)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField*)aTextField
{
    [aTextField resignFirstResponder];
    return YES;
}
-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=YES;

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
