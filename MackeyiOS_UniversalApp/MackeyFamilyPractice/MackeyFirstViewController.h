//
//  MackeyFirstViewController.h
//  MackeyFamilyPractice
//
//  Created by Wendy Belcher on 11/16/11.
//  Copyright (c) 2011 ReliaLutions, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MackeyFirstViewController : UIViewController <UIAlertViewDelegate> {
    
}


@property (nonatomic,assign) int buttonIndexAction;
@property(nonatomic,strong)  UIAlertView *safariAlert;
@property (nonatomic, retain) IBOutlet UIWebView *webViewCallMe;
@property (weak, nonatomic) IBOutlet UIButton *CallMe;
@property (nonatomic, retain) IBOutlet UIWebView *webViewEmailMe;
@property (weak, nonatomic) IBOutlet UIButton *EmailMe;
@property (nonatomic, retain) IBOutlet UIWebView *webViewHealthConcerns;
@property (nonatomic, retain) IBOutlet UIView *viewHealthConcerns;
@property (weak, nonatomic) IBOutlet UIButton *HealthConcerns;
@property (nonatomic, retain) IBOutlet UIWebView *webViewSampleMenus;
@property (weak, nonatomic) IBOutlet UIButton *SampleMenus;
@property (nonatomic, retain) IBOutlet UIWebView *webViewReadingLabels;
@property (nonatomic, retain) IBOutlet UIWebView *webViewReadingLabelsCalories;
@property (nonatomic, retain) IBOutlet UIWebView *webViewReadingLabelsTotalFat;
@property (nonatomic, retain) IBOutlet UIWebView *webViewReadingLabelsSatFat;
@property (nonatomic, retain) IBOutlet UIWebView *webViewReadingLabelsCholesterol;
@property (nonatomic, retain) IBOutlet UIWebView *webViewReadingLabelsSodium;
@property (nonatomic, retain) IBOutlet UIWebView *webViewReadingLabelsCarbs;
@property (nonatomic, retain) IBOutlet UIWebView *webViewReadingLabelsFiber;
@property (nonatomic, retain) IBOutlet UIWebView *webViewReadingLabelsProtein;
@property (nonatomic, retain) IBOutlet UIWebView *webViewReadingLabelsVitamins;
@property (nonatomic, retain) IBOutlet UIWebView *webViewReadingLabelsDaily;
@property (weak, nonatomic) IBOutlet UIButton *ReadingLabels;
@property (nonatomic, retain) IBOutlet UIWebView *webViewBMICalculator;
@property (weak, nonatomic) IBOutlet UIButton *BMICalculator;
//@property (weak, nonatomic) IBOutlet UITextField *textfield;
//@property (nonatomic, retain) IBOutlet UIView *webViewReadingLabelsInstruct;

- (IBAction)showBMICalculator:(id)sender;
- (IBAction) psudoBackAction:(id)sender;
- (IBAction)showCallMe:(id)sender;
- (IBAction)showEmailMe:(id)sender;
- (IBAction)showHealthConcerns:(id)sender;
- (IBAction)showSampleMenus:(id)sender;
- (IBAction)handleSwipeFrom:(id)recognizer;
- (IBAction)showReadingLabels:(id)sender;
@end
