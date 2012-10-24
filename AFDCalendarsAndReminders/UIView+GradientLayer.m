//
//  UIView+GradientLayer.m
//  AFDCalendarsAndReminders
//
//  Created by An Xu on 19/10/12.
//  Copyright (c) 2012 gomeeki. All rights reserved.
//

#import "UIView+GradientLayer.h"
#import <QuartzCore/QuartzCore.h>
@implementation UIView (GradientLayer)


-(CAGradientLayer *)gradientLayerWithTopColor:(UIColor*)topColor bottomColor:(UIColor *)bottomColor{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    
    gradient.colors = [NSArray arrayWithObjects:(__bridge id)[topColor CGColor], (__bridge id)[bottomColor CGColor], nil];
    
    return gradient;
}

-(void)addGradientLayerWithTopColor:(UIColor*)topColor bottomColor:(UIColor *)bottomColor{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    gradient.colors = [NSArray arrayWithObjects:(__bridge id)[topColor CGColor], (__bridge id)[bottomColor CGColor], nil];
    
    gradient.cornerRadius = 5.0f;
    
    [self.layer insertSublayer:gradient atIndex:0];
    

}


@end
