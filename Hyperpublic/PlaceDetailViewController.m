//
//  PlaceDetailViewController.m
//  Hyperpublic
//
//  Created by Vivian Aranha on 9/28/11.
//  Copyright 2011 Self. All rights reserved.
//

#import "PlaceDetailViewController.h"


@implementation PlaceDetailViewController

@synthesize placeDictionary;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *lblName = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 20)];
    lblName.text = [NSString stringWithString:[placeDictionary objectForKey:@"display_name"]];
    [self.view addSubview:lblName];
    [lblName release];

    
    UIImage *imgElm = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[[placeDictionary objectForKey:@"images"] objectAtIndex:0] objectForKey:@"src_small"]]]];
    
    UIImageView *placeImage = [[UIImageView alloc] initWithImage:imgElm];
    placeImage.frame = CGRectMake(10, 100, 140, 140);
    [self.view addSubview:placeImage];
    [placeImage release];
    
    
    
        
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
