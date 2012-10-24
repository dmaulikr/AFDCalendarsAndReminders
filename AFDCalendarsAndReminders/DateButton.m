//
//  DateButton.m
//  AFDCalendarsAndReminders
//
//  Created by An Xu on 23/10/12.
//  Copyright (c) 2012 gomeeki. All rights reserved.
//

#import "DateButton.h"


#define reminderImageWidthAndHightSize 10.0;
#define reminderImageLeftMargin 1.0;

#define reminderImageTopMargin 1.0 + 10.0/2

@implementation DateButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

@synthesize date = _date;
@synthesize calendar = _calendar;

#pragma mark - =============== Getter methods ====================
-(UIImageView *)reminderImageView {
    if(!_reminderImageView){
        CGRect frame = self.frame;
        frame.size.width = frame.size.height = reminderImageWidthAndHightSize;
        frame.origin.x = reminderImageLeftMargin;
        frame.origin.y = reminderImageTopMargin;
        
        _reminderImageView = [[UIImageView alloc] initWithFrame:frame];
        [self addSubview:_reminderImageView];
    }
    return _reminderImageView;
}

#pragma mark - =============== Setter methods ====================
- (void)setDate:(NSDate *)date {
    _date = date;
    NSDateComponents *comps = [self.calendar components:NSDayCalendarUnit|NSMonthCalendarUnit fromDate:date];
    [self setTitle:[NSString stringWithFormat:@"%d", comps.day] forState:UIControlStateNormal];
}

-(void)setDeliveryBreakColor:(UIColor *)deliveryBreakColor{
    self.backgroundColor = deliveryBreakColor;
}

-(void)setReminderImage:(UIImage *)reminderImage{
    if(reminderImage != self.reminderImageView.image){
        self.reminderImageView.image = reminderImage;
    }
}
@end
