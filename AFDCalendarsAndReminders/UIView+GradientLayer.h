//
//  UIView+GradientLayer.h
//  AFDCalendarsAndReminders
//
//  Created by An Xu on 19/10/12.
//  Copyright (c) 2012 gomeeki. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CAGradientLayer;

@interface UIView (GradientLayer)

-(CAGradientLayer *)gradientLayerWithTopColor:(UIColor*)topColor bottomColor:(UIColor *)bottomColor;

-(void)addGradientLayerWithTopColor:(UIColor*)topColor bottomColor:(UIColor *)bottomColor;

@end
