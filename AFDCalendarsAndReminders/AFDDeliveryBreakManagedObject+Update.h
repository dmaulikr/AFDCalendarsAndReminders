//
//  AFDDeliveryBreakManagedObject+Update.h
//  AFDCalendarsAndReminders
//
//  Created by An Xu on 24/10/12.
//  Copyright (c) 2012 gomeeki. All rights reserved.
//

#import "AFDDeliveryBreakManagedObject.h"

@interface AFDDeliveryBreakManagedObject (Update)

//update
//update a delivery break by user
+(AFDDeliveryBreakManagedObject *)deliveryBreakUpdateBySuspensionID:(NSNumber *)suspensionID
                                            addtionalDateDictionary:(NSDictionary *)dataDictionary
                                                          inContext:(NSManagedObjectContext *)context;


@end
