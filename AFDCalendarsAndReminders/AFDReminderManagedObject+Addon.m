//
//  AFDReminderManagedObject+Addon.m
//  AFDCalendarsAndReminders
//
//  Created by An Xu on 15/10/12.
//  Copyright (c) 2012 gomeeki. All rights reserved.
//

#import "AFDReminderManagedObject+Addon.h"

@implementation AFDReminderManagedObject (Addon)

//user for compare day in the calendar
+(NSDateFormatter*)reminderDateFormatter{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"MM dd yyyy"];
    return dateFormatter;
}

+(NSString *)reminderDayFromDate:(NSDate *)date{
    return [[AFDReminderManagedObject reminderDateFormatter] stringFromDate:date];
}

+(NSDate *)reminderDateFromDayString:(NSString *)dateString{
    return [[AFDReminderManagedObject reminderDateFormatter] dateFromString:dateString];
}


+(AFDReminderManagedObject *)reminderByCreateNewInContext:(NSManagedObjectContext *)context{
    return [NSEntityDescription insertNewObjectForEntityForName:AFDReminderEntityName inManagedObjectContext:context];
}


+(NSArray *)arrayOfRemindersAtDate:(NSDate *)date inContext:(NSManagedObjectContext *)context{
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:AFDReminderEntityName];
    
    NSPredicate *predicate = [NSPredicate
                              predicateWithFormat:@"(reminderDayString == %@)", [AFDReminderManagedObject reminderDayFromDate:date]];

    request.predicate = predicate;
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"reminderDateAndTime" ascending:YES];
    
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    
    NSError *error = nil;
    NSArray *result = [context executeFetchRequest:request error:&error];
    
    if (error || !result) {
        DLog(@" error %@",error.localizedDescription);
    }
    
    return result;
    
}


-(void)registerLocalNotification{
    
    UILocalNotification *localNotification = self.reminderLocalNotification;
    
    if(!localNotification){
        localNotification = [[UILocalNotification alloc] init];
    }else{
        //cancel it before update
        [[UIApplication sharedApplication] cancelLocalNotification:localNotification];
    }
    
    NSDate *fireDate = self.reminderDateAndTime;
    //set the fire time with munutes before
    fireDate = [fireDate dateByAddingTimeInterval:- ([self.reminderMinutesBeforeFire integerValue] * 60)];
    
    //add the fire date
    localNotification.fireDate = fireDate;
    
    //set timezone
    localNotification.timeZone = [NSTimeZone systemTimeZone];
    
    //show reminder title for the alert popup[
    localNotification.alertBody = [NSString stringWithFormat:@"%@", self.reminderTitle];
    
    //set notification sound
    if([self.reminderSoundEnabled boolValue]){
        localNotification.soundName = UILocalNotificationDefaultSoundName;
    }
    
    //set notification app icon badge
    if([self.reminderBadgesEnabled boolValue]){
        localNotification.applicationIconBadgeNumber = 1;
    }
    
    NSDictionary *userInfo = @{
    
    @"Title"    :   self.reminderTitle,
    @"Time"     :   self.reminderDateAndTime
    
    };
    
    //set up repeate type
    AFDReminderAlertType alertType = [self.reminderAlertType integerValue];
    switch (alertType) {
            
        case AFDReminderAlertTypeOnce:
            localNotification.repeatInterval = 0;
            break;
            
        case AFDReminderAlertTypeWeekly:
            localNotification.repeatInterval = NSWeekCalendarUnit;
            break;
            
        case AFDReminderAlertTypeFortnightly:
            localNotification.repeatInterval = (NSWeekCalendarUnit * 2);
            break;
            
        default:
            break;
    }
    
    localNotification.userInfo = userInfo;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
}
@end
