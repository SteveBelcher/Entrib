//
//  MackeyWebViewAppts.m
//  MackeyFamilyPractice
//
//  Created by Wendy Belcher on 1/18/12.
//  Copyright (c) 2012 ReliaLutions, LLC. All rights reserved.
//

#import "MackeyWebViewApptsController.h"
#import "Reachability.h"

@interface MackeyWebViewApptsController()
-(void)hideHUD;
-(void)showHUD:(NSString *)labelText;
@end

@implementation MackeyWebViewApptsController
@synthesize webViewIndicator;
@synthesize webView,webViewFB,webViewAppt,webViewLabs,webViewCall,webViewTips,webViewEmail,webViewTweet,webViewBlog,webViewNews,webViewVideo,webViewSurvey,webViewLabsLg,webViewApptLg;

- (void)awakeFromNib {
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.mackeyfamilypractice.com"]]];
}

- (void)viewDidLoad {
    [super viewDidLoad]; //objWebView is the outlet of UIWebView
    //the more the delay the errors will be less so within 0.1-0.3 would be fine
    [self performSelector:@selector(loadURL:) withObject:nil afterDelay:0.1];
    
}

-(void)viewWillAppear:(BOOL)animated{
    if (webViewAppt) {
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
            [self showHUD:@"Loading..."];
            [webViewAppt stopLoading]; //added this line to stop the previous request
            NSURL *url = [NSURL URLWithString:@"http://www.mackeyfamilypractice.com/appointmentApp.html"];
            NSURLRequest *req = [NSURLRequest requestWithURL:url];
            [webViewAppt loadRequest:req];
        }
    }
    else if (webViewApptLg) {
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
        }else{
            [self showHUD:@"Loading..."];
            [webViewApptLg stopLoading]; //added this line to stop the previous request
            NSURL *url = [NSURL URLWithString:@"http://www.mackeyfamilypractice.com/appointmentAppLg.html"];
            NSURLRequest *req = [NSURLRequest requestWithURL:url];
            [webViewApptLg loadRequest:req];
            //        webViewApptLg.scalesPageToFit = NO;
        }
        
    }
    
}

-(void)loadURL:(id)sender{
    
    if (webViewFB) {
        [webViewFB stopLoading]; //added this line to stop the previous request
        NSURL *url = [NSURL URLWithString:@"http://www.facebook.com/pages/Mackey-Family-Practice/190251171000369"];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [webViewFB loadRequest:req];
    }else if (webViewAppt) {
        //Codes to load appointment webpage
        
    }else if (webViewLabs) {
        //Code to load view labs webpage on iphone
        
    }else if (webViewLabsLg) {
        //Code to load view labs webpage on ipad
        
    }else if (webViewCall) {
        
        [webViewCall stopLoading]; //added this line to stop the previous request
        NSURL *url = [NSURL URLWithString:@"tel:1-317-213-6767"];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [webViewCall loadRequest:req];
    }else if (webViewEmail) {
        
        [webViewEmail stopLoading]; //added this line to stop the previous request
        NSURL *url = [NSURL URLWithString:@"mailto:info@mackeyfamilypractice.com?bcc=support@mackeyfamilypractice.com&subject=ContactUs%20Email%20from%20App"];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [webViewEmail loadRequest:req];
        
    }else if (webViewTweet) {
        [webViewTweet stopLoading]; //added this line to stop the previous request
        NSURL *url = [NSURL URLWithString:@"https://twitter.com/MackeyFamPrac"];
        //webViewTweet.scalesPageToFit = YES;
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [webViewTweet loadRequest:req];
        
    }else if (webViewBlog) {
        [self showHUD:@"Loading..."];
        [webViewBlog stopLoading]; //added this line to stop the previous request
        NSURL *url = [NSURL URLWithString:@"http://mackeyfamilypractice.blogspot.com"];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [webViewBlog loadRequest:req];
        
    }else if (webViewVideo) {
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
            
        } else {
            
            [self showHUD:@"Loading..."];
            self.navigationItem.title = @"PCMH Video";
            [webViewVideo stopLoading]; //added this line to stop the previous request
            NSURL *url = [NSURL URLWithString:@"http://youtu.be/EUuvTusJQhQ"];
            NSURLRequest *req = [NSURLRequest requestWithURL:url];
            [webViewVideo loadRequest:req];
            
        }
        
    } else if (webViewSurvey) {
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
        } else {
            
            [self showHUD:@"Loading..."];
            self.navigationItem.title = @"Patient Survey";
            [webViewSurvey stopLoading]; //added this line to stop the previous request
            NSURL *url = [NSURL URLWithString:@"http://www.surveymonkey.com/s.aspx?sm=angKvuWwg_2f_2ftIzVTNhQ8_2bw_3d_3d"];
            NSURLRequest *req = [NSURLRequest requestWithURL:url];
            [webViewSurvey loadRequest:req];
            
        }
        
    } else if (webViewNews) {
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
            
            [self showHUD:@"Loading..."];
            self.navigationItem.title = @"News Release";
            [webViewNews stopLoading]; //added this line to stop the previous request
            // NSURL *url = [NSURL URLWithString:@"http://www.southcarolinablues.com/newsroom/2012newsreleases.aspx?article_id=288"];
            NSURL *url = [NSURL URLWithString:@"http://web.southcarolinablues.com/news.aspx?article_id=288"];
            NSURLRequest *req = [NSURLRequest requestWithURL:url];
            [webViewNews loadRequest:req];
        }
        
    } else {
        
        [webView stopLoading]; //added this line to stop the previous request
        NSURL *url = [NSURL URLWithString:@"http://www.mackeyfamilypractice.com"];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [webView loadRequest:req];
        
    }
}

-(void)viewDidAppear:(BOOL)animated{
    // NSLog (@"viewDidAppear");
    [webViewIndicator stopAnimating];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer {
    // NSLog(@"Swipe received.");
}

- (void)didReceiveMemoryWarning{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)viewDidUnload{
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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

#pragma mark WebViewDelegate Methods

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    if(loaderRunning == FALSE) {
        
    }
    loadStarted = YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [self hideHUD];
}

//MBProgressHUD method
-(void)SettingDataToWebview {
    HUD = nil;
    if(HUD == nil){
        HUD = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:HUD];
        HUD.delegate = self;
        HUD.labelText = @"Loading...";
        showLoader = TRUE;
        loaderRunning = FALSE;
    }
}

- (void)myTask {
    loaderRunning = TRUE;
    while (showLoader == TRUE) {
        sleep(1);
    }
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    return (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown);
}

@end
