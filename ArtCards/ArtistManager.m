//
//  ArtistManager.m
//  Abiquiu ArtCards
//
//  Created by Androidicus Maximus on 1/18/13.
//  Copyright (c) 2013 Androidicus Maximus. All rights reserved.
//

#import "ArtistManager.h"
#import "Artist.h"

@implementation ArtistManager {
	NSMutableArray *_artists;
}

+ (ArtistManager *)sharedManager {
	static ArtistManager *_sharedInstance = nil;
	if (_sharedInstance == nil)
	_sharedInstance = [[ArtistManager alloc] init];
	return _sharedInstance;
}

- (NSMutableArray *)artists {
	return _artists;
}

- (void)loadArtists {
	NSString *path = [[NSBundle mainBundle] pathForResource:@"Artists" ofType:@"plist"];
	NSData *d = [NSData dataWithContentsOfFile:path];
	
	if (d) {
	NSError *e = nil;
		NSPropertyListFormat format;
	NSDictionary *dict = [NSPropertyListSerialization propertyListWithData:d options:NSPropertyListImmutable format:&format error:&e];
	
		_artists = [[NSMutableArray alloc] init];
		NSArray *artistAsPlist =  (NSArray *)dict; // [dict valueForKey:@"artists"];
		for (NSDictionary *d in artistAsPlist) {
			Artist *artist = [Artist artistWithDictionary:d];
			if (artist) [_artists addObject:artist];
		}
	} else {
		_artists = [[NSMutableArray alloc] init];
		
	[_artists addObject: [Artist artistWithDictionary:[NSDictionary dictionaryWithObjectsAndKeys:
													   @"Armando", @"firstName",
													   @"Adrian-Lopez", @"lastName",
													   @"Artist",@"mediaType",
													   
													   nil]]];
	[_artists addObject: [Artist artistWithDictionary:[NSDictionary dictionaryWithObjectsAndKeys:
													   @"Isaac", @"firstName",
													   @"AlaridPease", @"lastName",
													   @"Artist",@"mediaType",
													   
													   nil]]];
	}
	
}

- (id)init {
	if ((self = [super init]) != nil) {
		[self loadArtists];
	}
	return  self;
}

@end
