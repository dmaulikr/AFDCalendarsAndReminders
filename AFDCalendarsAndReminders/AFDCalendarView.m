//
//  AFDCalendarView.m
//  AFDCalendarsAndReminders
//
//  Created by An Xu on 19/10/12.
//  Copyright (c) 2012 gomeeki. All rights reserved.
//

#import "AFDCalendarView.h"
#import <QuartzCore/QuartzCore.h>
#import "UIView+GradientLayer.h"
#import "AFDCalendarDateButton.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define DEFAULT_CELL_WIDTH 43
#define CELL_BORDER_WIDTH 1

@interface AFDCalendarView ()

@property (nonatomic, strong) NSDateFormatter *headerTitleDateFormatter;

@property (nonatomic, assign) CGFloat cellWidth;

@property (nonatomic, strong) NSArray *dateButtons;

//add shadow effect to the view (self)
-(void)AFD_addshadowEffect;

// date button got clicked
- (void)AFD_dateButtonPressed:(id)sender;
@end

@implementation AFDCalendarView

#pragma mark - =============== private methods ====================
-(void)AFD_addshadowEffect{
    self.layer.shadowOffset = CGSizeMake(2, 2);
    self.layer.shadowRadius = 5.0f;
    self.layer.shadowOpacity = 1.0f;
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
}

-(void)AFD_layoutCalendar{
    self.cellWidth = self.calendarContainerView.bounds.size.width / 7.0 - CELL_BORDER_WIDTH;
    
    //clean up the buttons
    for (AFDCalendarDateButton *dateButton in self.dateButtons) {
        [dateButton removeFromSuperview];
    }
    
    
}

- (void)AFD_dateButtonPressed:(id)sender {
    
    AFDCalendarDateButton *dateButton = sender;
    
    NSDate *date = dateButton.date;
    
    if (self.minimumDate && [date compare:self.minimumDate] == NSOrderedAscending) {
        
        return;
        
    } else if (self.maximumDate && [date compare:self.maximumDate] == NSOrderedDescending) {
        
        return;
        
    } else {
        
        self.selectedDate = date;
        
        [self.delegate calendar:self didSelectDate:self.selectedDate];
        
    }
}

#pragma mark - =============== View methods ============
-(void)awakeFromNib{
    [super awakeFromNib];
}


-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    //add gradient to background
    [self addGradientLayerWithTopColor:UIColorFromRGB(0x0077c7) bottomColor:UIColorFromRGB(0x003e75)];
    
    //additional shadow
    [self AFD_addshadowEffect];
    
    //rounded corner. Set to hide the corners that under the gradient layer added above
    self.layer.cornerRadius = 6.0f;

    //set up calendar title with month and year
    self.monthYearTitleLabel.text = [self.headerTitleDateFormatter stringFromDate:[NSDate date]];
}


#pragma mark - =============== Getter methods ====================
-(NSCalendar *)calendar{
    if(!_calendar){
         _calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        
        [_calendar setLocale        :[NSLocale currentLocale]];
        
        [_calendar setFirstWeekday  :AFDCalendarStartDaySunday];
        
    }
    return _calendar;
}

-(NSDateFormatter *)headerTitleDateFormatter{
    if(!_headerTitleDateFormatter){
        
        _headerTitleDateFormatter = [[NSDateFormatter alloc] init];
        
        [_headerTitleDateFormatter setTimeStyle:NSDateFormatterNoStyle];
        
        _headerTitleDateFormatter.dateFormat = @"MMMM yyyy";

    }
    return _headerTitleDateFormatter;
}


-(NSArray *)dateButtons{
    if(!_dateButtons){
        NSMutableArray *dateButtons = [NSMutableArray array];
        for (NSInteger i = 1; i <= 42; i++) {
            AFDCalendarDateButton *dateButton = [AFDCalendarDateButton buttonWithType:UIButtonTypeCustom];
            dateButton.calendar = self.calendar;
            [dateButton addTarget:self action:@selector(AFD_dateButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [dateButtons addObject:dateButton];
        }
        _dateButtons = dateButtons;

    }
    
    return _dateButtons;
}

#pragma mark - =============== IBAction methods ===================

- (IBAction)previousButtonClicked:(id)sender {
}

- (IBAction)nextButtonClicked:(id)sender {
}

@end
