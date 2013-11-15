//
//  AppointmentCurliPhoneViewController.m
//  MackeyFamilyPractice
//
//  Created by PMSTEK_Dev4 on 22/10/13.
//  Copyright (c) 2013 ReliaLutions, LLC. All rights reserved.
//

#import "AppointmentCurliPhoneViewController.h"

@interface AppointmentCurliPhoneViewController ()

@end

@implementation AppointmentCurliPhoneViewController
@synthesize txtDate,txtDOB,txtEmail,txtName,txtPhone,txtPickerVisit,txtProvider,txtVisit;
@synthesize pickerViewProvider,providerArray,pickerDate,pickerViewVisit,visitArray,scrollView,viewForPickers;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NSLog(@"Iphone %f ",[[UIScreen mainScreen] bounds].size.height);
    if ([[UIScreen mainScreen] bounds].size.height == 568) {
        
        viewForPickers.frame=CGRectMake(0, 385, 320, 162);
        //scrollView.contentSize=CGSizeMake(320, 300);
        dateScrollSize=200;
        txtVisitScrollSize=200;
        
    } else {
        viewForPickers.frame=CGRectMake(0, 298, 320, 162);
        dateScrollSize=250;
        txtVisitScrollSize=260;
    }
    
    scrollView.contentSize=CGSizeMake(320, 600);
    providerArray=[self getDataFromPlist:@"provider"];
    visitArray=[self getDataFromPlist:@"visit"];
    
    [pickerViewProvider setHidden:YES];
    [pickerDate setHidden:YES];
    [pickerViewVisit setHidden:YES];
    [viewForPickers setHidden:YES];
    //[pickerDate setDatePickerMode:UIDatePickerModeDateAndTime];
    [pickerDate setMinimumDate:[NSDate date]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide) name:UIKeyboardWillHideNotification object:nil];
    // txtDate.text=[NSString stringWithFormat:@"%@",pickerDate.date];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark textfield method

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if (textField==txtDate) {
        [self actionForDate:nil];
        
    } else if (textField==txtPickerVisit) {
        [self actionForVisit:nil];
        
    } else if( textField==txtProvider) {
        [self actionForProvider:nil];
        
    }
    
    if(textField==txtDate || textField==txtPickerVisit || textField==txtProvider){
        return NO;
        
    } else {
        
        if (textField==txtVisit) {
            [self.scrollView setContentOffset:CGPointMake(0, txtVisitScrollSize) animated:YES];
        }else{
            [self.scrollView setContentOffset:CGPointMake(0, 80) animated:YES];
        }
        
        [viewForPickers setHidden:YES];
        [pickerViewProvider setHidden:YES];
        [pickerDate setHidden:YES];
        [pickerViewVisit setHidden:YES];
        // [self viewUP];
        return YES;
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    // [self viewDown];
    if (textField == txtName) {
        [txtDOB becomeFirstResponder];
        
    } else if (textField == txtDOB) {
        [txtPhone becomeFirstResponder];
        
    } else if (textField == txtPhone) {
        [txtEmail becomeFirstResponder];
        
    } else if (textField == txtEmail) {
        
        [txtEmail resignFirstResponder];
    } else if (textField == txtVisit) {
        
        [txtVisit resignFirstResponder];
    }
    
    return YES;
}

-(void)keyboardWillHide {
    // [self viewDown];
    
}

-(void)viewUP {
    
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationBeginsFromCurrentState:YES];
    self.view.frame = CGRectMake(0, -60, self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
    
}

-(void)viewDown {
    
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationBeginsFromCurrentState:YES];
    self.view.frame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
    
}

#pragma mark Picker View Methods
// returns the number of 'columns' to display.

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
    
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (pickerView==pickerViewVisit) {
        return [visitArray count];
        
    }else
        return [providerArray count];
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (pickerView==pickerViewVisit) {
        return [visitArray objectAtIndex:row];
        
    }else
        return [providerArray objectAtIndex:row];
    
}

-(NSArray*)getDataFromPlist:(NSString*)_fileName {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:_fileName ofType:@"plist"];
    NSArray *contentArray = [NSArray arrayWithContentsOfFile:path];
    
    return contentArray;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (pickerView==pickerViewProvider) {
        txtProvider.text=[providerArray objectAtIndex:row];
    }else
        txtPickerVisit.text=[visitArray objectAtIndex:row];
    
}


#pragma mark Button Action Method

- (IBAction)actionForDatePicker:(id)sender {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MMM dd"];
    NSString *theDate = [dateFormat stringFromDate:pickerDate.date];
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"HH:mm"]; //24hr time format
    NSString *timeString = [outputFormatter stringFromDate:self.pickerDate.date];
    
    txtDate.text=[NSString stringWithFormat:@"%@ %@",theDate,timeString];
}

- (IBAction)actionForProvider:(id)sender {
    //  [self viewUP];
    [self.scrollView setContentOffset:CGPointMake(0, 130) animated:YES];
    [self.view bringSubviewToFront:viewForPickers];
    [viewForPickers setHidden:NO];
    [pickerViewProvider setHidden:NO];
    [pickerDate setHidden:YES];
    [pickerViewVisit setHidden:YES];
    [txtName resignFirstResponder];
    [txtDOB resignFirstResponder];
    [txtEmail resignFirstResponder];
    [txtPhone resignFirstResponder];
    [txtVisit resignFirstResponder];
    
}

