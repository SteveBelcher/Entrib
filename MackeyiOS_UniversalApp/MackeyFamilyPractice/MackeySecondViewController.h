//
//  MackeySecondViewController.h
//  MackeyFamilyPractice
//
//  Created by Wendy Belcher on 11/16/11.
//  Copyright (c) 2011 ReliaLutions, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MackeySecondViewController : UIViewController<UITextFieldDelegate>{
    IBOutlet UILabel *height;
    IBOutlet UILabel *heightInches;
    IBOutlet UILabel *weight;
    IBOutlet UILabel *bmi;
    IBOutlet UILabel *result;
    
}

- (NSString *) range:(float)bmiVal;
@property (strong, nonatomic) IBOutlet UITextField *weightTextFiled;
@property (strong, nonatomic) IBOutlet UITextField *heightTextfield1;
@property (strong, nonatomic) IBOutlet UITextField *heightTextfield2;
@property (strong, nonatomic) UIBarButtonItem *prevItem,*nextItem;

- (IBAction)heightFeet:(id)sender;
- (IBAction)heightInch:(id)sender;
- (IBAction)weightPounds:(id)sender;
- (void)updateResults;
- (IBAction)dismissKeyboard:(id)sender;

@end
