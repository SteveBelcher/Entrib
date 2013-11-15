//
//  MackeyLocationsController.h
//  MackeyFamilyPractice
//
//  Created by Wendy Belcher on 11/30/11.
//  Copyright (c) 2011 ReliaLutions, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotationView.h>

#define METERS_PER_MILE 1609.344
@interface MackeyLocationsController : UIViewController <MKMapViewDelegate> {
    BOOL _doneInitialZoom;
    //these two items are new Jan 13,2012
    //NSMutableArray *mapAnnotations;
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet MKMapView *map2View;

-(IBAction)handleSwipeFrom:(id)recognizer;

@end