//
//  Vision.m
//  TylerFlowers
//
//  Created by Tyler Flowers on 4/4/14.
//  Copyright (c) 2014 tylerflowers. All rights reserved.
//

#import "Vision.h"

@implementation Vision

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
        scrollView.userInteractionEnabled = YES;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width/2 - 75, 0, 150, 150)];
        imageView.image = [UIImage imageNamed:@"profile.png"];
        
        [scrollView addSubview:imageView];
        
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 175, frame.size.width, frame.size.height + 5)];
        textView.backgroundColor = [UIColor clearColor];
        textView.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:25];
        textView.textColor = [UIColor whiteColor];
        textView.textAlignment = NSTextAlignmentCenter;
        textView.text = @"I’ve grown up in Silicon Valley and all I’ve ever wanted to do was become part of the next generation of tech. I started programming a few years ago, and ever since then all I’ve wanted to do was to learn more and do more. WWDC is what I see as the next step to becoming a greater programmer. I want to build things that change the world. I want to help those around me by creating technologies that improve their everyday lives. I’m not a designer, but I love working on the specifics of code and would love to join other talented developers.";
        textView.userInteractionEnabled = NO;
        
        [scrollView addSubview:textView];
        
        [textView layoutIfNeeded];
        [textView sizeToFit];
        
        scrollView.contentSize = CGSizeMake(frame.size.width, textView.contentSize.height +180);
        
        [self addSubview:scrollView];

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
