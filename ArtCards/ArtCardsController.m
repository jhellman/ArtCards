//
//  ArtCardsController.m
//  Abiquiu ArtCards
//
//  Created by Androidicus Maximus on 1/18/13.
//  Copyright (c) 2013 Androidicus Maximus. All rights reserved.
//

#import "ArtCardsController.h"
#import "ArtistManager.h"
#import "Artist.h"

@interface ArtCardsController ()

@end

@implementation ArtCardsController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = NSLocalizedString(@"Art Cards", @"");
		self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray *)artists {
	return [[ArtistManager sharedManager] artists];
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self artists].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mio"];
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mio"];
	}
	Artist *a = [[self artists] objectAtIndex:indexPath.row];
	cell.textLabel.text = [a fullName];
	return cell;
}


@end
