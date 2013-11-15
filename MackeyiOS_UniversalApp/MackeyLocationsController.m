//
//  MackeyLocationsController.m
//  MackeyFamilyPractice
//
//  Created by Wendy Belcher on 11/30/11.
//  Copyright (c) 2011 ReliaLutions, LLC. All rights reserved.
//

#import "MackeyLocationsController.h"

@implementation MackeyLocationsController
@synthesize mapView = _mapView;
@synthesize map2View = _map2View;

//@synthesize mapAnnotations = _mapAnnotations;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidUnload
{
    [self setMapView:nil];
    [self setMap2View:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer {
    //    NSLog(@"Swipe received.");
}

- (void)viewWillAppear:(BOOL)animated {
    
    CLLocationCoordinate2D zoomLocation;
    
    if (_mapView) {
        //Lancaster
        zoomLocation.latitude = 34.7143058;
        zoomLocation.longitude = -80.7962639;
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.75*METERS_PER_MILE, 0.75*METERS_PER_MILE);
        MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:viewRegion];
        [_mapView setRegion:adjustedRegion animated:YES];
        
    }
    else {
        //Indian Land
        zoomLocation.latitude = 34.987103;
        zoomLocation.longitude = -80.8535517;
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.75*METERS_PER_MILE, 0.75*METERS_PER_MILE);
        MKCoordinateRegion adjustedRegion = [_map2View regionThatFits:viewRegion];
        [_map2View setRegion:adjustedRegion animated:YES];
    }
}


- (BOOL)shouldAutorotate {
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    return (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown);
}
@end
