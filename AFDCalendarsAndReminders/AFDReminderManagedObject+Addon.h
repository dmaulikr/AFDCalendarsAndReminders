//
//  AFDReminderManagedObject+Addon.h
//  AFDCalendarsAndReminders
//
//  Created by An Xu on 15/10/12.
//  Copyright (c) 2012 gomeeki. All rights reserved.
//

#import "AFDReminderManagedObject.h"

#define AFDReminderEntityName @"Reminder"

typedef enum {
    AFDReminderAlertTypeOnce = 0,
    AFDReminderAlertTypeWeekly,
    AFDReminderAlertTypeFortnightly
    
} AFDReminderAlertType;

@interface AFDReminderManagedObject (Addon)


//user for compare day in the calendar
//date conversion for reminder in format MM dd yyyy
//this conversion is ideal for comparing a day with get all the reminders for that day
+(NSDateFormatter*)reminderDateFormatter;
+(NSString *)reminderDayFromDate:(NSDate *)date;
+(NSDate *)reminderDateFromDayString:(NSString *)dateString;


+(AFDReminderManagedObject *)reminderByCreateNewInContext:(NSManagedObjectContext *)context;

//get all the reminders for a date
+(NSArray *)arrayOfRemindersAtDate:(NSDate *)date inContext:(NSManagedObjectContext *)context;

//call this function to set up the local notification, after other detail is set
-(void)registerLocalNotification;
@end
