//
//  AFDCalendarManagedObject.h
//  AFDCalendarsAndReminders
//
//  Created by An Xu on 24/10/12.
//  Copyright (c) 2012 gomeeki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AFDDeliveryBreakManagedObject, AFDReminderManagedObject;

@interface AFDCalendarManagedObject : NSManagedObject

@property (nonatomic, retain) NSSet *hasDeliveryBreaks;
@property (nonatomic, retain) NSSet *hasReminders;
@end

@interface AFDCalendarManagedObject (CoreDataGeneratedAccessors)

- (void)addHasDeliveryBreaksObject:(AFDDeliveryBreakManagedObject *)value;
- (void)removeHasDeliveryBreaksObject:(AFDDeliveryBreakManagedObject *)value;
- (void)addHasDeliveryBreaks:(NSSet *)values;
- (void)removeHasDeliveryBreaks:(NSSet *)values;
- (void)addHasRemindersObject:(AFDReminderManagedObject *)value;
- (void)removeHasRemindersObject:(AFDReminderManagedObject *)value;
- (void)addHasReminders:(NSSet *)values;
- (void)removeHasReminders:(NSSet *)values;
@end
