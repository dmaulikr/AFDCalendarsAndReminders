//
//  AFDDeliveryBreakManagedObject+Addon.m
//  AFDCalendarsAndReminders
//
//  Created by An Xu on 15/10/12.
//  Copyright (c) 2012 gomeeki. All rights reserved.
//

#import "AFDDeliveryBreakManagedObject+Addon.h"
#import "NSDate+dateComparison.h"


@implementation AFDDeliveryBreakManagedObject (Addon)

+(NSDateFormatter *)suspensionDateFormatter{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    //date formate drom API returned date: hours could be worng, it could be HH
    [dateFormatter setDateFormat:@"MMM dd yyyy hh:mma"];

    return dateFormatter;
}


+(NSDate *)dateFromSuspensionDateString:(NSString *)susupensionDateString{
    NSDateFormatter *dateFormatter = [AFDDeliveryBreakManagedObject suspensionDateFormatter];
    
    NSDate *date = [dateFormatter dateFromString:susupensionDateString];
    if(!date){
        DLog(@" Faile to convert date %@",susupensionDateString);
    }
    return date;
}

+(NSString *)stringFromSuspensionDate:(NSDate *)suspensionDate{
    NSDateFormatter *dateFormatter = [AFDDeliveryBreakManagedObject suspensionDateFormatter];
    return [dateFormatter stringFromDate:suspensionDate];
}


//////


+(NSArray *)arrayOfAllDeliveryBreakInAscendingOrder:(BOOL)ascending
                                          needToSyn:(BOOL)needToSyn
                                          inContext:(NSManagedObjectContext *)context{
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:AFDDeliveryBreakEntityName];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"needToSyn == %@",[NSNumber numberWithBool:needToSyn]];
    request.predicate = predicate;
    
    //potential bug when two susupensionStartDate are the same
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"suspensionStartDate" ascending:ascending comparator:^NSComparisonResult(id obj1, id obj2) {
        
        NSDate *day1 = obj1;
        NSDate *day2 = obj2;
        
        return [day1 comparisonResultByCompareDayWithDate:day2];
        
    }];
    
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSError *error = nil;
    NSArray *result = [context executeFetchRequest:request error:&error];
    
    if (error) {
        DLog(@"error %@",error.localizedDescription);
    }
    
    return result;
}

//get all the delivery break
+(NSArray *)arrayOfAllDeliveryBreakInAscendingOrder:(BOOL)ascending
                                          inContext:(NSManagedObjectContext *)context{
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:AFDDeliveryBreakEntityName];
    
    //potential bug when two susupensionStartDate are the same
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"suspensionStartDate" ascending:ascending comparator:^NSComparisonResult(id obj1, id obj2) {
        
        NSDate *day1 = obj1;
        NSDate *day2 = obj2;
        
        return [day1 comparisonResultByCompareDayWithDate:day2];
        
    }];
    
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSError *error = nil;
    NSArray *result = [context executeFetchRequest:request error:&error];
    
    if (error) {
        DLog(@" error %@",error.localizedDescription);
    }
    
    return result;
}

//look for delivery break by suspemsion ID
+(AFDDeliveryBreakManagedObject *)deliveryBreakFromSuspensionID:(NSNumber *)suspensionID
                                                      inContext:(NSManagedObjectContext *)context{
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:AFDDeliveryBreakEntityName];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"suspensionID == %@",suspensionID];
    request.predicate = predicate;

    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"suspensionID" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];


    NSError *error = nil;
    NSArray *result = [context executeFetchRequest:request error:&error];
    
    if (error) {
        DLog(@" error %@",error.localizedDescription);
    }
    
    if(result.count >=2){
        //todo deal with duplicated suspension ID
        for (NSManagedObject *object in result) {
            [context deleteObject:object];
        }
        DLog(@"duplication of suspensionID in DB %@", result);
    }else if(result.count == 1){
        return [result lastObject];
    }
    
    return nil;
}

//look for a delivery break by start time and endtime
//return nil if no result found
+(AFDDeliveryBreakManagedObject *)deliveryBreakFrom:(NSDate *)startDate
                                                 to:(NSDate *)endDate
                                          inContext:(NSManagedObjectContext *)context{
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:AFDDeliveryBreakEntityName];
    NSPredicate *predicate = [NSPredicate
                              predicateWithFormat:@"(suspensionStartDate == %@) AND (suspensionendDate == %@)",
                              [AFDDeliveryBreakManagedObject stringFromSuspensionDate:startDate],
                              [AFDDeliveryBreakManagedObject stringFromSuspensionDate:endDate]
                              ];
    
    request.predicate = predicate;
    
    NSError *error = nil;
    NSArray *result = [context executeFetchRequest:request error:&error];
    
    if (error) {
        DLog(@" error %@",error.localizedDescription);
    }
    
    if(result.count >=2){
        //todo deal with duplicated delivery break
        for (NSManagedObject *object in result) {
            [context deleteObject:object];
        }
        DLog(@"duplication in DB %@", result);
    }else if(result.count == 1){
        return [result lastObject];
    }
    
    return nil;
}

//look for a delivery break by start time string and endtime string
//return nil if no result found
+(AFDDeliveryBreakManagedObject *)deliveryBreakFromStartDateString:(NSString *)startDateString
                                                 toEndDateString:(NSString *)endDateString
                                          inContext:(NSManagedObjectContext *)context{
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:AFDDeliveryBreakEntityName];
    NSPredicate *predicate = [NSPredicate
                              predicateWithFormat:@"(suspensionStartDate == %@) AND (suspensionendDate == %@)",
                              startDateString, endDateString];
    
    request.predicate = predicate;
    
    NSError *error = nil;
    NSArray *result = [context executeFetchRequest:request error:&error];
    
    if (error) {
        DLog(@" error %@",error.localizedDescription);
    }
    
    if(result.count >=2){
        //todo deal with duplicated delivery break
        for (NSManagedObject *object in result) {
            [context deleteObject:object];
        }
        DLog(@"duplication in DB %@", result);
    }else if(result.count == 1){
        return [result lastObject];
    }
    
    return nil;
}


-(void)updateWithDataDictionary:(NSDictionary *)dataDictionary{
    
    //get data out of the dataDictionary
    NSNumber *suspensionid          = [dataDictionary objectForKey:@"suspensionid"];
    NSNumber *customercode          = [dataDictionary objectForKey:@"customercode"];
    
    NSString *suspensionstartdate   = [dataDictionary objectForKey:@"suspensionstartdate"];
    NSString *suspensionenddate     = [dataDictionary objectForKey:@"suspensionenddate"];
    
    NSNumber *commentid             = [dataDictionary objectForKey:@"commentid"];

    if(!suspensionid || !customercode || !suspensionstartdate || !suspensionenddate || !commentid)
    {
        DLog(@"empty object for key %@", dataDictionary);
    }

    self.suspensionID         = suspensionid;
    self.customerCode         = customercode;
    self.suspensionStartDate  = suspensionstartdate;
    self.suspensionendDate    = suspensionenddate;
    self.commentID            = commentid;

}
@end
