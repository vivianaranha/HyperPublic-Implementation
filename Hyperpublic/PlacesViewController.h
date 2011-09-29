//
//  PlacesViewController.h
//  Hyperpublic
//
//  Created by Vivian Aranha on 9/28/11.
//  Copyright 2011 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "JSON.h"
#import "HyperpublicAppDelegate.h"
#import "PlaceDetailViewController.h"


@interface PlacesViewController : UITableViewController {
    
    ASIHTTPRequest *request;
    NSString *categoryId;
    NSArray *arrayPlaces;
    CLLocation *currentLocation;
    
}

@property(nonatomic, retain) NSString *categoryId;
@property (retain, nonatomic) ASIHTTPRequest *request;
@property (nonatomic, retain) CLLocation *currentLocation;

@end
