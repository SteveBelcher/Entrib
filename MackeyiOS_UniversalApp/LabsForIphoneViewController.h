//
//  LabsForIphoneViewController.h
//  MackeyFamilyPractice
//
//  Created by PMStek07 on 17/10/13.
//  Copyright (c) 2013 ReliaLutions, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MBProgressHUD.h"

@interface LabsForIphoneViewController : UIViewController <UITextFieldDelegate,UIWebViewDelegate,MBProgressHUDDelegate> {
    
    MBProgressHUD *HUD;
    NSString *str;
    bool showLoader;
    bool loaerRunning;
    
    BOOL loadStarted;
}

@property (strong,nonatomic) NSMutableData *Labdata;
@property (strong, nonatomic) IBOutlet UIImageView *ImageViewLabs;
@property (strong, nonatomic) IBOutlet UITextField *FirstNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *LastNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *PasswordTextField;
@property (strong, nonatomic) IBOutlet UIButton *ViewLabsButton;
@property (strong, nonatomic) IBOutlet UIWebView *webViewPDF;
@property (strong, nonatomic) IBOutlet UIView *ViewForWebView;

- (IBAction)BtnClose:(id)sender;
- (IBAction)ViewLabsButtonAction:(id)sender;

@end
