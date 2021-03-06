//
//  OffersViewController.m
//  Hyperpublic
//
//  Created by Vivian Aranha on 9/28/11.
//  Copyright 2011 Self. All rights reserved.
//

#import "OffersViewController.h"


@implementation OffersViewController

@synthesize request, currentLocation;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
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
    
    HyperpublicAppDelegate *appDelegate = (HyperpublicAppDelegate *)[[UIApplication sharedApplication] delegate];
	self.currentLocation = appDelegate.currentLocation;
    CLLocationCoordinate2D coordinate = [self.currentLocation coordinate];
    
    NSString *globalPlist = [[NSBundle mainBundle] pathForResource:@"global" ofType:@"plist"];
	NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:globalPlist];
    NSString *key = [dict objectForKey:@"key"];
    NSString *secret = [dict objectForKey:@"secret"];
    NSString *radius = [dict objectForKey:@"radius"];

    NSString *requestString = [[NSString alloc] initWithFormat:@"https://api.hyperpublic.com/api/v1/offers?lat=%f&lon=%f&status=all&client_id=%@&client_secret=%@&radius=%@",coordinate.latitude, coordinate.longitude,key,secret, radius];
    
    NSURL *url = [NSURL URLWithString:requestString];
    
	// Create a request
	[self setRequest:[ASIHTTPRequest requestWithURL:url]];
	[request addRequestHeader:@"User-Agent" value:@"ASIHTTPRequest"];
	[request setValidatesSecureCertificate:NO];
	[request startSynchronous];
	NSString *response = [request responseString];
    
    if([[response JSONValue] isKindOfClass:[NSArray class]]){
        offerArray = [[NSArray alloc] initWithArray:[response JSONValue]];
    } else {
        offerArray = [[NSArray alloc] initWithObjects:[response JSONValue], nil];
    }
    
    
    
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
    return [offerArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    if([[offerArray objectAtIndex:indexPath.row] objectForKey:@"error"]){
        cell.textLabel.text = [[offerArray objectAtIndex:indexPath.row] objectForKey:@"error"];
    } else {
        cell.textLabel.text = [[offerArray objectAtIndex:indexPath.row] objectForKey:@"title"];
    }
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(![[offerArray objectAtIndex:indexPath.row] objectForKey:@"error"]){
        
        OfferDetailViewController *detailViewController = [[OfferDetailViewController alloc] init];
        detailViewController.offerDictionary = [offerArray objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:detailViewController animated:YES];
        [detailViewController release];
        
    }
}

@end
