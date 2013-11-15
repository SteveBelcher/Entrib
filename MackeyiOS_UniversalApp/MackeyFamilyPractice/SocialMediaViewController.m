//
//  SocialMediaViewController.m
//  MackeyFamilyPractice
//
//  Created by PMStek07 on 30/09/13.
//  Copyright (c) 2013 ReliaLutions, LLC. All rights reserved.
//

#import "SocialMediaViewController.h"
//#import "DetailSocialViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface SocialMediaViewController ()

@end

@implementation SocialMediaViewController
@synthesize tableView,titleArray;
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
    // details = [[DetailSocialViewController alloc]init];
    self.view.backgroundColor=[UIColor colorWithWhite:0.5 alpha:0.7];
    //self.titleArray=[NSArray arrayWithObjects:@"Blog",@"Twitter",@"Facebook",@"Website",nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [self showGrid];
}

- (void)showGrid {
    NSInteger numberOfOptions = 4;
    NSArray *items = @[
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"blogger"] title:@"Blog"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"twitter"] title:@"Twitter"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"facebook"] title:@"Facebook"],
                       [[RNGridMenuItem alloc] initWithImage:[UIImage imageNamed:@"website"] title:@"Website"],
                       
                       ];
    
    RNGridMenu *av = [[RNGridMenu alloc] initWithItems:[items subarrayWithRange:NSMakeRange(0, numberOfOptions)]];
    av.delegate = self;
    //    av.bounces = NO;
    [av showInViewController:self center:CGPointMake(self.view.bounds.size.width/2.f, self.view.bounds.size.height/2.f)];
}


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


int indexnumber;
- (void)gridMenu:(RNGridMenu *)gridMenu willDismissWithSelectedItem:(RNGridMenuItem *)item atIndex:(NSInteger)itemIndex {
    indexnumber=itemIndex;
    // NSLog(@"Dismissed with item %d: %@", itemIndex, item.title);
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Social Media" message:@"This will open the browser window" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    [alert show];
    // [self performSegueWithIdentifier:@"DetailSocialViewController" sender:self];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    NSString *CellIdentifier;
    switch (indexPath.row) {
        case 0:
            CellIdentifier= @"blogCell";
            break;
        case 1:
            CellIdentifier = @"twitterCell";
            break;
        case 2:
            CellIdentifier = @"facebookCell";
            break;
        case 3:
            CellIdentifier = @"websiteCell";
            break;
        default:
            CellIdentifier = @"blogCell";
            break;
    }
    
    //static NSString *CellIdentifier = @"newFriendCell";
    cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // [self performSegueWithIdentifier:@"DetailSocialViewController" sender:self];
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
}

#pragma  mark UIALertview Delegate Method

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==1) {
        switch (indexnumber) {
            case 0:
                
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://mackeyfamilypractice.blogspot.com"]]];
                break;
            case 1:
                
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://twitter.com/MackeyFamPrac"]]];
                
                break;
            case 2:
                
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.facebook.com/pages/Mackey-Family-Practice/190251171000369"]]];
                
                break;
            case 3:
                
                
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.mackeyfamilypractice.com"]]];
                
                break;
            default:
                break;
        }
    }
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    return (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown);
}

@end
