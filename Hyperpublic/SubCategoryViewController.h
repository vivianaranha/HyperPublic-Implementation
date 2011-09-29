//
//  SubCategoryViewController.h
//  Hyperpublic
//
//  Created by Vivian Aranha on 9/28/11.
//  Copyright 2011 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlacesViewController.h"

@interface SubCategoryViewController : UITableViewController {
    NSArray *subCategoryArray;
}

@property(nonatomic, retain) NSArray *subCategoryArray;

@end
