//
//  NSDate+dateComparison.m
//  AFDCalendarsAndReminders
//
//  Created by An Xu on 23/10/12.
//  Copyright (c) 2012 gomeeki. All rights reserved.
//

#import "NSDate+dateComparison.h"

@implementation NSDate (dateComparison)


-(NSComparisonResult)comparisonResultByCompareDayWithDate:(NSDate *)date{
    
    NSDateComponents *components1 = [[NSCalendar currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:self];
    
    NSInteger day1      = [components1 day];
    NSInteger month1    = [components1 month];
    NSInteger year1     = [components1 year];
    
    NSDateComponents *components2 = [[NSCalendar currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:date];
    NSInteger day2      =   [components2 day];
    NSInteger month2    =   [components2 month];
    NSInteger year2     =   [components2 year];

    
    NSComparisonResult result = NSOrderedSame;
    
    //compare year
    if (year1 > year2) {
        result = NSOrderedDescending;
    } else if (year1 < year2) {
        result = NSOrderedAscending;
    } else {
        
        //compare month
        if (month1 > month2) {
            result = NSOrderedDescending;
        } else if (month1 < month2) {
            result = NSOrderedAscending;
        } else {
            
            //compare day
            if (day1 > day2) {
                result = NSOrderedDescending;
            } else if (day1 < day2) {
                result = NSOrderedAscending;
            } 
        }
        
    }
    
    return result;

}

@end
