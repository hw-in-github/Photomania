//
//  PhotographerCDTVC.m
//  Photomania
//
//  Created by will hunting on 6/2/14.
//  Copyright (c) 2014 will hunting. All rights reserved.
//

#import "PhotographerCDTVC.h"
#import "Photographer.h"

@interface PhotographerCDTVC ()

@end

@implementation PhotographerCDTVC

- (void)setManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    _managedObjectContext = managedObjectContext;
    
    NSFetchRequest* request = [NSFetchRequest fetchRequestWithEntityName:@"Photographer"];
    request.predicate = nil;
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES selector:@selector(localizedCompare:)]];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:request managedObjectContext:managedObjectContext sectionNameKeyPath:nil cacheName:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Photographer Cell" forIndexPath:indexPath];
    
    Photographer* photographer = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = photographer.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", photographer.photos.count];
    
    return cell;
}

@end
