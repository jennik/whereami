//
//  BNRMapPoint.m
//  whereami
//
//  Created by evg on 11.02.14.
//  Copyright (c) 2014 jennik. All rights reserved.
//

#import "BNRMapPoint.h"

@implementation BNRMapPoint

@synthesize coordinate, title;

- (id) initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t
{
    if (self = [super init])
    {
        self->coordinate = c;
        self.title = t;
    }
    return self;
}

- (id) init
{

    return [self initWithCoordinate:CLLocationCoordinate2DMake(43.07, -89.32) title:@"Hometown"];
}

@end
