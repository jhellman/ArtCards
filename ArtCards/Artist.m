//
//  Artist.m
//  Abiquiu ArtCards
//
//  Created by Androidicus Maximus on 1/18/13.
//  Copyright (c) 2013 Androidicus Maximus. All rights reserved.
//

#import "Artist.h"

NSString *allMediaTypes[MEDIA_TYPE_MAX] = {
	@"abstract",
	@"angels",
	@"animal",
	
};


@implementation Artist {
	UIImage *thumb;
	UIImage *image;
}

@synthesize firstName;
@synthesize lastName;
@synthesize type;
@synthesize mediaTypes;
@synthesize artCardInfo;
@synthesize webSite;
@synthesize email;
@synthesize phone;
@synthesize galleryOrStudio;
@synthesize poBox;
@synthesize city;
@synthesize state;
@synthesize zip;
@synthesize imageName;
@synthesize thumbName;

- (void)loadFromDictionary:(NSDictionary *)d {
	self.firstName = [d valueForKey:@"firstName"];
	self.lastName = [d valueForKey:@"lastName"];
}

+ (Artist *)artistWithDictionary:(NSDictionary *)d {
	Artist *a = [[self alloc] init];
	[a loadFromDictionary:d];
	return a;
}

- (UIImage *)thumbnailImage {
	if (!thumb) {
		NSString *path = [[NSBundle mainBundle] pathForResource:self.thumbName ofType:@"jpg"];
		thumb = [UIImage imageWithContentsOfFile:path];
	}
	return thumb;
}

- (UIImage *)fullImage {
	if (!image) {
		NSString *path = [[NSBundle mainBundle] pathForResource:self.imageName ofType:@"jpg"];
		image = [UIImage imageWithContentsOfFile:path];
	}
	return image;
}


- (NSString *)fullName {
	if (firstName.length > 0 && lastName.length > 0) return [NSString stringWithFormat:@"%@ %@",firstName, lastName];
	if (firstName.length > 0) return firstName;
	if (lastName.length > 0) return  lastName;
	return @"unknown";
}

@end
