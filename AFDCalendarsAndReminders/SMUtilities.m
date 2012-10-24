//
//  SMUtilities.m
//  ABCForKids
//
//  Created by An Xu on 16/07/12.
//  Copyright (c) 2012 2ergo. All rights reserved.
//

#import "SMUtilities.h"

#define screenHeightof4InchScreen 568

@implementation SMUtilities

+(BOOL)isIphone{
    return ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone);
}

+(id)nibOfClass:(id)aClass owner:(id)owner{
    NSString *className = NSStringFromClass(aClass);
    NSArray *bundle = [[NSBundle mainBundle] loadNibNamed:className owner:owner options:nil];
    for (id object in bundle) {
        if ([object isKindOfClass:aClass]){
            return object;
        }
    }
    return nil;
}

@end
