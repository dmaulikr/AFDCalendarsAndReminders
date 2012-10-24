//
//  AFDDeliveryBreakManagedObject.h
//  AFDCalendarsAndReminders
//
//  Created by An Xu on 24/10/12.
//  Copyright (c) 2012 gomeeki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AFDCalendarManagedObject;

@interface AFDDeliveryBreakManagedObject : NSManagedObject

@property (nonatomic, retain) NSNumber * commentID;
@property (nonatomic, retain) NSNumber * customerCode;
@property (nonatomic, retain) NSNumber * needToSyn;
@property (nonatomic, retain) NSString * suspensionendDate;
@property (nonatomic, retain) NSNumber * suspensionID;
@property (nonatomic, retain) NSString * suspensionStartDate;
@property (nonatomic, retain) NSString * userActionType;
@property (nonatomic, retain) NSDate * creationTimeStamp;
@property (nonatomic, retain) NSDate * modificationTimeStamp;
@property (nonatomic, retain) NSDate * synchronisationTimeStamp;
@property (nonatomic, retain) AFDCalendarManagedObject *inCalendar;

@end
