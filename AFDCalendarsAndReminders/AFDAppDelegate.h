//
//  AFDAppDelegate.h
//  AFDCalendarsAndReminders
//
//  Created by An Xu on 15/10/12.
//  Copyright (c) 2012 gomeeki. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CKViewController;

@interface AFDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CKViewController *viewController;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
