//
//  AFDCalendarManagedObject+Addon.h
//  AFDCalendarsAndReminders
//
//  Created by An Xu on 15/10/12.
//  Copyright (c) 2012 gomeeki. All rights reserved.
//

#import "AFDCalendarManagedObject.h"

@interface AFDCalendarManagedObject (Addon)

//get the current calendar, if not create new
//there should be only one calendar
+(AFDCalendarManagedObject *)currentCalendarInContext:(NSManagedObjectContext *)context;
@end
