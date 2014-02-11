//
//  WMIViewController.h
//  whereami
//
//  Created by evg on 09.02.14.
//  Copyright (c) 2014 jennik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface WMIViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate>

@property (nonatomic) CLLocationManager *locationManager;

- (void) findLocation;
- (void) foundLocation:(CLLocation *)loc;

@end
