//
//  CoreDataUtils.m
//  RoseTasks
//
//  Created by Tracy Richard on 7/20/16.
//  Copyright © 2016 Jack Richard. All rights reserved.
//

#import "CoreDataUtils.h"
#import "AppDelegate.swift"


@implementation CoreDataUtils

static NSManagedObjectContext* _managedObjectContext;

+ (NSManagedObjectContext*) managedObjectContext {
    if (_managedObjectContext == nil) {
        AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
        
        _managedObjectContext = appDelegate.managedObjectContext;
       
    }
    return _managedObjectContext;
}
+ (void) saveContext {
    NSError *error = nil;
    NSManagedObjectContext* context = [CoreDataUtils managedObjectContext];
    
    if ([context hasChanges] && ![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}


@end
