//
//  WMIViewController.m
//  whereami
//
//  Created by evg on 09.02.14.
//  Copyright (c) 2014 jennik. All rights reserved.
//

#import "WMIViewController.h"
#import "BNRMapPoint.h"

@interface WMIViewController ()

@property (strong, nonatomic) IBOutlet MKMapView *worldView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UITextField *locationTitleField;

@end

@implementation WMIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager setDelegate:self];
//    [self.locationManager setDistanceFilter:50.0];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
//    [self.locationManager startUpdatingLocation];
    [self.locationManager startUpdatingHeading];
    
    self.worldView.showsUserLocation = YES;
}

- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"%@", locations);
    
    CLLocation *location = [locations lastObject];
    
    NSTimeInterval t = [[location timestamp] timeIntervalSinceNow];
    
    if (t < -180)
        return;
    
    [self foundLocation:location];
}

- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Could not find location: %@", error);
}

- (void) locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    NSLog(@"%@", newHeading);
}

- (void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = userLocation.coordinate;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250.0, 250.0);
    [self.worldView setRegion:region];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [self findLocation];
    [textField resignFirstResponder];
    return YES;
}

- (void) findLocation
{
    [self.locationManager startUpdatingLocation];
    [self.activityIndicator startAnimating];
    self.locationTitleField.hidden = YES;
}

- (void) foundLocation:(CLLocation *)loc
{
    BNRMapPoint *mp = [[BNRMapPoint alloc] initWithCoordinate:loc.coordinate title:self.locationTitleField.text];
    [self.worldView addAnnotation:mp];
    
    self.worldView.region = MKCoordinateRegionMakeWithDistance(loc.coordinate, 250, 250);
    
    self.locationTitleField.text = @"";
    [self.activityIndicator stopAnimating];
    self.locationTitleField.hidden = NO;
    [self.locationManager stopUpdatingLocation];
}

@end
