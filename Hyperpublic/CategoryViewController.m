//
//  CategoryViewController.m
//  Hyperpublic
//
//  Created by Vivian Aranha on 9/28/11.
//  Copyright 2011 Self. All rights reserved.
//

#import "CategoryViewController.h"

@implementation CategoryViewController

@synthesize request;

- (void)dealloc
{
    [request cancel];
	[request release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *globalPlist = [[NSBundle mainBundle] pathForResource:@"global" ofType:@"plist"];
	NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:globalPlist];
    NSString *key = [dict objectForKey:@"key"];
    NSString *secret = [dict objectForKey:@"secret"];
    
    NSString *requestString = [[NSString alloc] initWithFormat:@"https://api.hyperpublic.com/api/v1/categories?client_id=%@&client_secret=%@",key,secret];
    
    NSURL *url = [NSURL URLWithString:requestString];
    
	// Create a request
	[self setRequest:[ASIHTTPRequest requestWithURL:url]];
	[request addRequestHeader:@"User-Agent" value:@"ASIHTTPRequest"];
	[request setValidatesSecureCertificate:NO];
	[request startSynchronous];
	NSString *response = [request responseString];
	categoryArray = [[NSArray alloc] initWithArray:[response JSONValue]];
    
    [requestString release];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [categoryArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    
    cell.textLabel.text = [[categoryArray objectAtIndex:indexPath.row] objectForKey:@"name"];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *arraySubcategories = [[NSArray alloc] initWithArray:[[categoryArray objectAtIndex:indexPath.row] objectForKey:@"subcategories"]];
    
    if([arraySubcategories count] > 0){
        
        SubCategoryViewController *subCategory = [[SubCategoryViewController alloc] init];
        subCategory.subCategoryArray = arraySubcategories;
        subCategory.title = [[categoryArray objectAtIndex:indexPath.row] objectForKey:@"name"];
        [self.navigationController pushViewController:subCategory animated:YES];
        [subCategory release];

    } else{
        
        PlacesViewController *placesViewController = [[PlacesViewController alloc] init];
        placesViewController.title = [[categoryArray objectAtIndex:indexPath.row] objectForKey:@"name"];
        placesViewController.categoryId = [[categoryArray objectAtIndex:indexPath.row] objectForKey:@"id"];
        [self.navigationController pushViewController:placesViewController animated:YES];
        [placesViewController release];
        
        
    }

    [arraySubcategories release];
    
    
}

@end
