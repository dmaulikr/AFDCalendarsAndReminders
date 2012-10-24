//
//  AFDDeliveryBreakManagedObject+Creation.m
//  AFDCalendarsAndReminders
//
//  Created by An Xu on 24/10/12.
//  Copyright (c) 2012 gomeeki. All rights reserved.
//

#import "AFDDeliveryBreakManagedObject+Creation.h"

#import "AFDDeliveryBreakManagedObject+Addon.h"
#import "NSDate+dateComparison.h"


@implementation AFDDeliveryBreakManagedObject (Creation)

//createion
//create a delivery break by start date and end date from user action
+(AFDDeliveryBreakManagedObject *)deliveryBreakFrom:(NSDate *)startDate
                                                 to:(NSDate *)endDate
                            addtionalDateDictionary:(NSDictionary *)dataDictionary
                                          inContext:(NSManagedObjectContext *)context{
    
    //
    //--first check if the delivery break already exist--
    AFDDeliveryBreakManagedObject *deliveryBreakManagedObject = [AFDDeliveryBreakManagedObject deliveryBreakFrom:startDate to:endDate inContext:context];
    
    //if no dealivery break, create a new delivery break
    if(!deliveryBreakManagedObject){
        deliveryBreakManagedObject = [NSEntityDescription insertNewObjectForEntityForName:AFDDeliveryBreakEntityName
                                                                   inManagedObjectContext:context];
        
        deliveryBreakManagedObject.creationTimeStamp = [NSDate date];
        
    }else{
        //store updating time
        deliveryBreakManagedObject.synchronisationTimeStamp = [NSDate date];
    }
    
    deliveryBreakManagedObject.suspensionStartDate = [AFDDeliveryBreakManagedObject stringFromSuspensionDate:startDate];
    
    deliveryBreakManagedObject.suspensionendDate   = [AFDDeliveryBreakManagedObject stringFromSuspensionDate: endDate];
    
    //it is user action: set the type and need to syn with server later on
    deliveryBreakManagedObject.userActionType = AFDUserActionTypeCreate;
    deliveryBreakManagedObject.needToSyn = [NSNumber numberWithBool:YES];
    
    return deliveryBreakManagedObject;
}


//create a delivery break from API return
+(AFDDeliveryBreakManagedObject *)deliveryBreakWithDictionary:(NSDictionary *)dataDictionary
                                                    inContext:(NSManagedObjectContext *)context
{
    
    //get data out of the dataDictionary
    NSNumber *suspensionid          = [dataDictionary objectForKey:@"suspensionid"];    
    NSString *suspensionstartdate   = [dataDictionary objectForKey:@"suspensionstartdate"];
    NSString *suspensionenddate     = [dataDictionary objectForKey:@"suspensionenddate"];
        
    //first check if suspensionid already exist
    AFDDeliveryBreakManagedObject * deliveryBreakManagedObject = [AFDDeliveryBreakManagedObject deliveryBreakFromSuspensionID:suspensionid inContext:context];
    
    //if no suspensionid found look for it by comparing the start date and end start
    if(!deliveryBreakManagedObject){
        deliveryBreakManagedObject = [AFDDeliveryBreakManagedObject deliveryBreakFromStartDateString:suspensionstartdate toEndDateString:suspensionenddate inContext:context];
    }
    
    //if not found
    if(!deliveryBreakManagedObject){
        //create new
        deliveryBreakManagedObject = [NSEntityDescription insertNewObjectForEntityForName:AFDDeliveryBreakEntityName inManagedObjectContext:context];
        deliveryBreakManagedObject.creationTimeStamp = [NSDate date];
    }else{
        //if object existed update it
        deliveryBreakManagedObject.synchronisationTimeStamp = [NSDate date];
    }
    
    [deliveryBreakManagedObject updateWithDataDictionary:dataDictionary];
    
    //create from API NOT user, no need to syn
    deliveryBreakManagedObject.needToSyn        = [NSNumber numberWithBool:NO];
    deliveryBreakManagedObject.userActionType   = AFDUserActionTypeNone;
    
    return deliveryBreakManagedObject;
}


@end
