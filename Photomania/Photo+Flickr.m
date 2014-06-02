//
//  Photo+Flickr.m
//  Photomania
//
//  Created by will hunting on 6/2/14.
//  Copyright (c) 2014 will hunting. All rights reserved.
//

#import "Photo+Flickr.h"
#import "FlickrFetcher.h"
#import "Photographer+Create.h"

@implementation Photo (Flickr)
+ (Photo *)photoWithFlickrInfo:(NSDictionary *)photoDictionary inMangageObjectContext:(NSManagedObjectContext *)context
{
    Photo* photo = nil;
    
    NSString* unique = [photoDictionary valueForKeyPath:FLICKR_PHOTO_ID];
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"Photo"];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = %@", unique];
    
    NSError* error;
    NSArray* matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || error || matches.count > 1) {
        // handle error
    } else if (matches.count == 1){
        photo = [matches firstObject];
    } else {
        photo = [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:context];
        photo.title = [photoDictionary valueForKeyPath:FLICKR_PHOTO_TITLE];
        photo.subtitle = [photoDictionary valueForKeyPath:FLICKR_PHOTO_DESCRIPTION];
        photo.imageURL = [[FlickrFetcher URLforPhoto:photoDictionary format:FlickrPhotoFormatLarge] absoluteString];
        photo.unique = [photoDictionary valueForKeyPath:FLICKR_PHOTO_ID];
        
        NSString* photographerName = [photoDictionary valueForKeyPath:FLICKR_PHOTO_OWNER];
        photo.whoTook = [Photographer photographerWithName:photographerName inManagedObjectContect:context];
    }
    
    return photo;
}

+ (void)loadPhotosFromFlickrArray:(NSArray *)photos inManageObjectContext:(NSManagedObjectContext *)context
{
    
}
@end
