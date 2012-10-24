//
//  NSDate+dateComparison.h
//  AFDCalendarsAndReminders
//
//  Created by An Xu on 23/10/12.
//  Copyright (c) 2012 gomeeki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (dateComparison)

-(NSComparisonResult)comparisonResultByCompareDayWithDate:(NSDate *)date;

@end
