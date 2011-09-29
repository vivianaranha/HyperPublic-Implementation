//
//  OfferDetailViewController.m
//  Hyperpublic
//
//  Created by Vivian Aranha on 9/28/11.
//  Copyright 2011 Self. All rights reserved.
//

#import "OfferDetailViewController.h"


@implementation OfferDetailViewController

@synthesize offerDictionary;

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
    lblName.text = [NSString stringWithString:[offerDictionary objectForKey:@"title"]];
    [self.view addSubview:lblName];
    [lblName release];
    
    if([offerDictionary objectForKey:@"image_url"] && ((NSNull *)[offerDictionary objectForKey:@"image_url"] != [NSNull null])){
        NSLog(@"%@",[offerDictionary objectForKey:@"image_url"]);
        UIImage *imgElm = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[offerDictionary objectForKey:@"image_url"]]]];
    
        UIImageView *placeImage = [[UIImageView alloc] initWithImage:imgElm];
        placeImage.frame = CGRectMake(10, 100, 140, 140);
        [self.view addSubview:placeImage];
        [placeImage release];
    }
    
    
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
