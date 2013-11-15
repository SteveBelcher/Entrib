//
//  tabBarViewController.m
//  MackeyFamilyPractice
//
//  Created by Admin on 06/11/13.
//  Copyright (c) 2013 ReliaLutions, LLC. All rights reserved.
//

#import "tabBarViewController.h"

@interface tabBarViewController ()

@end

@implementation tabBarViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)shouldAutorotate {
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //Return YES for supported orientations for both iPhone and iPad
    if (([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) || ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) ) {
        return ((interfaceOrientation != UIInterfaceOrientationLandscapeRight) && (interfaceOrientation != UIInterfaceOrientationLandscapeLeft));
    } else {
        return YES;
    }
}

- (NSUInteger)supportedInterfaceOrientations {
    return (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown);
}

@end
