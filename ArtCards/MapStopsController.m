//
//  MapStopsController.m
//  Abiquiu ArtCards
//
//  Created by Androidicus Maximus on 1/18/13.
//  Copyright (c) 2013 Androidicus Maximus. All rights reserved.
//

#import "MapStopsController.h"

@interface MapStopsController () <MKMapViewDelegate>

@end

@implementation MapStopsController
@synthesize mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = NSLocalizedString(@"Map Stops", @"");
		self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	

}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		[mapView setRegion:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(36.2061, -106.32),
															  2000.0, 2000.0) animated:YES];
	});
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
