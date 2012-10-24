//
//  AFDDeliveryBreakManagedObject+Creation.h
//  AFDCalendarsAndReminders
//
//  Created by An Xu on 24/10/12.
//  Copyright (c) 2012 gomeeki. All rights reserved.
//

#import "AFDDeliveryBreakManagedObject.h"

@interface AFDDeliveryBreakManagedObject (Creation)

//creation
//create a delivery break by start date and end date from user
//Use this function only for user creation
+(AFDDeliveryBreakManagedObject *)deliveryBreakFrom:(NSDate *)startDate
                                                 to:(NSDate *)endDate
                            addtionalDateDictionary:(NSDictionary *)dataDictionary
                                          inContext:(NSManagedObjectContext *)context;



//create a delivery break from API returned data
+(AFDDeliveryBreakManagedObject *)deliveryBreakWithDictionary:(NSDictionary *)dataDictionary
                                                    inContext:(NSManagedObjectContext *)context;



@end
