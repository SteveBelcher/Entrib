//
//  MackeyAppDelegate.h
//  MackeyFamilyPractice
//
//  Created by Wendy Belcher on 11/16/11.
//  Copyright (c) 2011 ReliaLutions, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MackeyAppDelegate : UIResponder <UIApplicationDelegate> {
    
    IBOutlet UIWindow *window;
    UIViewController *mviewController;
}

//- (void)applicationDidFinishLaunching:(UIApplication *)application;
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) UIViewController *mviewController;

@end