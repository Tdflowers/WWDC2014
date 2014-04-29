//
//  CircleView.m
//  WWDC14
//
//  Created by Tyler Flowers on 4/4/14.
//  Copyright (c) 2014 tylerflowers. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

@synthesize height, width, color;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2);
    
    CGContextSetStrokeColorWithColor(context, color.CGColor);
        
    CGContextAddEllipseInRect(context, CGRectMake(1, 1, height, width));
    
    CGContextStrokePath(context);
}

@end
