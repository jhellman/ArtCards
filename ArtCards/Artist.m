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
	self.firstName = [d valueForKey:@"First Name"];
	self.lastName = [d valueForKey:@"Last Name"];
	self.type = [d valueForKey:@"Type"];
//	self.mediaTypes = [[d valueForKey:@"Media"] componentsSeparatedByString:@","];
	NSString *s = [d valueForKey:@"Media"];
	if (s.length > 1) self.mediaTypes = [s componentsSeparatedByString:@","];

	self.artCardInfo = [d valueForKey:@"Art Card"];
	self.webSite = [d valueForKey:@"Website"];
	self.email = [d valueForKey:@"Email"];
	self.phone = [d valueForKey:@"Phone"];
//	self.galleryOrStudio =
	self.poBox = [d valueForKey:@"Mailing Address"];
	self.city = [d valueForKey:@"Mailing City"];
	self.state = [d valueForKey:@"St"];
	self.zip = [d valueForKey:@"Zip"];
	self.imageName = [d valueForKey:@"Full"];
	self.thumbName = [d valueForKey:@"Thumb"];
	
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

- (BOOL)contains:(NSString *)s in:(NSString *)str {
	NSRange r = [str rangeOfString:s options:NSCaseInsensitiveSearch | NSDiacriticInsensitiveSearch];
	return r.location != NSNotFound;
}

- (BOOL)matchesString:(NSString *)s forScope:(NSString *)scopeKey; // returns nil if no match
{
	
	return [self contains:s in:self.firstName] ||
	[self contains:s in:self.lastName] ||
	[self contains:s in:self.artCardInfo];

	
	
	if ([scopeKey isEqualToString:@"Artist"]) {
		// artist column must be 1 or yes
		
	} else if ([scopeKey isEqualToString:@"Food"]) {
		
	} else if ([scopeKey isEqualToString:@"Gallery"]) {
		
	} else {
		return [self contains:s in:self.firstName] ||
		[self contains:s in:self.lastName] ||
		[self contains:s in:self.artCardInfo];
		
	}
}

@end
