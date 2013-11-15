//
//  SocialMediaViewController.h
//  MackeyFamilyPractice
//
//  Created by PMStek07 on 30/09/13.
//  Copyright (c) 2013 ReliaLutions, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RNGridMenu.h"
@class  DetailSocialViewController;
@interface SocialMediaViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,RNGridMenuDelegate,UIAlertViewDelegate> {
    DetailSocialViewController *details;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSArray *titleArray;

@end
