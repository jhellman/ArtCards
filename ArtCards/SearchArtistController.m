//
//  SearchArtistController.m
//  ArtCards
//
//  Created by Androidicus Maximus on 2/15/13.
//  Copyright (c) 2013 Androidicus Maximus. All rights reserved.
//

#import "SearchArtistController.h"
#import "ArtistManager.h"
#import "Artist.h"
@interface SearchArtistController ()<UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate>

@end

@implementation SearchArtistController {
	NSMutableArray *_foundData;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = NSLocalizedString(@"Search", @"");
		self.tabBarItem.image = [UIImage imageNamed:@"06-magnify"];
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

- (NSArray *)currentData {
	if (self.searchDisplayController.isActive) {
		return _foundData;
	}
	return [[ArtistManager sharedManager]artists];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self currentData].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	Artist *a = [[self currentData] objectAtIndex:indexPath.row];
	UITableViewCell *c = [tableView dequeueReusableCellWithIdentifier:@"mine"];
	if (!c) c = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"mine"];
	c.textLabel.text = [a fullName];
	c.detailTextLabel.text = [[a mediaTypes] componentsJoinedByString:@", "];
	c.imageView.image = [a thumbnailImage];
	return c;
}

- (NSString *)scopeSearchStringForIndex:(NSUInteger)index {
	switch (index) {
		case 0:
			return nil;
		case 1:
			return @"Artist";
		case 2:
			return @"Gallery";
		case 3:
			return @"Food";
			
		default:
			break;
	}
	return nil;
}

- (void)findResults:(NSString *)string scope:(NSUInteger)index {
	NSMutableArray *a = [NSMutableArray array];
	NSString *scope = [self scopeSearchStringForIndex:index];
	for (Artist *artist in [[ArtistManager sharedManager]artists]) {
		if ([artist matchesString:string forScope:scope])
			[a addObject:artist];
	}
	_foundData = [[NSMutableArray alloc] initWithArray:a];
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
	[self findResults:searchString scope:self.searchDisplayController.searchBar.selectedScopeButtonIndex];
	return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
	[self findResults:self.searchDisplayController.searchBar.text scope:searchOption];
	return YES;
}


@end
