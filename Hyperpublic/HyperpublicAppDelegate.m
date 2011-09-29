//
//  HyperpublicAppDelegate.m
//  Hyperpublic
//
//  Created by Vivian Aranha on 9/28/11.
//  Copyright 2011 Self. All rights reserved.
//

#import "HyperpublicAppDelegate.h"
#import "CategoryViewController.h"
#import "OffersViewController.h"

@implementation HyperpublicAppDelegate


@synthesize window=_window;
@synthesize currentLocation;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    
    if ([CLLocationManager locationServicesEnabled]) {
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDelegate:self];
        [locationManager setDistanceFilter:kCLDistanceFilterNone];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        [locationManager startUpdatingLocation];
    } 
    
    //Create a Tabbar Controller
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    //Create a Category View Controller
    CategoryViewController *categoryViewController = [[CategoryViewController alloc] init];
    categoryViewController.title = @"Category";
    UINavigationController *categoryNavigation = [[UINavigationController alloc] initWithRootViewController:categoryViewController];
    categoryNavigation.tabBarItem.image = [UIImage imageNamed:@"category.png"];    
    
    
    //Create a Offers View Controller
    OffersViewController *offersViewController = [[OffersViewController alloc] init];
    offersViewController.title = @"Offers";
    UINavigationController *offersNavigation = [[UINavigationController alloc] initWithRootViewController:offersViewController];
    offersNavigation.tabBarItem.image = [UIImage imageNamed:@"master.png"];
    
    
    NSArray *arrayTabs = [[NSArray alloc] initWithObjects:categoryNavigation, offersNavigation, nil];
    tabBarController.viewControllers = arrayTabs;
    
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}


- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{ 
	CLLocationCoordinate2D coordinate = [locationManager.location coordinate];
	
	if ((coordinate.latitude !=0 ) && (coordinate.longitude != 0)) {
		self.currentLocation = newLocation;
        [manager stopUpdatingLocation]; 
        
	}
	
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{ 
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error getting location" message:@"Location cant be determined. Try again later." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	[alert release];
	[manager stopUpdatingLocation];
}


@end
