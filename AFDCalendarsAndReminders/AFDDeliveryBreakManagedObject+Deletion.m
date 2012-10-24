//
//  AFDDeliveryBreakManagedObject+Deletion.m
//  AFDCalendarsAndReminders
//
//  Created by An Xu on 24/10/12.
//  Copyright (c) 2012 gomeeki. All rights reserved.
//

#import "AFDDeliveryBreakManagedObject+Deletion.h"

#import "AFDDeliveryBreakManagedObject+Addon.h"
#import "NSDate+dateComparison.h"


@implementation AFDDeliveryBreakManagedObject (Deletion)


+(AFDDeliveryBreakManagedObject *)deliveryBreakDeletionBySuspensionID:(NSNumber *)suspensionID
                                                            inContext:(NSManagedObjectContext *)context
{
    AFDDeliveryBreakManagedObject *deliveryBreakManagedObject = [AFDDeliveryBreakManagedObject deliveryBreakFromSuspensionID:suspensionID inContext:context];
    
    if (deliveryBreakManagedObject) {
        [deliveryBreakManagedObject requestForDeletion];
    }else{
        DLog(@"can not found %@",suspensionID);
    }
    return deliveryBreakManagedObject;
}

-(void)requestForDeletion{
    self.userActionType = AFDUserActionTypeDelete;
    self.needToSyn = [NSNumber numberWithBool:YES];
}
@end
