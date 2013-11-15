//
//  MackeyFirstViewController.m
//  MackeyFamilyPractice
//
//  Created by Wendy Belcher on 11/16/11.
//  Copyright (c) 2011 ReliaLutions, LLC. All rights reserved.
//

#import "MackeyFirstViewController.h"
#define kAlertViewConcerns 1
#define kAlertViewMenus 2
#define kAlertViewCall 3

@implementation MackeyFirstViewController

@synthesize webViewCallMe, webViewEmailMe, webViewSampleMenus, webViewBMICalculator, webViewHealthConcerns, viewHealthConcerns;
@synthesize webViewReadingLabels, webViewReadingLabelsCarbs, webViewReadingLabelsDaily, webViewReadingLabelsFiber, webViewReadingLabelsSatFat, webViewReadingLabelsSodium, webViewReadingLabelsProtein, webViewReadingLabelsCalories, webViewReadingLabelsTotalFat, webViewReadingLabelsVitamins, webViewReadingLabelsCholesterol;
@synthesize CallMe, EmailMe, SampleMenus, BMICalculator, ReadingLabels, HealthConcerns,safariAlert,buttonIndexAction;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setCallMe:nil];
    [self setEmailMe:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}
/*
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
 {
 //Return YES for supported orientations for both iPhone and iPad
 if (([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) || ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) ) {
 return ((interfaceOrientation != UIInterfaceOrientationLandscapeRight) && (interfaceOrientation != UIInterfaceOrientationLandscapeLeft));
 } else {
 return YES;
 }
 }
 */
- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    // the user clicked one of the OK/Cancel buttons - determine which caller is being used and then determine action
    
    if (actionSheet.tag == kAlertViewConcerns){
        if (buttonIndex == 1)
        {
            //NSLog(@"Diarrhea and Vomiting");
            //NSURL *url = [NSURL URLWithString:@"http://mackeyfamilypractice.com/diarrhea.html"];
            //[[UIApplication sharedApplication] openURL:url];
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Diarrhea and Vomiting"
                                                              message:@"Begin with clear liquids for 24-38 hours - Pedialyte, Ginger Ale, 7-Up, Gatorade, frozen Kool-Aid Popsicles, Jello-O.  Slowly add soft, bland foods - bananas, rice, applesauce, toast, Ritz crackers, dry cereal.  \n\nAvoid greasy foods, milk, orange juice, or liquids that contain caffeine.  \n\nAs the vomiting and diarrhea improve, continue to add foods more firm in consistency.  Let your appetite be the guide.  Be sure to drink plenty of liquids to avoid dehydration.  Some signs of dehydration are:  Dry mouth, loose wrinkly skin, no tears when crying, failure to urinate 4 times in 24 hours, sunken eyes inability to keep balance when walking.  \n\nWhen should I follow-up with my physician?  If diarrhea has not cleared after 3 days, if any signs of dehydration occur, or if you notice blood when you vomit or have a stool.\n\nThe information above is for educational purposes only. It does not replace visiting your healthcare provider.  Call your doctor or dial 911 if you have a medical emergency."
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            
            
            [message show];
            // message.frame = CGRectMake(0,0,600,200);
        }
        else if (buttonIndex == 2) {
            // NSLog(@"Feaver and Tylenol Dosing");
            //NSURL *url = [NSURL URLWithString:@"http://mackeyfamilypractice.com/fever.html"];
            //[[UIApplication sharedApplication] openURL:url];
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Feaver and Tylenol Dosing"
                                                              message:@"Significances:\nFever is a normal body response to infection and a symptom of an illness, not an illness itself.  Temperatures of 100 - 103 degrees are usual with childhood infections and help combat disease.  Temperatures of 104 degrees and above may cause convulsions in infants - and chills in older children and adults.  Sudden changes in temperature can precipitate convulsions in infants (up to 2 years of age). Temperatures of 105 degrees and above if prolonged can cause brain damage.\n\nFacts:\nA normal temperature is about 98.6 degrees when taken orally (by mouth).  Temperatures taken rectally (by rectum) usually run 1 degree higher than those taken orally.  Auxiliary temperatures run 1 degree than those then orally.  Temperatures will register lower after sleeping, becoming chilled, or drinking colds liquids.  Temperatures will register higher after exercising, exposure to higher environmental temperatures, and drinking hot liquids.\n\nTreatment:\nFor high fevers that are difficult to bring down with aspirin or Tylenol alone, try the following:  alternate aspirin and Tylenol in the appropriate does for child's weight and age every 2 hours.\n\nTips:\n1. For a child having an elevated temperature, give aspirin or Tylenol every three-four hours.  You should take their temperature at least every 2-4 hours.\n\n2.  Place the child in a tub of luke-warm water and sponge briskly for 15 minutes.  If the child's temperature is still elevated, continue sponging for an additional 15 minutes.  Sponge the child no more frequently than every 2 hours and no longer than 30 minutes at a time.  Remember, not to child the child as this will prohibit the fever from going down and may even cause it to rise.\n\n3.  A fever does not necessary indicate a dangerous infection.  A child's temperature regulating mechanism is not well developed and thus, the fever is often higher than one would expect with relatively minor infection.\n\n4.  Follow the doctor's orders with regard to antibiotics and other medications.\n\n5.  Call your family doctor immediately if the child twitches, convulses, or it spots or rash appear.\n\n6.  With viral infections, it is recommended to use Tylenol instead of aspirin because of the association of Reeve's Syndrome with aspirin.\n\nThe information above is for educational purposes only. It does not replace visiting your healthcare provider.  Call your doctor or dial 911 if you have a medical emergency."
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            
            [message show];
        }
        else if (buttonIndex == 3) {
            //NSLog(@"GI Disorders");
            //NSURL *url = [NSURL URLWithString:@"http://mackeyfamilypractice.com/gi.html"];
            //[[UIApplication sharedApplication] openURL:url];
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"GI Disorders (PUD/GERD)"
                                                              message:@"Peptic Ulcer Disease (PUD) - historically, the bland diet has been used in PUD.  With the introduction of H2 inhibitors for the treatment of PUD, the use of diet has been questioned.  In addition, there is growing evidence that most ulcers are associated with a microorganism called Helicobacter pylori, which is usually treated with bismuth-subsalicylate, tetracycline or ampicillin, and metronidazole.\n\nGastroesophageal Reflux Disease (GERD) - occurs when gastric contents reflux into the esophagus.  The most common symptoms are heartburn, regurgitation, dysphagia, and chest pain.  GERD is a chronic disorder whose management requires lifestyle and dietary changes often combined with drug therapy.\n\nGastric irritants:  caffeine, alcohol, aspirin, fatty foods, citrus juices, non steroidal, anti-inflammatory drugs, and smoking.\n\nModifications:  weight loss (if overweight), avoid tight clothing in the abdominal area, meal consistency, stop smoking, maintain upright posture while eating, elevate head of bed 6 inches, avoid eating at least 3 hours before reclining or going to bed.\n\nThe information above is for educational purposes only. It does not replace visiting your healthcare provider.  Call your doctor or dial 911 if you have a medical emergency."
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            
            [message show];
        }
        else if (buttonIndex == 4) {
            //NSLog(@"Head Injuries");
            //NSURL *url = [NSURL URLWithString:@"http://mackeyfamilypractice.com/headinj.html"];
            //[[UIApplication sharedApplication] openURL:url];
            
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Minor Head Injuries"
                                                              message:@"Head injury, regardless of the type, including operations to the head, is followed by a group of symptoms that may be regarded as common to all forms of canal trauma.  Not all the symptoms may be found in every patient, but most are present in the majority of instances.\n\nWhat is most important is not the scalp or scull, but the present or possible injury to the brain!\n\nIf any of the following signs are symptoms of brain injury listed below are observed in the patient, notify your doctor promptly.\n\nSleepiness:  this is the main symptom to watch out for - any decrease in alertness is important!\n\nEye changes:  This is also very important! Pupils unequal, the pupils, the black part of the eye are not equal in size or fail to change in size when light is directed at them.  Fixed is when the pupils remain the same size regardless of the amount of light.  Dilated is when the pupils remain enlarged regardless of decrease in the amount of light.\n\nPersonality changes:  irritability and confusion.\n\nHeadache:  headache is expected, if it is long lasting, or it increases in severity, medical advice is needed.\n\nNausea and Vomiting:  this is often just from the headache, it can be a sign of increased pressure in the the head.\n\nOther:  Dizziness, ringing in the ears, elevated temperature of 100 degrees, convulsions.\n\nCareful observation of the patient during the first two days after a minor head injury is extremely important in recognizing complications.\n\nThe information above is for educational purposes only. It does not replace visiting your healthcare provider.  Call your doctor or dial 911 if you have a medical emergency."
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            
            [message show];
        }
        else if (buttonIndex == 5) {
            // NSLog(@"Stomach Virus and Flu");
            //NSURL *url = [NSURL URLWithString:@"http://mackeyfamilypractice.com/flu.html"];
            //[[UIApplication sharedApplication] openURL:url];
            
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Stomach Virus and Flu"
                                                              message:@"The following is an example of a progressive diet that may be followed when you have a stomach virus or the flu.\n\nStart with clear liquids, Sodas, Gatorade, Jello-O, clear soups (like chicken or beef broth), and Popsicles.\n\nTry small amounts of the above about every 20 minutes rather than a lot at one time.   Your stomach will tolerate small amounts.  Also try eating or drinking the liquids at room temperature at first.  This too will help your stomach tolerate the liquids.\n\nNext, try a few crackers or toast with the clear liquids.  DO NOT TRY ANY OTHER SOLID FOODS AT THIS TIME!  Try saltine or plain graham crackers or plain, dry toast.\n\nThen try full liquids.  This includes cream soups, ice cream, pudding, etc.  You may still have clear liquids, toast, and crackers, or toast with clear liquids.  DO NOT TRY ANY OTHER SOLID FOODS AT THIS TIME!\n\nNext, try soft foods.  This includes baked or mashed potatoes, pasta, cooked cereal, bananas, etc.\n\nIf you tolerate all of the above, you may now slowly start on your regular diet.  REMEMBER - your stomach is still sensitive - a little bit at a time.\n\nThe information above is for educational purposes only. It does not replace visiting your healthcare provider.  Call your doctor or dial 911 if you have a medical emergency."
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            
            /*CGRect entryFieldRect = CGRectZero;
             if( UIDeviceOrientationIsPortrait( [UIApplication sharedApplication].statusBarOrientation ) ) {
             entryFieldRect = CGRectMake(12, 90, 460, 250);
             }
             else {
             entryFieldRect = CGRectMake(12, 90, 460, 250);
             }
             UITextField* textfield = [[UITextField alloc] initWithFrame:entryFieldRect];
             textfield.backgroundColor = [UIColor whiteColor];
             textfield.keyboardType = UIKeyboardTypeAlphabet;
             textfield.keyboardAppearance =  UIKeyboardAppearanceAlert;
             textfield.autocorrectionType = UITextAutocorrectionTypeNo;
             textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
             [[self view] endEditing:YES];
             [message addSubview:textfield];
             [textfield becomeFirstResponder]; */
            
            [message show];
        }
        else
        {
            // NSLog(@"cancel");
        }
    }
    else if (actionSheet.tag == kAlertViewCall) {
        if (buttonIndex == 1)
        {
            //            NSLog(@"Lancaster");
            //Lancaster
            NSURL *url = [NSURL URLWithString:@"tel:1-803-285-7414"];
            [[UIApplication sharedApplication] openURL:url];
        }
        else if (buttonIndex == 2) {
            //            NSLog(@"Indian Land");
            //Indian Land
            NSURL *url = [NSURL URLWithString:@"tel:1-803-396-5333"];
            [[UIApplication sharedApplication] openURL:url];    }
        else if (buttonIndex == 3) {
            //            NSLog(@"EmailUs");
            //Email
            NSURL *url = [NSURL URLWithString:@"mailto:info@mackeyfamilypractice.com?bcc=support@mackeyfamilypractice.com&subject=ContactUs%20Email%20from%20App"];
            [[UIApplication sharedApplication] openURL:url];    }
        else
        {
            // NSLog(@"cancel");
        }
    }
    else if (actionSheet.tag == kAlertViewMenus){
        
        if (buttonIndex !=0) {
            buttonIndexAction=buttonIndex;
            safariAlert = [[UIAlertView alloc]initWithTitle:@"Sample Menus" message:@"This will open the browser window" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
            
            [safariAlert show];
            
        }
        
        
        
    }else if (actionSheet==safariAlert)
    {
        if (buttonIndex==1) {
            
            if (buttonIndexAction == 1){
                // NSLog(@"1200");
                NSURL *url = [NSURL URLWithString:@"http://mackeyfamilypractice.com/menus/1200.pdf"];
                [[UIApplication sharedApplication] openURL:url];
            }
            else if (buttonIndexAction == 2) {
                // NSLog(@"1400");
                NSURL *url = [NSURL URLWithString:@"http://mackeyfamilypractice.com/menus/1400.pdf"];
                [[UIApplication sharedApplication] openURL:url];    }
            else if (buttonIndexAction == 3) {
                // NSLog(@"1600");
                NSURL *url = [NSURL URLWithString:@"http://mackeyfamilypractice.com/menus/1600.pdf"];
                [[UIApplication sharedApplication] openURL:url];    }
            else if (buttonIndexAction == 4) {
                // NSLog(@"1800");
                NSURL *url = [NSURL URLWithString:@"http://mackeyfamilypractice.com/menus/1800.pdf"];
                [[UIApplication sharedApplication] openURL:url];    }
            else if (buttonIndexAction == 5) {
                // NSLog(@"2000");
                NSURL *url = [NSURL URLWithString:@"http://mackeyfamilypractice.com/menus/2000.pdf"];
                [[UIApplication sharedApplication] openURL:url];    }
            else
            {
                // NSLog(@"cancel");
            }
            
        }
    }
}

