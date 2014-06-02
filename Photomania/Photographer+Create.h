//
//  Photographer+Create.h
//  Photomania
//
//  Created by will hunting on 6/2/14.
//  Copyright (c) 2014 will hunting. All rights reserved.
//

#import "Photographer.h"

@interface Photographer (Create)
+(Photographer* )photographerWithName:(NSString* )name
               inManagedObjectContect:(NSManagedObjectContext* )contect;
@end
