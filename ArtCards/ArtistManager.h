//
//  ArtistManager.h
//  Abiquiu ArtCards
//
//  Created by Androidicus Maximus on 1/18/13.
//  Copyright (c) 2013 Androidicus Maximus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArtistManager : NSObject

+ (ArtistManager *)sharedManager;

- (NSMutableArray *)artists;

@end
