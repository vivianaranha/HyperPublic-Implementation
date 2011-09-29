//
//  OffersViewController.h
//  Hyperpublic
//
//  Created by Vivian Aranha on 9/28/11.
//  Copyright 2011 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSON.h"
#import "ASIHTTPRequest.h"
#import "OfferDetailViewController.h"
#import "HyperpublicAppDelegate.h"


@interface OffersViewController : UITableViewController {
    ASIHTTPRequest *request;
    NSArray *offerArray;
    CLLocation *currentLocation;

}

@property (retain, nonatomic) ASIHTTPRequest *request;
@property (nonatomic, retain) CLLocation *currentLocation;


@end
