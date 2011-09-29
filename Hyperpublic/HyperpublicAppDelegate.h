//
//  HyperpublicAppDelegate.h
//  Hyperpublic
//
//  Created by Vivian Aranha on 9/28/11.
//  Copyright 2011 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface HyperpublicAppDelegate : NSObject <UIApplicationDelegate, CLLocationManagerDelegate> {

    CLLocationManager *locationManager;
	CLLocation *currentLocation;
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) CLLocation *currentLocation;

@end