- (IBAction)actionForDate:(id)sender {
    //  [self viewUP];
    [self.view bringSubviewToFront:viewForPickers];
    [self.scrollView setContentOffset:CGPointMake(0, dateScrollSize) animated:YES];
    [viewForPickers setHidden:NO];
    [pickerViewProvider setHidden:YES];
    [pickerDate setHidden:NO];
    [pickerViewVisit setHidden:YES];
    [txtName resignFirstResponder];
    [txtDOB resignFirstResponder];
    [txtEmail resignFirstResponder];
    [txtPhone resignFirstResponder];
    [txtVisit resignFirstResponder];
    
}

- (IBAction)actionForVisit:(id)sender {
    //  [self viewUP];
    [self.view bringSubviewToFront:viewForPickers];
    [self.scrollView setContentOffset:CGPointMake(0, dateScrollSize) animated:YES];
    [viewForPickers setHidden:NO];
    [pickerViewProvider setHidden:YES];
    [pickerDate setHidden:YES];
    [pickerViewVisit setHidden:NO];
    [txtName resignFirstResponder];
    [txtDOB resignFirstResponder];
    [txtEmail resignFirstResponder];
    [txtPhone resignFirstResponder];
    [txtVisit resignFirstResponder];
    
}

- (IBAction)actionForSubmit:(id)sender {
    //[self viewDown];
    [viewForPickers setHidden:YES];
    [pickerViewProvider setHidden:YES];
    [pickerDate setHidden:YES];
    [pickerViewVisit setHidden:YES];
    [txtName resignFirstResponder];
    [txtDOB resignFirstResponder];
    [txtEmail resignFirstResponder];
    [txtPhone resignFirstResponder];
    [txtVisit resignFirstResponder];
    
    if (txtName.text.length!=0 && txtDOB.text.length!=0 && txtEmail.text.length!=0 && txtPhone.text.length!=0 ) {
        
        if(![self NSStringIsValidEmail:txtEmail.text]) {
            UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Please valid email address" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertview show];
            
        } else{
            [self sentMail];
            
        }
    } else {
        
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Please fill up the required field" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertview show];
        
    }
    
}

#pragma mark Mail Composer Delegate Methods
// Delegate ...Dismisses the email composition interface when users tap Cancel or Send. Proceeds to update the message field with the result of the operation.

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
	// Notifies users about errors associated with the interface
	switch (result) {
            
		case MFMailComposeResultCancelled:
			break;
		case MFMailComposeResultSaved:
			break;
		case MFMailComposeResultSent:{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success! A message was sent." message:@"Thank you for choosing \n Mackey Family Practice. \n We will respond to your request \n within 24 Hours" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
			break;
		case MFMailComposeResultFailed:{
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed" message:@"Your Mail has been Not delivered successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
            
        }
			break;
		default:
			break;
	}
    
	[self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)sentMail {
    
    if ([MFMailComposeViewController canSendMail]) {
        
        MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc] init];
        
        mailComposer.mailComposeDelegate = self;
        
        [mailComposer setToRecipients:[NSArray arrayWithObjects:  @"appointments@mackeyfamilypractice.com",nil]];
        
        [mailComposer setCcRecipients:[NSArray arrayWithObjects:  @"generalappt@mackeyfamilypractice.com",nil]];
        
        [mailComposer setBccRecipients:[NSArray arrayWithObjects:  @"info@relialutions.com",nil]];
        
        [mailComposer setSubject:[NSString stringWithFormat: @"Appointment Request"]];
        NSMutableString *comment=[[NSMutableString alloc]init];
        if (txtVisit.text.length==0) {
            [comment appendString:@"None"];
            
        }else {
            [comment appendFormat:@"%@",txtVisit.text];
            
        }
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"MMM dd"];
        NSString *theDate = [dateFormat stringFromDate:pickerDate.date];
        NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
        [outputFormatter setDateFormat:@"HH:mm"]; //24hr time format
        NSString *timeString = [outputFormatter stringFromDate:self.pickerDate.date];
        
        // supportText = [supportText stringByAppendingString: @"Please describe your problem or question."];
        
        NSString *supportText = [NSString stringWithFormat:@" <HTML><Body> <B> Name : </B> %@<br><B> Email : </B> %@<br><B> Birthdate : </B> %@<br> <B> Daytime Phone : </B> %@<br> <B> Requested Provider : </B> %@<br><B> Requested Appointment Date : </B> %@<br><B> Requested Appointment Time : </B> %@<br><B> Purpose of Visit : </B> %@<br><B> Additinal Comments : </B> %@<br></Body></HTML>",txtName.text,txtEmail.text,txtDOB.text,txtPhone.text,txtProvider.text,theDate,timeString,txtPickerVisit.text,comment];
        [mailComposer setMessageBody:supportText isHTML:YES];
        //[self presentViewController:mailComposer animated:YES completion:nil];
        [self sendEmailTo:@"appointments@mackeyfamilypractice.com" withSubject: @"Appointment Request" withBody:supportText withCC:@"generalappt@mackeyfamilypractice.com" withBCC:@"info@relialutions.com"];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                        message:@"Your device doesn't support the composer sheet"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        [alert show];
    }
}
- (void) sendEmailTo:(NSString *)to withSubject:(NSString *) subject withBody:(NSString *)body withCC:(NSString*)cc withBCC:(NSString*)bcc {
	NSString *mailString = [NSString stringWithFormat:@"mailto:?to=%@&cc=%@&bcc=%@&subject=%@&body=%@",
							[to stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding],
                            [cc stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding],
                            [bcc stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding],
                            
							[subject stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding],
							[body  stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:mailString]];
}

-(BOOL) NSStringIsValidEmail:(NSString *)checkString {
    
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
    
}

- (BOOL)shouldAutorotate {
    return YES;
    
}

- (NSUInteger)supportedInterfaceOrientations {
    return (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown);
    
}

@end
