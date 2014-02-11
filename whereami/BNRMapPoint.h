//
//  BNRMapPoint.h
//  whereami
//
//  Created by evg on 11.02.14.
//  Copyright (c) 2014 jennik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface BNRMapPoint : NSObject <MKAnnotation>

- (id) initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;

@end
