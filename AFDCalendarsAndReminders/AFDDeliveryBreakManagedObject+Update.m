//
//  AFDDeliveryBreakManagedObject+Update.m
//  AFDCalendarsAndReminders
//
//  Created by An Xu on 24/10/12.
//  Copyright (c) 2012 gomeeki. All rights reserved.
//

#import "AFDDeliveryBreakManagedObject+Update.h"

#import "AFDDeliveryBreakManagedObject+Addon.h"
#import "NSDate+dateComparison.h"

@implementation AFDDeliveryBreakManagedObject (Update)


//update
//update a delivery break by user
+(AFDDeliveryBreakManagedObject *)deliveryBreakUpdateBySuspensionID:(NSNumber *)suspensionID
                                            addtionalDateDictionary:(NSDictionary *)dataDictionary
                                                          inContext:(NSManagedObjectContext *)context
{
    AFDDeliveryBreakManagedObject *deliveryBreakManagedObject = [AFDDeliveryBreakManagedObject deliveryBreakFromSuspensionID:suspensionID inContext:context];

    
    if (deliveryBreakManagedObject) {
        
        deliveryBreakManagedObject.userActionType = AFDUserActionTypeUpdate;
        deliveryBreakManagedObject.needToSyn      = [NSNumber numberWithBool:YES];
        deliveryBreakManagedObject.synchronisationTimeStamp = [NSDate date];
        
        [deliveryBreakManagedObject updateWithDataDictionary:dataDictionary];
        
    }else{
        DLog(@"can not found %@",suspensionID);
    }
    
    
    return deliveryBreakManagedObject;
}
@end
