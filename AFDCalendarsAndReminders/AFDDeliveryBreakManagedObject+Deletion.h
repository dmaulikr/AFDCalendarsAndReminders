//
//  AFDDeliveryBreakManagedObject+Deletion.h
//  AFDCalendarsAndReminders
//
//  Created by An Xu on 24/10/12.
//  Copyright (c) 2012 gomeeki. All rights reserved.
//

#import "AFDDeliveryBreakManagedObject.h"

@interface AFDDeliveryBreakManagedObject (Deletion)

//deletion
//delete a delivery break by user
+(AFDDeliveryBreakManagedObject *)deliveryBreakDeletionBySuspensionID:(NSNumber *)suspensionID
                                                            inContext:(NSManagedObjectContext *)context;


//delete self by setting user action type to dele and needToSyn to YES
-(void)requestForDeletion;
@end
