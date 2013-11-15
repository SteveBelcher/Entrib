//
//  MackeySecondViewController.m
//  MackeyFamilyPractice
//
//  Created by Wendy Belcher on 11/16/11.
//  Copyright (c) 2011 ReliaLutions, LLC. All rights reserved.
//

#import "MackeySecondViewController.h"

@implementation MackeySecondViewController
@synthesize weightTextFiled,heightTextfield1,heightTextfield2,prevItem,nextItem;
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    //weightTextFiled = [[UITextField alloc]init];
    self.weightTextFiled.delegate = self;
    bmi.text=@"0.0";
    weight.text=@"0";
    height.text=@"0";
    heightInches.text=@"0";
    
    NSString *deviceType = [UIDevice currentDevice].model;
    
    if([deviceType isEqualToString:@"iPhone"])
    {
        // custom next ,previous, done button for numbr keyPAD
        UIToolbar *toolbar = [[UIToolbar alloc] init];
        [toolbar setBarStyle:UIBarStyleBlackTranslucent];
        [toolbar sizeToFit];
        
        prevItem = [[UIBarButtonItem alloc] initWithTitle:@"Prev" style:UIBarButtonItemStyleBordered target:self action:@selector(prevButton:)];
        
        nextItem = [[UIBarButtonItem alloc]  initWithTitle:@"Next" style:UIBarButtonItemStyleBordered target:self action:@selector(nextButton:)];
        
        // UIBarButtonItem *prevButton = [[UIBarButtonItem alloc] initWithCustomView:self.segControl];
        UIBarButtonItem *flexableItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:NULL];
        UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButton:)];
        
        NSArray *itemsArray = @[prevItem,nextItem,flexableItem,doneItem];
        
        [toolbar setItems:itemsArray];
        
        self.heightTextfield1.inputAccessoryView = toolbar;
        self.heightTextfield2.inputAccessoryView = toolbar;
        self.weightTextFiled.inputAccessoryView = toolbar;
    }
}

#pragma mark - custom view for number keypad

-(void)prevButton: (id)sender
{
    if ([heightTextfield2 isFirstResponder]){
        [heightTextfield1 becomeFirstResponder];
        [prevItem setEnabled:NO];
        [nextItem setEnabled:YES];
    }
    
    else if ([weightTextFiled isFirstResponder]){
        [heightTextfield2 becomeFirstResponder];
        [prevItem setEnabled:YES];
    }
    
}
-(void)nextButton :(id)sender
{
    if ([heightTextfield1 isFirstResponder]) {
        [nextItem setEnabled:YES];
        [heightTextfield2 becomeFirstResponder];
        
    }else if ([heightTextfield2 isFirstResponder]){
        [nextItem setEnabled:NO];
        [weightTextFiled becomeFirstResponder];
    }
    
}
- (void)doneButton:(id)sender {
    
    if ([heightTextfield1 isFirstResponder]) {
        [heightTextfield1 resignFirstResponder];
    } else if ([heightTextfield2 isFirstResponder]){
        [heightTextfield2 resignFirstResponder];
    } else if ([weightTextFiled isFirstResponder]){
        [weightTextFiled resignFirstResponder];
        [nextItem setEnabled:NO];
    }
    /// [self.weightTextFiled resignFirstResponder];
}

#pragma mark - UITextFieldDelegate methodes

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if ([heightTextfield1 isFirstResponder]) {
        [prevItem setEnabled:NO];
        [nextItem setEnabled:YES];
        
    } else if ([heightTextfield2 isFirstResponder]){
        [prevItem setEnabled:YES];
        [nextItem setEnabled:YES];
        
    } else if ([weightTextFiled isFirstResponder]){
        [nextItem setEnabled:NO];
        [prevItem setEnabled:YES];
    }
    
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if ([heightTextfield1 isFirstResponder]){
        [prevItem setEnabled:NO];
        [nextItem setEnabled:NO];
        
    } else if ([heightTextfield2 isFirstResponder]){
        [prevItem setEnabled:YES];
        [nextItem setEnabled:YES];
        
    } else if ([weightTextFiled isFirstResponder]){
        [prevItem setEnabled:YES];
        [nextItem setEnabled:NO];
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == heightTextfield1) {
        [heightTextfield2 becomeFirstResponder];
    }if (textField == heightTextfield2) {
        [weightTextFiled becomeFirstResponder];
        //  NSLog(@"inch");
    }if (textField == weightTextFiled) {
        [weightTextFiled resignFirstResponder];
    }
    return YES;
}

+ (CGFloat)toolbarHeight {
    // This method will handle the case that the height of toolbar may change in future iOS.
    return 44.f;
}

- (IBAction)heightFeet:(id)sender {
    UITextField *hFeet = (UITextField*) sender;
    // NSLog(@"In heightFeet, num is %@", hFeet.text);
	height.text = hFeet.text;
	[self updateResults];
}

- (IBAction)heightInch:(id)sender {
    //   NSLog (@"Updating Inches");
    UITextField *hInch = (UITextField*) sender;
    // NSLog(@"In heightInch, num is %@", hInch.text);
    heightInches.text = hInch.text;
	[self updateResults];
}

- (IBAction)weightPounds:(id)sender {
    // NSLog (@"Updating Pounds");
    UITextField *wPounds = (UITextField*) sender;
    // NSLog(@"In weightPounds, num is %@", wPounds.text);
	weight.text = wPounds.text;
	[self updateResults];
}

- (void)updateResults{
    bmi.text=@"0.0";
    float h = (12*[height.text floatValue]) + [heightInches.text floatValue];
    float w = [weight.text floatValue];
	float bmiVal = ((w * 703 * 10) / h /h ) / 10;
	NSString *bmiResult = [[NSString alloc]initWithFormat:@"%.1f", bmiVal];
	bmi.text = bmiResult;
	result.text = [self range:bmiVal];
    bmi.textColor = [UIColor redColor];
    bmi.textColor = [self colorText:bmiVal];
    
}

- (IBAction)dismissKeyboard:(id)sender {
    [[self view] endEditing:YES];
}

- (UIColor *) colorText:(float)bmiVal{
    UIColor *theColor;
    
    if(bmiVal <= 12.0){
        theColor = [UIColor blackColor];
    }else if (bmiVal<20.1) {
        theColor = [UIColor blackColor];
    }else if (bmiVal<25.1) {
        theColor = [UIColor colorWithRed:0.15 green:0.55 blue:0.15 alpha:1];
    }else if (bmiVal<30.1) {
        theColor = [UIColor colorWithRed:1 green:0.9 blue:0 alpha:1];
    }else if (bmiVal<36) {
        theColor = [UIColor redColor];
    }else {
        theColor = [UIColor redColor];
    }
    return theColor;
}

- (NSString *) range:(float)bmiVal{
    NSString *theRange;
	return theRange;
}

- (void)viewDidUnload{
    height = nil;
    heightInches = nil;
    weight = nil;
    bmi = nil;
    result = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    return (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown);
}

@end