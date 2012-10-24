//
//  DateButton.h
//  AFDCalendarsAndReminders
//
//  Created by An Xu on 23/10/12.
//  Copyright (c) 2012 gomeeki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateButton : UIButton

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSCalendar *calendar;

//for AFD clendar
@property (nonatomic, strong) UIColor       *deliveryBreakColor;
@property (nonatomic, strong) UIImage       *reminderImage;
@property (nonatomic, strong) UIImageView   *reminderImageView;
@end
