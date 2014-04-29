//
//  AppDetail.m
//  TylerFlowers
//
//  Created by Tyler Flowers on 4/4/14.
//  Copyright (c) 2014 tylerflowers. All rights reserved.
//

#import "ProjectDetail.h"
#import "CircleView.h"

#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]

@implementation ProjectDetail

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        float circleHeight = 100;
        float circleWidth = 100;
        CGRect labelPosition = CGRectMake((circleHeight/2) - (90/2), (circleWidth/2) - (circleWidth/2)/2, 90, circleHeight/2);
        
        CircleView *circleView = [[CircleView alloc] initWithFrame:CGRectMake(self.bounds.size.width/2 - circleWidth/2 - 1, 5, circleHeight + 2, circleWidth + 2)];
        circleView.backgroundColor = [UIColor clearColor];
        circleView.height = circleHeight;
        circleView.width = circleWidth;
        circleView.color = Rgb2UIColor(190, 144, 212);
        title = [[UILabel alloc] initWithFrame:labelPosition];
        title.textAlignment = NSTextAlignmentCenter;
        title.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:34];
        title.textColor = [UIColor whiteColor];
        [circleView addSubview:title];
        
        [self addSubview:circleView];
        
        /*
        
        blurView = [[FXBlurView alloc] initWithFrame:CGRectMake (0, 140, frame.size.width - 10, 300)];
        blurView.layer.cornerRadius = 15;
        blurView.layer.masksToBounds = YES;
        blurView.dynamic = NO;
        
        UIColor *color;
        
        if ((arc4random() % 5) > 4) {
            color = [UIColor colorWithRed:113.0/255.0 green:165.0/255.0 blue:246.0/255.0 alpha:1];
        }
        else
            color = [UIColor colorWithRed:142.0/255.0 green:68.0/255.0 blue:173.0/255.0 alpha:1];
        
        blurView.tintColor = color;
        blurView.blurRadius = 80;
        [blurView setBlurEnabled:YES];
         
         */
        
        descriptionView = [[UITextView alloc] initWithFrame:CGRectMake(0, 140, frame.size.width - 10, 280)];
        descriptionView.backgroundColor = [UIColor clearColor];
        descriptionView.textColor = [UIColor whiteColor];
        descriptionView.textAlignment = NSTextAlignmentCenter;
        descriptionView.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
        descriptionView.userInteractionEnabled = YES;
        descriptionView.editable = NO;
        descriptionView.selectable = NO;
        [self addSubview:descriptionView];
        
        //[self addSubview:blurView];

    }
    return self;
}

- (void)setProjDesription:(NSString *)description{
    descriptionView.text = description;
    
    CGRect rect = [descriptionView.layoutManager usedRectForTextContainer:[descriptionView textContainer]];
    
    descriptionView.contentSize = CGSizeMake(rect.size.width, rect.size.height);
}

- (void)setTitle:(NSString *)titleText{
    title.text = titleText;
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
