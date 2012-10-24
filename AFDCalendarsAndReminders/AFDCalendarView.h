//
//  AFDCalendarView.h
//  AFDCalendarsAndReminders
//
//  Created by An Xu on 19/10/12.
//  Copyright (c) 2012 gomeeki. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AFDCalendarDelegate;

typedef enum{
    AFDCalendarStartDaySunday = 1,
    AFDCalendarStartDayMonday = 2
    
}AFDCalendarStartDay;

@interface AFDCalendarView : UIView

//calendar header part
@property (strong, nonatomic) IBOutlet UIButton *nextButton;
@property (strong, nonatomic) IBOutlet UIButton *previousButton;
@property (strong, nonatomic) IBOutlet UILabel  *monthYearTitleLabel;
//----------------------

//that will contain the real calendar
@property (strong, nonatomic) IBOutlet UIView   *calendarContainerView;

//delegate for user selected a date
@property (nonatomic, unsafe_unretained) id<AFDCalendarDelegate> delegate;

//set up the dates for the calendar
@property (nonatomic, strong) NSDate *minimumDate;
@property (nonatomic, strong) NSDate *maximumDate;
@property (nonatomic, strong) NSDate *selectedDate;
@property (nonatomic, assign) AFDCalendarStartDay calendarStartDay;
@property (nonatomic, strong) NSCalendar *calendar;

@end


@protocol AFDCalendarDelegate <NSObject>
-(void)calendar:(AFDCalendarView *)calendar didSelectDate:(NSDate *)date;
@end