//
//  CoreDataUtils.h
//  RoseTasks
//
//  Created by Tracy Richard on 7/20/16.
//  Copyright © 2016 Jack Richard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface CoreDataUtils : NSObject

+ (NSManagedObjectContext*) managedObjectContext;
+ (void) saveContext;

@end
