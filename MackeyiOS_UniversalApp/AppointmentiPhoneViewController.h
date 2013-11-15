//
//  AppointmentiPhoneViewController.h
//  MackeyFamilyPractice
//
//  Created by Admin on 21/10/13.
//  Copyright (c) 2013 ReliaLutions, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
@interface AppointmentiPhoneViewController : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate,MFMailComposeViewControllerDelegate> {
    float dateScrollSize;
    float txtVisitScrollSize;
}

@property (strong, nonatomic)  NSArray *providerArray;
@property (strong, nonatomic)  NSArray *visitArray;
@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtDOB;
@property (strong, nonatomic) IBOutlet UITextField *txtPhone;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtProvider;
@property (strong, nonatomic) IBOutlet UITextField *txtDate;
@property (strong, nonatomic) IBOutlet UITextField *txtPickerVisit;
@property (strong, nonatomic) IBOutlet UITextField *txtVisit;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerViewProvider;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerViewVisit;
@property (strong, nonatomic) IBOutlet UIView *viewForPickers;
@property (strong, nonatomic) IBOutlet UIDatePicker *pickerDate;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)actionForDatePicker:(id)sender;
- (IBAction)actionForProvider:(id)sender;
- (IBAction)actionForDate:(id)sender;
- (IBAction)actionForVisit:(id)sender;
- (IBAction)actionForSubmit:(id)sender;

@end
