//
//  MainViewController.h
//  WWDC14
//
//  Created by Tyler Flowers on 4/4/14.
//  Copyright (c) 2014 tylerflowers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleView.h"
#import "FXBlurView.h"
#import "AboutView.h"
#import "Vision.h"
#import "ProjectDetail.h"

@interface MainViewController : UIViewController <UIGestureRecognizerDelegate>{
    
    FXBlurView *blurBackground;
    FXBlurView *blurAppsCircle;
    FXBlurView *blurAboutCircle;
    FXBlurView *blurVisionCircle;
    
    ProjectDetail *evhsView;
    ProjectDetail *timeMarksView;
    ProjectDetail *animalView;
    
    int circleHeight;
    int circleWidth;
    
    BOOL iPadEnviroment;
}

- (void)handleTap:(UITapGestureRecognizer*)sender;

@end
