//
//  UserLIstViewController.m
//  FanWeighIn
//
//  Created by arvind on 8/22/15.
//  Copyright (c) 2015 arvind. All rights reserved.
//

#import "UserLIstViewController.h"
#import "userListVO.h"
#import "Reachability.h"
@interface UserLIstViewController ()

@end

@implementation UserLIstViewController
@synthesize userlistTableView,madeWghtUserlist,closewghtUserList,activityIndicator,appDelegate,currentButton,goalButton,backBtn,fanImageView,usernameLbl,currentWeightLbl,goalWeightLbl,userVO,characters;

- (void)viewDidLoad {
    [super viewDidLoad];
    //[activityIndicator stopAnimating];
    activityIndicator.hidden=NO;
    self.navigationController.navigationBarHidden=YES;
    backBtn= [[UIButton alloc] initWithFrame:CGRectMake(5,13,50,50)];
    [backBtn setBackgroundImage: [UIImage imageNamed:@"back1.png"] forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    backBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:25];
    [backBtn addTarget:self action:@selector(backAction)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    UIGraphicsBeginImageContext(self.view.frame.size);
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [titleLabel setFrame:CGRectMake(70,15,200, 35)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLabel setText:@"USER LIST  DETAILS"];
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.font =[UIFont systemFontOfSize:20];
    [self.view addSubview:titleLabel];

    [[UIImage imageNamed:@"bg1.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    if(height>=480 && height<568){
        
        [usernameLbl setFrame:CGRectMake(10,65,100,25)];
        usernameLbl.textAlignment = NSTextAlignmentCenter;
        [usernameLbl setText:@"USER NAME"];
        usernameLbl.textColor=[UIColor whiteColor];
        usernameLbl.font =[UIFont systemFontOfSize:20];
        [self.view bringSubviewToFront:usernameLbl];
        [self.view addSubview:usernameLbl];
        
        [currentWeightLbl setFrame:CGRectMake(130,65,100,25)];
        currentWeightLbl.textAlignment = NSTextAlignmentCenter;
        [currentWeightLbl setText:@"CURRENT WEIGHT"];
        currentWeightLbl.textColor=[UIColor whiteColor];
        currentWeightLbl.font =[UIFont systemFontOfSize:20];
        [self.view addSubview:currentWeightLbl];

        
        [goalWeightLbl setFrame:CGRectMake(240,65,100,25)];
        goalWeightLbl.textAlignment = NSTextAlignmentCenter;
        [goalWeightLbl setText:@"GOAL WEIGHT"];
        goalWeightLbl.textColor=[UIColor whiteColor];
        goalWeightLbl.font =[UIFont systemFontOfSize:20];
        [self.view addSubview:goalWeightLbl];

        [userlistTableView removeFromSuperview];
        [userlistTableView setFrame:CGRectMake(0, 80, self.view.bounds.size.width, self.view.bounds.size.height-65)];
        //self.userlistTableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainfeeds_bg.png"]];
        [self.view addSubview:userlistTableView];
        }
    else if(height>=568 && height<600)
    {
        [usernameLbl removeFromSuperview];
        usernameLbl=[[UILabel alloc]init];
        [usernameLbl setFrame:CGRectMake(0,60,90,25)];
        usernameLbl.textAlignment = NSTextAlignmentCenter;
        [usernameLbl setText:@"USER NAME"];
        usernameLbl.textColor=[UIColor whiteColor];
        usernameLbl.font =[UIFont systemFontOfSize:13];
        [self.view bringSubviewToFront:usernameLbl];
        [self.view addSubview:usernameLbl];
        
        currentWeightLbl=[[UILabel alloc]init];
        [currentWeightLbl setFrame:CGRectMake(90,60,130,25)];
        currentWeightLbl.textAlignment = NSTextAlignmentCenter;
        [currentWeightLbl setText:@"CURRENT WEIGHT"];
        currentWeightLbl.textColor=[UIColor whiteColor];
        currentWeightLbl.font =[UIFont systemFontOfSize:13];
        [self.view addSubview:currentWeightLbl];
        
        goalWeightLbl=[[UILabel alloc]init];
        [goalWeightLbl setFrame:CGRectMake(220,60,100,25)];
        goalWeightLbl.textAlignment = NSTextAlignmentCenter;
        [goalWeightLbl setText:@"GOAL WEIGHT"];
        goalWeightLbl.textColor=[UIColor whiteColor];
        goalWeightLbl.font =[UIFont systemFontOfSize:13];
        [self.view addSubview:goalWeightLbl];
        [userlistTableView removeFromSuperview];
        [userlistTableView setFrame:CGRectMake(0, 90, self.view.bounds.size.width, self.view.bounds.size.height-90)];
        //self.userlistTableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainfeeds_bg.png"]];
        [self.view addSubview:userlistTableView];
        }
    else
    {
               usernameLbl=[[UILabel alloc]init];
               [usernameLbl setFrame:CGRectMake(0,60,90,25)];
               usernameLbl.textAlignment = NSTextAlignmentCenter;
               [usernameLbl setText:@"USER NAME"];
               usernameLbl.textColor=[UIColor whiteColor];
               usernameLbl.font =[UIFont systemFontOfSize:13];
               [self.view bringSubviewToFront:usernameLbl];
               [self.view addSubview:usernameLbl];
               
               currentWeightLbl=[[UILabel alloc]init];
               [currentWeightLbl setFrame:CGRectMake(90,60,130,25)];
               currentWeightLbl.textAlignment = NSTextAlignmentCenter;
               [currentWeightLbl setText:@"CURRENT WEIGHT"];
               currentWeightLbl.textColor=[UIColor whiteColor];
               currentWeightLbl.font =[UIFont systemFontOfSize:13];
               [self.view addSubview:currentWeightLbl];
               
               goalWeightLbl=[[UILabel alloc]init];
               [goalWeightLbl setFrame:CGRectMake(220,60,100,25)];
               goalWeightLbl.textAlignment = NSTextAlignmentCenter;
               [goalWeightLbl setText:@"GOAL WEIGHT"];
               goalWeightLbl.textColor=[UIColor whiteColor];
               goalWeightLbl.font =[UIFont systemFontOfSize:13];
               [self.view addSubview:goalWeightLbl];

               [userlistTableView removeFromSuperview];
               [userlistTableView setFrame:CGRectMake(0, 90, self.view.bounds.size.width, self.view.bounds.size.height-65)];
               //self.userlistTableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainfeeds_bg.png"]];
               [self.view addSubview:userlistTableView];
    }
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        [userlistTableView removeFromSuperview];
        [userlistTableView setFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height-65)];
        //self.userlistTableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainfeeds_bg.png"]];
        [self.view addSubview:userlistTableView];
        
        
    }
    [self.view addSubview:activityIndicator];
    [self.view bringSubviewToFront:activityIndicator];
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)backAction{
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)getUserData{
    Reachability *myNetwork = [Reachability reachabilityWithHostname:@"google.com"];
    NetworkStatus myStatus = [myNetwork currentReachabilityStatus];
    if(myStatus == NotReachable)
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"PGFH" message:@"No internet connection available!!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [activityIndicator stopAnimating];
    }else{

        [NSThread detachNewThreadSelector:@selector(threadStartAnimating:) toTarget:self withObject:nil];
        NSString *urlString = [[NSString alloc]initWithFormat:@"http://millionairesorg.com/fanweighin/userweightlist.php"];
    
    NSData *mydata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    NSXMLParser *timetableParser = [[NSXMLParser alloc] initWithData:mydata];
    [timetableParser setDelegate:self];
    [timetableParser setShouldProcessNamespaces:NO];
    [timetableParser setShouldReportNamespacePrefixes:NO];
    [timetableParser setShouldResolveExternalEntities:NO];
    
    [timetableParser parse];
    [self.userlistTableView reloadData];
    [activityIndicator stopAnimating];
    NSLog(@"user >>> %@", urlString);
    }
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"userweightdetail"]){
        madeWghtUserlist=[[NSMutableArray alloc] init];
        closewghtUserList=[[NSMutableArray alloc] init];
    }
    else if([elementName isEqualToString:@"userweight"]){
        userVO=[[userListVO alloc] init];
    }
    else if([elementName isEqualToString:@"currentweight"]){
        userVO.currentweight=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"goalweight"]){
        userVO.goalweight=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"username"]){
        userVO.username=[[NSString alloc] init];
    }else if([elementName isEqualToString:@"type"]){
        userVO.type=[[NSString alloc] init];
    }}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    NSString* sItemNameDecorated = [string stringByReplacingOccurrencesOfString:@"â€“" withString:@"-"];
    characters=[[NSString alloc] initWithString:sItemNameDecorated];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if([elementName isEqualToString:@"currentweight"]){
        userVO.currentweight=characters;
    }else if([elementName isEqualToString:@"goalweight"]){
        userVO.goalweight=characters;
    }else if([elementName isEqualToString:@"username"]){
            userVO.username=characters;
    }else if([elementName isEqualToString:@"type"]){
        userVO.type=characters;
            if ([characters isEqualToString:@"close"]) {
                [closewghtUserList addObject:userVO];
            }else{
                [madeWghtUserlist addObject:userVO];
        }
    }
}
-(void)viewDidAppear:(BOOL)animated{
    [self getUserData];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) threadStartAnimating:(id)data {
    [activityIndicator startAnimating];
    activityIndicator.center = CGPointMake(self.view.frame.size.width / 2.0, self.view.frame.size.height / 2.0);
    [self.view addSubview: activityIndicator];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0)
    {
        return [madeWghtUserlist count];
    }
    else{
        return [closewghtUserList count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0)
        return @"             MADE WEIGHT";
    else
        return @"        ClOSE TO MADE WEIGHT";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *MyIdentifier = @"MyIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    
    
    if (indexPath.section==0) {
        userListVO *ulvos=[madeWghtUserlist objectAtIndex:indexPath.row];

        UILabel * userLblName=[[UILabel alloc] initWithFrame:CGRectMake(5,10,90,50)];
        [userLblName setFont:[UIFont systemFontOfSize:16]];
        userLblName.lineBreakMode = NSLineBreakByWordWrapping;
        userLblName.numberOfLines = 0;
        userLblName.text=ulvos.username;
        [cell.contentView addSubview:userLblName];

        UILabel * currentWeightLbls=[[UILabel alloc] initWithFrame:CGRectMake(140,10,100,50)];
        [currentWeightLbls setFont:[UIFont systemFontOfSize:16]];
        currentWeightLbls.lineBreakMode = NSLineBreakByWordWrapping;
        currentWeightLbls.numberOfLines = 0;
        currentWeightLbls.text=ulvos.currentweight;
        [cell.contentView addSubview:currentWeightLbls];
        
        UILabel * goalWeightLbls=[[UILabel alloc] initWithFrame:CGRectMake(210,10,100,50)];
        [goalWeightLbls setFont:[UIFont systemFontOfSize:16]];
        goalWeightLbls.lineBreakMode = NSLineBreakByWordWrapping;
        goalWeightLbls.numberOfLines = 0;
        goalWeightLbls.text=ulvos.goalweight;
        [cell.contentView addSubview:goalWeightLbls];
    }
    else {
        userListVO *ulvo=[closewghtUserList objectAtIndex:indexPath.row];

        UILabel * userLblName=[[UILabel alloc] initWithFrame:CGRectMake(5,10,90,50)];
        [userLblName setFont:[UIFont systemFontOfSize:16]];
        userLblName.lineBreakMode = NSLineBreakByWordWrapping;
        userLblName.numberOfLines = 0;
        userLblName.text=ulvo.username;
        [cell.contentView addSubview:userLblName];
        
        UILabel * currentWeightLbls=[[UILabel alloc] initWithFrame:CGRectMake(140,10,130,50)];
        [currentWeightLbls setFont:[UIFont systemFontOfSize:16]];
        currentWeightLbls.lineBreakMode = NSLineBreakByWordWrapping;
        currentWeightLbls.numberOfLines = 0;
        currentWeightLbls.text=ulvo.currentweight;
        [cell.contentView addSubview:currentWeightLbls];
        
        UILabel * goalWeightLbls=[[UILabel alloc] initWithFrame:CGRectMake(210,10,100,50)];
        [goalWeightLbls setFont:[UIFont systemFontOfSize:16]];
        goalWeightLbls.lineBreakMode = NSLineBreakByWordWrapping;
        goalWeightLbls.numberOfLines = 0;
        goalWeightLbls.text=ulvo.goalweight;
        [cell.contentView addSubview:goalWeightLbls];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
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
