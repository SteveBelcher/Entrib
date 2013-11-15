//
//  LabsViewController.m
//  MackeyFamilyPractice
//
//  Created by PMStek07 on 30/09/13.
//  Copyright (c) 2013 ReliaLutions, LLC. All rights reserved.
//

#import "LabsForIphoneViewController.h"
#import "Reachability.h"

@interface LabsForIphoneViewController ()

- (void) hideHUD;
- (void) showHUD:(NSString *)labelText;

@end

CGFloat view_x_origin;
CGFloat view_x_change_origin;

@implementation LabsForIphoneViewController

@synthesize FirstNameTextField,LastNameTextField,PasswordTextField,ViewForWebView,webViewPDF,Labdata;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    LastNameTextField.delegate = self;
    [ViewForWebView setHidden:YES];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)BtnClose:(id)sender {
    [ViewForWebView setHidden:YES];
    FirstNameTextField.text=@"";
    LastNameTextField.text=@"";
    PasswordTextField.text=@"";
}

- (IBAction)ViewLabsButtonAction:(id)sender {
    
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus internateStatus = [reach currentReachabilityStatus];
    if ((internateStatus != ReachableViaWiFi) && (internateStatus != ReachableViaWWAN)){
        /// Create an alert if connection doesn't work
        UIAlertView *myAlert = [[UIAlertView alloc]
                                initWithTitle:@"No Internet Connection"
                                message:@"You require an internet connection via WiFi or cellular network for location finding to work."
                                delegate:self
                                cancelButtonTitle:@"Ok"
                                otherButtonTitles:nil];
        [myAlert show];
    } else{
        
        if (FirstNameTextField.text.length!=0 && PasswordTextField.text.length!=0 && LastNameTextField.text.length!=0) {
            
            str = [NSString stringWithFormat:@"FirstName=%@&LastName=%@&password=%@",FirstNameTextField.text,LastNameTextField.text,PasswordTextField.text];
            // str = @"FirstName=John&LastName=Doe&password=HS8814672";
            
            str=[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            NSData *postData = [str dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
            NSString *postLength = [NSString stringWithFormat:@"%d",[postData length]];
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
            //[request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.mfphealthscan.com/viewreport.asp"]]];
            [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://www.mfphealthscan.com/Mackey/viewmylabs_searchLimited.asp"]]];
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [request setValue:@"application/pdf" forHTTPHeaderField:@"Current-Type"];
            [request setHTTPBody:postData];
            NSURLConnection *conn = [[NSURLConnection alloc]initWithRequest:request delegate:self];
            Labdata =[[NSMutableData alloc]init];
            
            if(conn){
                // NSLog(@"Connection Successful");
                
            } else {
                // NSLog(@"Connection could not be made");
                
            }
            
            loadStarted = NO;
            [self showHUD:@"Loading......"];
        } else{
            UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Please fill up the required field" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertview show];
        }
        [self.PasswordTextField resignFirstResponder];
    }
    
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationBeginsFromCurrentState:YES];
    
    self.view.frame = CGRectMake(0, view_x_origin, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView commitAnimations];
    
}

#pragma mark textFieldMethods

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if (textField == LastNameTextField) {
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationBeginsFromCurrentState:YES];
        self.view.frame = CGRectMake(0,view_x_change_origin, self.view.frame.size.width, self.view.frame.size.height);
        [UIView commitAnimations];
    }
    return YES;
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    return YES;
}
//shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField == FirstNameTextField) {
        [self.LastNameTextField becomeFirstResponder];
        
    } else if(textField == LastNameTextField) {
        [self.PasswordTextField becomeFirstResponder];
        
    } else if(textField == PasswordTextField) {
        
        [self.PasswordTextField resignFirstResponder];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationBeginsFromCurrentState:YES];
        
        self.view.frame = CGRectMake(0, view_x_origin, self.view.frame.size.width, self.view.frame.size.height);
        
        [UIView commitAnimations];
    }
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
}

#pragma mark HUD

- (void) showHUD:(NSString *)labelText {
    if (HUD == nil) {
        HUD = [[MBProgressHUD alloc] initWithView:self.view];
    }
    
    [self.view addSubview:HUD];
    HUD.labelText = labelText;
    HUD.labelFont = [UIFont boldSystemFontOfSize:12];
    [HUD show:YES];
}

- (void) hideHUD {
    
    if (HUD != nil) {
        [HUD hide:YES];
    }
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    if(!loadStarted){
        
    }
    
    return YES;
}

#pragma mark Nsurl Connection Method

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData*)data{
    [self.Labdata appendData:data];
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
    //    NSLog(@"%@" ,[ error description]);
    [self hideHUD];
    UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"Network Error" message:@"Unable to connect to server" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertview show];
    
}

NSString *mime;
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    mime = [response MIMEType];
    //do something with mime
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    //    NSString *contents = [[NSString alloc]initWithData:Labdata encoding:NSASCIIStringEncoding];
    
    // NSLog(@"%@",contents);
    [ViewForWebView setHidden:NO];
    [webViewPDF clearsContextBeforeDrawing];
    
    [webViewPDF loadData:Labdata MIMEType:mime textEncodingName:@"utf-8" baseURL:nil];
    
}

#pragma mark WebViewDelegate Methods

- (void)webViewDidStartLoad:(UIWebView *)webView {
    if(loaerRunning == FALSE) {
        
        //[self showHUD:@"Please wait...Loading."];
    }
    
    loadStarted = YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    // [self hideHUD];
    // showLoader = FALSE;
    //loadStarted = NO;
    [self hideHUD];
    
}

-(void)SettingDataToWebview {
    HUD = nil;
    if(HUD == nil){
        
        HUD = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:HUD];
        HUD.delegate = self;
        HUD.labelText = @"Loading...";
        showLoader = TRUE;
        loaerRunning = FALSE;
        
    }
    
}

- (void)myTask {
    loaerRunning = TRUE;
    while (showLoader == TRUE) {
        sleep(1);
    }
}

- (NSUInteger)supportedInterfaceOrientations {
    
    [self doChangeCoordinate:[[UIApplication sharedApplication] statusBarOrientation]];
    [self doChangeCoordinate:(UIInterfaceOrientation)[[UIDevice currentDevice] orientation]];
    
    //this should be the mask of the orientations you support , see the header files of other possibilities
    return (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown);
    
}

-(BOOL)shouldAutorotate {
    //wether your VC supports rotation at all, none of the above will run if this returns NO
    [self doChangeCoordinate:[[UIApplication sharedApplication] statusBarOrientation]];
    [self doChangeCoordinate:(UIInterfaceOrientation)[[UIDevice currentDevice] orientation]];
    return YES;
}

-(void)doChangeCoordinate:(UIInterfaceOrientation) toInterfaceOrientation {
    
    if (toInterfaceOrientation==UIInterfaceOrientationPortrait) {
        view_x_origin=20;
        view_x_change_origin=-50;
    }
    if (toInterfaceOrientation==UIInterfaceOrientationPortraitUpsideDown) {
        view_x_origin=0;
        view_x_change_origin=50;
    }
}

@end