//
//  AFDDeliveryBreakManagedObject+Addon.h
//  AFDCalendarsAndReminders
//
//  Created by An Xu on 15/10/12.
//  Copyright (c) 2012 gomeeki. All rights reserved.
//

#import "AFDDeliveryBreakManagedObject.h"

#define AFDDeliveryBreakEntityName @"DeliveryBreak"

//for user action
#define AFDUserActionTypeNone   @"none"     //created by return data from API
#define AFDUserActionTypeCreate @"create"   //user create a new delivery break
#define AFDUserActionTypeDelete @"delete"   //user delete a new delivery break
#define AFDUserActionTypeUpdate @"update"   //user update a new delivery break

@interface AFDDeliveryBreakManagedObject (Addon)

//return a date from the string returned by API
+(NSDate *)dateFromSuspensionDateString:(NSString *)susupensionDateString;
+(NSString *)stringFromSuspensionDate:(NSDate *)suspensionDate;

//getter function
//get all delivery break
//set YES for ascending order NO for descending order
+(NSArray *)arrayOfAllDeliveryBreakInAscendingOrder:(BOOL)ascending
                                          inContext:(NSManagedObjectContext *)context;

//get all delivery break that need to be syn or no need to syn
+(NSArray *)arrayOfAllDeliveryBreakInAscendingOrder:(BOOL)ascending
                                          needToSyn:(BOOL)needToSyn
                                          inContext:(NSManagedObjectContext *)context;

//get the delivery break fors the month that has that date.
+(NSArray *)arrayOfDeliveryBreakOfTheMonthByDate:(NSDate *)date
                                       inContext:(NSManagedObjectContext *)context;

//look for delivery break by suspension ID
//return nil if no suspension ID
+(AFDDeliveryBreakManagedObject *)deliveryBreakFromSuspensionID:(NSNumber *)suspensionID
                                                      inContext:(NSManagedObjectContext *)context;

//look for a delivery break by start time and endtime
//return nil if no result found
+(AFDDeliveryBreakManagedObject *)deliveryBreakFrom:(NSDate *)startDate
                                                 to:(NSDate *)endDate
                                          inContext:(NSManagedObjectContext *)context;

//look for a delivery break by start time string and endtime string
//return nil if no result found

+(AFDDeliveryBreakManagedObject *)deliveryBreakFromStartDateString:(NSString *)startDateString
                                                   toEndDateString:(NSString *)endDateString
                                                         inContext:(NSManagedObjectContext *)context;


-(void)updateWithDataDictionary:(NSDictionary *)dataDictionary;
@end
