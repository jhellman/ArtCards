//
//  Artist.h
//  Abiquiu ArtCards
//
//  Created by Androidicus Maximus on 1/18/13.
//  Copyright (c) 2013 Androidicus Maximus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import  <CoreLocation/CoreLocation.h>

#define MEDIA_TYPE_MAX 50

extern NSString *allMediaTypes[MEDIA_TYPE_MAX];

@interface Artist : NSObject
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, retain) NSArray *mediaTypes;
@property (nonatomic, copy) NSString *artCardInfo;
@property (nonatomic, copy) NSString *webSite;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *galleryOrStudio;
@property (nonatomic, copy) NSString *poBox;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *zip;
@property (nonatomic, retain) NSString *imageName;
@property (nonatomic, retain) NSString *thumbName;
@property  (nonatomic, readwrite) NSUInteger stopNumber;
@property (nonatomic, readwrite) CLLocationCoordinate2D geolocation;

+ (Artist *)artistWithDictionary:(NSDictionary *)d;

- (UIImage *)thumbnailImage;
- (UIImage *)fullImage;
- (NSString *)fullName;

- (BOOL)matchesString:(NSString *)s forScope:(NSString *)scopeKey; // returns nil if no match

@end
