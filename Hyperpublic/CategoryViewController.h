//
//  CategoryViewController.h
//  Hyperpublic
//
//  Created by Vivian Aranha on 9/28/11.
//  Copyright 2011 Self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSON.h"
#import "ASIHTTPRequest.h"
#import "CategoryViewController.h"
#import "SubCategoryViewController.h"

@interface CategoryViewController : UITableViewController {
    ASIHTTPRequest *request;
    
    NSArray *categoryArray;
    
}

@property (retain, nonatomic) ASIHTTPRequest *request;

@end
