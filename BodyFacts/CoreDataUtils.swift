//
//  CoreDataUtils.swift
//  BodyFacts
//
//  Created by Tracy Richard on 7/27/16.
//  Copyright © 2016 Jack Richard. All rights reserved.
//
import UIKit
import CoreData
class CoreDataUtils: NSObject {
    var _managedObjectContext : NSManagedObjectContext?
    
    func managedObjectContext () -> NSManagedObjectContext {
        if (_managedObjectContext == nil) {
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            _managedObjectContext = appDelegate.managedObjectContext;
        }
        return _managedObjectContext!;
    }
    
    func saveContext () {
        do {
            try self._managedObjectContext?.save()
        } catch {
            print("error")
            abort()
        }
    }
    
    
    
}