-(IBAction) psudoBackAction:(id)sender {
    //  [self dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self showReadingLabels:(id)sender];
}

- (IBAction)showCallMe:(id)sender {
    [webViewCallMe stopLoading]; //added this line to stop the previous request
    // open a alert with an OK and cancel button
    UIAlertView *alertMenu = [[UIAlertView alloc] initWithTitle:@"Call Our Office" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Lancaster", @"Indian Land", @"Email Us", nil];
    alertMenu.tag = kAlertViewCall;
    
    [alertMenu show];
}

- (IBAction)showEmailMe:(id)sender {
    [webViewEmailMe stopLoading]; //added this line to stop the previous request
    NSURL *url = [NSURL URLWithString:@"mailto:info@mackeyfamilypractice.com?bcc=support@mackeyfamilypractice.com&subject=ContactUs%20Email%20from%20App"];
    [[UIApplication sharedApplication] openURL:url];
}

- (IBAction)showHealthConcerns:(id)sender {
    [webViewHealthConcerns stopLoading]; //added this line to stop the previous request
    UIAlertView *alertMenu = [[UIAlertView alloc] initWithTitle:@"" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Diarrhea and Vomiting", @"Feaver and Tylenol Dosing", @"GI Disorders (PUD/GERD)",@"Minor Head Injuries",@"Stomach Virus and Flu", nil];
    alertMenu.tag = kAlertViewConcerns;
    
    [alertMenu show];
    
}

- (IBAction)showSampleMenus:(id)sender {
    [webViewSampleMenus stopLoading]; //added this line to stop the previous request
    UIAlertView *alertMenu = [[UIAlertView alloc] initWithTitle:@"" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"1200 Calories", @"1400 Calories", @"1600 Calories", @"1800 Calories", @"2000 Calories", nil];
    alertMenu.tag = kAlertViewMenus;
    
    [alertMenu show];
}

- (IBAction)showBMICalculator:(id)sender {
    [webViewBMICalculator stopLoading]; //added this line to stop the previous request
    NSURL *url = [NSURL URLWithString:@"http://www.cdc.gov/healthyweight/assessing/bmi/adult_BMI/english_bmi_calculator/bmi_calculator.html"];
    [[UIApplication sharedApplication] openURL:url];
}

-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer {
    // NSLog(@"Swipe received.");
}

/*- (IBAction)showReadingLabelsInstruct:(id)sender {
 UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Reading Labels"
 message:@"People look at food labels for different reasons.  Whatever the reason, you might like to know how to use this information more effectively and easily.  Select any of the items for some label-building skills that are intended to make it easier for you to use the nutrition labels to make quick, informed food choices that contribute to a healthy diet."
 delegate:nil
 cancelButtonTitle:@"OK"
 otherButtonTitles:nil];
 
 [message show];
 }*/

- (IBAction)showReadingLabels:(id)sender {
    [webViewReadingLabels stopLoading]; //added this line to stop the previous request
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Serving Size"
                                                      message:@"Check to see if your serving is the same size as the one on the label.  If you eat double the serving size listed, you need to double the nutrient and caloric values.  If you eat one-half the serving size shown here, the nutrient and caloric values should be halved."
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    
    [message show];
}

- (IBAction)webViewReadingLabelsCalories:(id)sender {
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Calories"
                                                      message:@"Look here to see what a serving of food adds to your daily total.  A person's size and activity level help determine total calories needed per day.  For example, a 138-lb active woman needs about 2,000 calories each day, while a 160-lb active woman needs about 2,300."
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    
    [message show];
}

- (IBAction)webViewReadingLabelsTotalFat:(id)sender {
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Total Fat"
                                                      message:@"Try to limit your calories from fat.  Too much fat may contribute to heart disease and cancer.  Choose foods with fewer than 30% of calories derived from fat."
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    
    [message show];
}

- (IBAction)webViewReadingLabelsSatFat:(id)sender {
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Saturated Fat"
                                                      message:@"Saturated is the 'bad' fat.  It is the key player in raising blood cholesterol and your risk of heart disease.\n\nAvoid it!"
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    
    [message show];
}

- (IBAction)webViewReadingLabelsCholesterol:(id)sender {
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Cholesterol"
                                                      message:@"Challenge yourself to eat foods totaling less than 300 mg of cholesterol each day.  Too much cholesterol can lead to heart disease."
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    
    [message show];
}

- (IBAction)webViewReadingLabelsSodium:(id)sender {
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Sodium"
                                                      message:@"Too much sodium (or salt) adds up to high blood pressure in some people.  Keep your sodium intake low - 2,400 to 3,000 mg per day is plenty.\n\nThe American Heart Association (AHA) recommends no more than 3,000 mg of sodium per day for healthy adults."
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    
    [message show];
}

- (IBAction)webViewReadingLabelsCarbs:(id)sender {
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Total Carbohydrates"
                                                      message:@"Carbohydrates are found in foods like bread, potatoes, fruits, and vegetables.  They should be the basis for your diet, giving you nutrients and energy.  If you cut down on fat, you can eat more carbohydrates."
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    
    [message show];
}

- (IBAction)webViewReadingLabelsFiber:(id)sender {
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Dietary Fiber"
                                                      message:@"It is important to consume both soluble and insoluble dietary fiber (also called 'roughage').  Fruits and vegetables, whole-grain foods, beans, and legumes are all good sources of fiber and can help reduce the risk of heart disease and cancer."
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    
    [message show];
}

- (IBAction)webViewReadingLabelsProtein:(id)sender {
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Protein"
                                                      message:@"Most adults get more protein than they need.  Protein from animal sources contains both fat and cholesterol, so eat small servings of lean meat, fish, and poultry.  Use skim milk or low-fat milk, yogurt, and cheese.  Tty to get your protein from some vegetables (such as beans), grains, and cereals."
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    
    [message show];
}

- (IBAction)webViewReadingLabelsVitamins:(id)sender {
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Vitamins and Minerals"
                                                      message:@"Make it your goal to get 100% of each every day.  Let a combination of foods contribute to a winning score."
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    
    [message show];
}

- (IBAction)webViewReadingLabelsDaily:(id)sender {
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Daily Values"
                                                      message:@"These daily values apply to people who eat 2,000 to 2,500 calories each day.  If you eat more, your personal daily value may be higher than what's listed on the label.  If you eat less, your personal daily value may be lower.\n\nAim for a low percent daily values when it comes to fats, cholesterol, and sodium; while aiming for 100% of carbohydrates, fiber, vitamins, and minerals."
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    
    [message show];
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    return (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown);
}


@end
