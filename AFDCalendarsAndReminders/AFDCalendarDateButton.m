//
//  AFDCalendarDateButton.m
//  AFDCalendarsAndReminders
//
//  Created by An Xu on 22/10/12.
//  Copyright (c) 2012 gomeeki. All rights reserved.
//

#import "AFDCalendarDateButton.h"

//todo change the default image name
#define AFDReminderImageName @"UserOptionBarButton"

@implementation AFDCalendarDateButton


#pragma mark - =============== View methods ============
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
}

#pragma mark - =============== Getter methods ====================
-(UIImageView *)reminderIconImageView{
    if(!_reminderIconImageView){
        // todo Align image view into middle left
        _reminderIconImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:AFDReminderImageName]];
    }
    return _reminderIconImageView;
}

#pragma mark - =============== Setter methods ====================
- (void)setDate:(NSDate *)date {
    _date = date;
    NSDateComponents *comps = [self.calendar components:NSDayCalendarUnit|NSMonthCalendarUnit fromDate:date];
    [self setTitle:[NSString stringWithFormat:@"%d", comps.day] forState:UIControlStateNormal];
    
    //set to default color
    self.dateState = AFDCalendarDateDefault;
}

-(void)setDateState:(AFDCalendarDateState)dateState{
    //set button highlighted color
    self.highlighted = YES;
    
    switch (dateState) {
            //default is not highlighted
        case AFDCalendarDateDefault:
            self.highlighted = NO;
            break;
            
        case AFDCalendarDateDeliveryBreak:
            [self setTintColor:self.deliveryBreakColor];
            break;
            
        case AFDCalendarDateSelected:
            [self setTintColor:self.selectedColor];
            break;
            
        case AFDCalendarDateStateCurrentDate:
            [self setTintColor:self.currentDateColor];
            break;
            
        default:
            break;
    }

}

#pragma mark - =============== public methods =====================
-(void)hasReminder:(BOOL)hasReminder{

    //if icon image view is there remove it
    if([self.subviews containsObject:self.reminderIconImageView]){
        [self.reminderIconImageView removeFromSuperview];
    }
    
    if(hasReminder){
        [self addSubview:self.reminderIconImageView];
    }
}

@end
