//
//  AboutView.m
//  TylerFlowers
//
//  Created by Tyler Flowers on 4/4/14.
//  Copyright (c) 2014 tylerflowers. All rights reserved.
//

#import "AboutView.h"

#define Rgb2UIColor(r, g, b)  [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]

@implementation AboutView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            float circleHeight = 125;
            float circleWidth = 125;
            
            CGRect labelPosition = CGRectMake((circleHeight/2) - circleHeight/2, (circleWidth/2) - (circleWidth/2)/2, circleWidth, circleHeight/2);

            
            CircleView *circleAbout = [[CircleView alloc] initWithFrame:CGRectMake(315, 34, 127, 127)];
            circleAbout.height = circleHeight;
            circleAbout.width = circleWidth;
            circleAbout.color = Rgb2UIColor(27, 163, 156);
            UILabel*aboutTitle = [[UILabel alloc] initWithFrame:labelPosition];
            aboutTitle.textAlignment = NSTextAlignmentCenter;
            aboutTitle.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:30];
            aboutTitle.textColor = [UIColor whiteColor];
            aboutTitle.text = @"Personal";
            [circleAbout addSubview:aboutTitle];
            [self addSubview:circleAbout];
            
            CircleView *circleEducation = [[CircleView alloc] initWithFrame:CGRectMake(315, 265, 127, 127)];
            circleEducation.height = circleHeight;
            circleEducation.width = circleWidth;
            circleEducation.color = Rgb2UIColor(27, 163, 156);
            UILabel *educationLabel = [[UILabel alloc] initWithFrame:labelPosition];
            educationLabel.textAlignment = NSTextAlignmentCenter;
            educationLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:30];
            educationLabel.textColor = [UIColor whiteColor];
            educationLabel.text = @"Education";
            [circleEducation addSubview:educationLabel];
            [self addSubview:circleEducation];
            
            CircleView *circleHobbies = [[CircleView alloc] initWithFrame:CGRectMake(490, 35, 127, 127)];
            circleHobbies.height = circleHeight;
            circleHobbies.width = circleWidth;
            circleHobbies.color = Rgb2UIColor(27, 163, 156);
            UILabel *hobbiesLabel = [[UILabel alloc] initWithFrame:labelPosition];
            hobbiesLabel.textAlignment = NSTextAlignmentCenter;
            hobbiesLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:30];
            hobbiesLabel.textColor = [UIColor whiteColor];
            hobbiesLabel.text = @"Hobbies";
            [circleHobbies addSubview:hobbiesLabel];
            [self addSubview:circleHobbies];
            
            CircleView *circleSkills = [[CircleView alloc] initWithFrame:CGRectMake(490, 264, 127, 127)];
            circleSkills.height = circleHeight;
            circleSkills.width = circleWidth;
            circleSkills.color = Rgb2UIColor(27, 163, 156);
            UILabel *skillsLabel = [[UILabel alloc] initWithFrame:labelPosition];
            skillsLabel.textAlignment = NSTextAlignmentCenter;
            skillsLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:30];
            skillsLabel.textColor = [UIColor whiteColor];
            skillsLabel.text = @"Skills";
            [circleSkills addSubview:skillsLabel];
            [self addSubview:circleSkills];
            
            UITextView *personalTextView = [[UITextView alloc] initWithFrame:CGRectMake(125, 35, 175, 200)];
            personalTextView.backgroundColor = [UIColor clearColor];
            personalTextView.textColor = [UIColor whiteColor];
            personalTextView.text = [NSString stringWithFormat:@"Tyler Flowers\n19\nDeveloper\nEngineer"];
            personalTextView.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:22];
            personalTextView.textAlignment = NSTextAlignmentRight;
            [self addSubview:personalTextView];
            
            UITextView *educationTextView = [[UITextView alloc] initWithFrame:CGRectMake(25, 264, 275, 200)];
            educationTextView.backgroundColor = [UIColor clearColor];
            educationTextView.textColor = [UIColor whiteColor];
            educationTextView.text = [NSString stringWithFormat:@"Homeschool '13\nSan Jose City College '15\nTransfer to CalPolySLO for Masters in CS"];
            educationTextView.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:22];
            educationTextView.textAlignment = NSTextAlignmentRight;
            [self addSubview:educationTextView];
            
            UITextView *hobbiesTextView = [[UITextView alloc] initWithFrame:CGRectMake(635, 35, 275, 200)];
            hobbiesTextView.backgroundColor = [UIColor clearColor];
            hobbiesTextView.textColor = [UIColor whiteColor];
            hobbiesTextView.text = [NSString stringWithFormat:@"Playing guitar\nLeading worship\nWatching Hockey\nGaming"];
            hobbiesTextView.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:22];
            hobbiesTextView.textAlignment = NSTextAlignmentLeft;
            [self addSubview:hobbiesTextView];
            
            UITextView *skillsTextView = [[UITextView alloc] initWithFrame:CGRectMake(635, 264, 275, 200)];
            skillsTextView.backgroundColor = [UIColor clearColor];
            skillsTextView.textColor = [UIColor whiteColor];
            skillsTextView.text = [NSString stringWithFormat:@"Objective-C\nC\nHTML\nJava"];
            skillsTextView.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:22];
            skillsTextView.textAlignment = NSTextAlignmentLeft;
            [self addSubview:skillsTextView];
            
        }
        else {
            UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
            scrollView.backgroundColor = [UIColor clearColor];
            scrollView.showsVerticalScrollIndicator = NO;
            
            float circleHeight = 100;
            float circleWidth = 100;
            CGRect labelPosition = CGRectMake((circleHeight/2) - (90/2), (circleWidth/2) - (circleWidth/2)/2, 90, circleHeight/2);
            
            CircleView *circleView = [[CircleView alloc] initWithFrame:CGRectMake(self.bounds.size.width/2 - circleWidth/2 - 1, 5, circleHeight + 2, circleWidth + 2)];
            circleView.backgroundColor = [UIColor clearColor];
            circleView.height = circleHeight;
            circleView.width = circleWidth;
            circleView.color = Rgb2UIColor(27, 163, 156);
            
            UILabel *title = [[UILabel alloc] initWithFrame:labelPosition];
            title.textAlignment = NSTextAlignmentCenter;
            title.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:25];
            title.textColor = [UIColor whiteColor];
            title.text = @"Personal";
            [circleView addSubview:title];
            
            [scrollView addSubview:circleView];
            
            UITextView *descriptionView = [[UITextView alloc] initWithFrame:CGRectMake(5, 115, frame.size.width-10, 100)];
            descriptionView.backgroundColor = [UIColor clearColor];
            descriptionView.textColor = [UIColor whiteColor];
            descriptionView.textAlignment = NSTextAlignmentCenter;
            descriptionView.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
            descriptionView.userInteractionEnabled = NO;
            descriptionView.text = [NSString stringWithFormat:@"Tyler Flowers\n19\nDeveloper\nEngineer"];
            descriptionView.editable = NO;
            [scrollView addSubview:descriptionView];
            
            CircleView *circleView2 = [[CircleView alloc] initWithFrame:CGRectMake(self.bounds.size.width/2 - circleWidth/2 - 1, 220, circleHeight + 2, circleWidth + 2)];
            circleView2.backgroundColor = [UIColor clearColor];
            circleView2.height = circleHeight;
            circleView2.width = circleWidth;
            circleView2.color = Rgb2UIColor(27, 163, 156);
            
            UILabel *title2 = [[UILabel alloc] initWithFrame:labelPosition];
            title2.textAlignment = NSTextAlignmentCenter;
            title2.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:20];
            title2.textColor = [UIColor whiteColor];
            title2.text = @"Education";
            [circleView2 addSubview:title2];
            
            [scrollView addSubview:circleView2];
            
            UITextView *descriptionView2 = [[UITextView alloc] initWithFrame:CGRectMake(5, 325, frame.size.width - 10, 100)];
            descriptionView2.backgroundColor = [UIColor clearColor];
            descriptionView2.textColor = [UIColor whiteColor];
            descriptionView2.textAlignment = NSTextAlignmentCenter;
            descriptionView2.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
            descriptionView2.userInteractionEnabled = NO;
            descriptionView2.text = [NSString stringWithFormat:@"Homeschool '13\nSan Jose City College '15\nTransfer to CalPolySLO for Masters in CS"];
            descriptionView2.editable = NO;
            [scrollView addSubview:descriptionView2];
            
            CircleView *circleView3 = [[CircleView alloc] initWithFrame:CGRectMake(self.bounds.size.width/2 - circleWidth/2 - 1, 435, circleHeight + 2, circleWidth + 2)];
            circleView3.backgroundColor = [UIColor clearColor];
            circleView3.height = circleHeight;
            circleView3.width = circleWidth;
            circleView3.color = Rgb2UIColor(27, 163, 156);
            
            UILabel *title3 = [[UILabel alloc] initWithFrame:labelPosition];
            title3.textAlignment = NSTextAlignmentCenter;
            title3.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:25];
            title3.textColor = [UIColor whiteColor];
            title3.text = @"Hobbies";
            [circleView3 addSubview:title3];
            
            [scrollView addSubview:circleView3];
            
            UITextView *descriptionView3 = [[UITextView alloc] initWithFrame:CGRectMake(5, 540, frame.size.width - 10, 100)];
            descriptionView3.backgroundColor = [UIColor clearColor];
            descriptionView3.textColor = [UIColor whiteColor];
            descriptionView3.textAlignment = NSTextAlignmentCenter;
            descriptionView3.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
            descriptionView3.userInteractionEnabled = NO;
            descriptionView3.text = [NSString stringWithFormat:@"Playing guitar\nLeading worship\nWatching Hockey\nGaming"];
            descriptionView3.editable = NO;
            [scrollView addSubview:descriptionView3];
            
            CircleView *circleView4 = [[CircleView alloc] initWithFrame:CGRectMake(self.bounds.size.width/2 - circleWidth/2 - 1, 645, circleHeight + 2, circleWidth + 2)];
            circleView4.backgroundColor = [UIColor clearColor];
            circleView4.height = circleHeight;
            circleView4.width = circleWidth;
            circleView4.color = Rgb2UIColor(27, 163, 156);
            
            UILabel *title4 = [[UILabel alloc] initWithFrame:labelPosition];
            title4.textAlignment = NSTextAlignmentCenter;
            title4.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:25];
            title4.textColor = [UIColor whiteColor];
            title4.text = @"Skills";
            [circleView4 addSubview:title4];
            
            [scrollView addSubview:circleView4];
            
            UITextView *descriptionView4 = [[UITextView alloc] initWithFrame:CGRectMake(5, 745, frame.size.width - 10, 100)];
            descriptionView4.backgroundColor = [UIColor clearColor];
            descriptionView4.textColor = [UIColor whiteColor];
            descriptionView4.textAlignment = NSTextAlignmentCenter;
            descriptionView4.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
            descriptionView4.userInteractionEnabled = NO;
            descriptionView4.text = [NSString stringWithFormat:@"Objective-C\nC\nHTML\nJava"];
            descriptionView4.editable = NO;
            [scrollView addSubview:descriptionView4];
            scrollView.contentSize = CGSizeMake(frame.size.width, 855);
            [self addSubview:scrollView];
            
            
        }
                
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
