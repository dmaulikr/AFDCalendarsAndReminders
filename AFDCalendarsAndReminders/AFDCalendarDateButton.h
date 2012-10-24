//
//  AFDCalendarDateButton.h
//  AFDCalendarsAndReminders
//
//  Created by An Xu on 22/10/12.
//  Copyright (c) 2012 gomeeki. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    AFDCalendarDateDefault,
    AFDCalendarDateDeliveryBreak,
    AFDCalendarDateSelected,
    AFDCalendarDateStateCurrentDate
}AFDCalendarDateState;


@interface AFDCalendarDateButton : UIButton

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSCalendar *calendar;

//button background color
@property (nonatomic, strong) UIColor *defaultColor;
@property (nonatomic, strong) UIColor *deliveryBreakColor;
@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, strong) UIColor *currentDateColor;

//set button highlighted color for different state
@property (nonatomic, assign) AFDCalendarDateState dateState;

//it holds the icon image
@property (nonatomic, strong) UIImageView *reminderIconImageView;

//set that date has reminders
-(void)hasReminder:(BOOL)hasReminder;
@end
