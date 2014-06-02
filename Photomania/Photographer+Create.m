//
//  Photographer+Create.m
//  Photomania
//
//  Created by will hunting on 6/2/14.
//  Copyright (c) 2014 will hunting. All rights reserved.
//

#import "Photographer+Create.h"

@implementation Photographer (Create)
+ (Photographer *)photographerWithName:(NSString *)name inManagedObjectContect:(NSManagedObjectContext *)contect
{
    Photographer* photographer = nil;
    
    if (name.length) {
        NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"Photographer"];
        request.predicate = [NSPredicate predicateWithFormat:@"name = %@", name];
        
        NSError* error;
        NSArray* matches = [contect executeFetchRequest:request error:&error];
        
        if (!matches || error || matches.count>1) {
            // handle error
        } else if (!matches.count) {
            photographer = [NSEntityDescription insertNewObjectForEntityForName:@"Photographer" inManagedObjectContext:contect];
            photographer.name = name;
        } else {
            photographer = [matches lastObject];
        }
    }
    
    return photographer;
}
@end
