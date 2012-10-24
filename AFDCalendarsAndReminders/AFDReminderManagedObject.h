//
//  AFDReminderManagedObject.h
//  AFDCalendarsAndReminders
//
//  Created by An Xu on 24/10/12.
//  Copyright (c) 2012 gomeeki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AFDCalendarManagedObject;

@interface AFDReminderManagedObject : NSManagedObject

@property (nonatomic, retain) NSNumber * reminderAlertType;
@property (nonatomic, retain) NSNumber * reminderBadgesEnabled;
@property (nonatomic, retain) NSDate * reminderDateAndTime;
@property (nonatomic, retain) NSString * reminderDescription;
@property (nonatomic, retain) NSNumber * reminderSoundEnabled;
@property (nonatomic, retain) NSString * reminderTitle;
@property (nonatomic, retain) NSString * reminderDayString;
@property (nonatomic, retain) id reminderLocalNotification;
@property (nonatomic, retain) NSNumber * reminderMinutesBeforeFire;
@property (nonatomic, retain) AFDCalendarManagedObject *inCalendar;

@end
