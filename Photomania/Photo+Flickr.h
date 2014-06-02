//
//  Photo+Flickr.h
//  Photomania
//
//  Created by will hunting on 6/2/14.
//  Copyright (c) 2014 will hunting. All rights reserved.
//

#import "Photo.h"

@interface Photo (Flickr)
+ (Photo* )photoWithFlickrInfo:(NSDictionary* )photoDictionary
        inMangageObjectContext:(NSManagedObjectContext* )context;

+ (void)loadPhotosFromFlickrArray:(NSArray* )photos // of Flickr NSDictionary
            inManageObjectContext:(NSManagedObjectContext* )context;
@end
