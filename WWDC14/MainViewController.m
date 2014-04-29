//
//  MainViewController.m
//  WWDC14
//
//  Created by Tyler Flowers on 4/4/14.
//  Copyright (c) 2014 tylerflowers. All rights reserved.
//

#import "MainViewController.h"

#define kDeviceHeight [[UIScreen mainScreen]bounds].size.height

#define kSpringDappeningView .75f
#define kSpringDappeningButton .65f
#define kAnimationDuration .95f

#define kNumberOfButtons 3

//iPad Sizes
#define kiPadCircle 250
#define kiPadTopPositionY 150
#define kiPadTopPositionX 512

//iPhone Sizes
#define kiPhoneCircle5 150
#define kiPhoneCircle4 130
#define kiPhoneTopPostion

@interface MainViewController ()

@end

@implementation MainViewController

-(void)setRoundedView:(UIView *)roundedView toDiameter:(float)newSize;
{
    CGPoint saveCenter = roundedView.center;
    CGRect newFrame = CGRectMake(roundedView.frame.origin.x, roundedView.frame.origin.y, newSize, newSize);
    roundedView.frame = newFrame;
    roundedView.layer.cornerRadius = newSize / 2.0;
    roundedView.center = saveCenter;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


-(BOOL)prefersStatusBarHidden { return NO; }


- (void)setUpButtons{
    int textSize;
    
    if (iPadEnviroment)
    {
        circleHeight = kiPadCircle;
        circleWidth = kiPadCircle;
        textSize = 45;
    }
    else {
        if (kDeviceHeight == 568) {
            circleHeight = kiPhoneCircle5;
            circleWidth = kiPhoneCircle5;
            textSize = 25;
        }
        else {
            circleHeight = kiPhoneCircle4;
            circleWidth = kiPhoneCircle4;
            textSize = 25;
        }
    }
    
    CGRect labelPosition = CGRectMake((circleHeight/2) - ((circleHeight/2)/2), (circleWidth/2) - ((circleWidth/2)/2), circleWidth/2, circleHeight/2);
    CGRect circlePosition = CGRectMake(0, 0, circleWidth + 2, circleHeight + 2);
    
    //Add buttons to screen
    
    for (int i = 0; i < kNumberOfButtons; i++) {
        
        float buttonX;
        float buttonY;
        float spaceBetween;
        
        //Determine iPad or iPhone and choose X and Y for button
        
        if (iPadEnviroment) {
            spaceBetween = ((1024-(kNumberOfButtons*kiPadCircle))/(kNumberOfButtons + 1));
            buttonX = (((i+1)*spaceBetween) + (i * kiPadCircle) + kiPadCircle/2);
            buttonY = 386;
        }
        else {
            
            if (kDeviceHeight == 568) {
                spaceBetween = ((self.view.bounds.size.height-(kNumberOfButtons*kiPhoneCircle5))/(kNumberOfButtons + 1));
                buttonY = (((i+1)*spaceBetween) + (i * kiPhoneCircle5) + kiPhoneCircle5/2);
                buttonX = 160;
            }
            else {
                spaceBetween = ((self.view.bounds.size.height-(kNumberOfButtons*kiPhoneCircle4))/(kNumberOfButtons + 1));
                buttonY = (((i+1)*spaceBetween) + (i * kiPhoneCircle4) + kiPhoneCircle4/2);
                buttonX = 160;
            }
        }
        
        //
        //Create Circle and Label for the button
        //
        
        CircleView *circleView = [[CircleView alloc] initWithFrame:circlePosition];
        circleView.backgroundColor = [UIColor clearColor];
        circleView.height = circleHeight;
        circleView.width = circleWidth;
        circleView.color = [UIColor colorWithRed:113.0/255.0 green:165.0/255.0 blue:246.0/255.0 alpha:1];
        UILabel *label = [[UILabel alloc] initWithFrame:labelPosition];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:textSize];
        
        if (i == 0) {
            label.text = @"Apps";
        }
        else if (i == 1)
            label.text = @"About";
        else if (i==2)
            label.text = @"Vision";
        label.textColor = [UIColor whiteColor];
        [circleView addSubview:label];
        
        //
        // Create FXBlurView to blur behind button
        // Once we have set up the specifics add the above circle ontop
        //
        FXBlurView *blurCircle = [[FXBlurView alloc] initWithFrame:CGRectMake(0,0,circleHeight + 2,circleWidth + 2)];
        
        [self setRoundedView:blurCircle toDiameter:circleWidth + 2];
        blurCircle.center = CGPointMake(buttonX, buttonY);
        blurCircle.blurRadius = 40;
        blurCircle.dynamic = NO;
        blurCircle.tintColor = [UIColor clearColor];
        [blurCircle setBlurEnabled:YES];
        blurCircle.tag = i;
        [blurCircle addSubview:circleView];
        
        //
        // Add Tap Gestures Recognizers to actually turn into button
        //
        
        if (i == 0) {
            UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
            [blurCircle addGestureRecognizer:tapGesture1];
            blurAppsCircle = blurCircle;
            
        }
        else if (i == 1){
            UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
            [blurCircle addGestureRecognizer:tapGesture2];
            blurAboutCircle = blurCircle;
            
        }
        else if (i == 2){
            UITapGestureRecognizer *tapGesture3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
            [blurCircle addGestureRecognizer:tapGesture3];
            blurVisionCircle = blurCircle;
        }
    }
    
    //
    // Add the views to the main view
    //
    
    blurAppsCircle.alpha = 0;
    blurAboutCircle.alpha = 0;
    blurVisionCircle.alpha = 0;
    
    CGRect startLabelRect;
    CGRect label2Rect;
    int textSize1;
    int textSize2;
    int lines;
    
    if (iPadEnviroment) {
        startLabelRect = CGRectMake(251, 184, 522, 116);
        label2Rect = CGRectMake(0, 308, 1024, 75);
        textSize1 = 94;
        textSize2 = 40;
        lines = 1;
    }
    else {
        startLabelRect = CGRectMake(20, 173, 280, 105);
        label2Rect = CGRectMake(20, 260, 280, 105);
        textSize1 = 50;
        textSize2 = 23;
        lines = 2;
    }
    
    UILabel *startLabel = [[UILabel alloc] initWithFrame:startLabelRect];;
    startLabel.text = [NSString stringWithFormat:@"Tyler Flowers"];
    startLabel.numberOfLines = 1;
    startLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:textSize1];
    startLabel.textColor = [UIColor whiteColor];
    startLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:startLabel];
    
    UILabel *startLabel2 = [[UILabel alloc] initWithFrame:label2Rect];
    startLabel2.text = [NSString stringWithFormat:@"WWDC Student Scholarship App 2014"];
    startLabel2.numberOfLines = lines;
    startLabel2.lineBreakMode = NSLineBreakByWordWrapping;
    startLabel2.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:textSize2];
    startLabel2.textColor = [UIColor whiteColor];
    startLabel2.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:startLabel2];
    
    [self.view addSubview:blurAppsCircle];
    [self.view addSubview:blurAboutCircle];
    [self.view addSubview:blurVisionCircle];
    
    [UIView animateWithDuration:2 delay:2 options:UIViewAnimationOptionTransitionNone
                     animations:^{
                                blurAppsCircle.alpha = 1;
                                blurAboutCircle.alpha = 1;
                                blurVisionCircle.alpha = 1;
                                startLabel.alpha = 0;
                         startLabel2.alpha = 0;
                     } completion:^(BOOL finish) {
                         [startLabel removeFromSuperview];
                         [startLabel removeFromSuperview];
                     }];
     
    
    //
    // Apple isn't the only one in California making cool stuff.
    //
    
    UILabel *madeByLabel;
    if (iPadEnviroment) {
        madeByLabel = [[UILabel alloc] initWithFrame:CGRectMake(341, 745, 400, 21)];
        madeByLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:20];
        
    }
    else {
        madeByLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 30, 320, 21)];
        madeByLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:10];
    }
    madeByLabel.textAlignment = NSTextAlignmentCenter;
    madeByLabel.text = @"Designed by Tyler Flowers in California";
    [self.view addSubview:madeByLabel];
}

//171, 250

- (void)showAboutView{
    
    FXBlurView *aboutBlurView;
    
    if (iPadEnviroment) {
        aboutBlurView = [[FXBlurView alloc] initWithFrame:CGRectMake(50, 1024, 924, 475)];
    }
    else {
        aboutBlurView = [[FXBlurView alloc] initWithFrame:CGRectMake(5, 569, 310, 368)];
    }
    aboutBlurView.layer.cornerRadius = 15;
    aboutBlurView.layer.masksToBounds = YES;
    aboutBlurView.dynamic = NO;
    aboutBlurView.tintColor = [UIColor clearColor];
    aboutBlurView.blurRadius = 25;
    [aboutBlurView setBlurEnabled:YES];
    
    AboutView *aboutView;
    
    if (iPadEnviroment){
        aboutView = [[AboutView alloc] initWithFrame:CGRectMake(0, 0, 924, 475)];
    }
    else {
        if (kDeviceHeight == 568){
            aboutView = [[AboutView alloc] initWithFrame:CGRectMake(0, 0, 310, 368)];
        }
        else
            aboutView = [[AboutView alloc] initWithFrame:CGRectMake(0, 0, 310, 280)];
    }
    aboutBlurView.tag = 101;
    [aboutBlurView addSubview:aboutView];
    [self.view addSubview:aboutBlurView];
    
    if (iPadEnviroment) {
        [UIView animateWithDuration:kAnimationDuration delay:0 usingSpringWithDamping:kSpringDappeningView initialSpringVelocity:.5f options:UIViewAnimationOptionCurveLinear animations:^{aboutBlurView.frame = CGRectMake(50, 250, 924, 475);} completion:^(BOOL finished){}];
    }
    else {
        if (kDeviceHeight == 568){
            [UIView animateWithDuration:kAnimationDuration delay:0 usingSpringWithDamping:kSpringDappeningView initialSpringVelocity:.5f options:UIViewAnimationOptionCurveLinear animations:^{aboutBlurView.frame = CGRectMake(5, 150, 310, 368);} completion:^(BOOL finished){}];
        }
        else
        [UIView animateWithDuration:kAnimationDuration delay:0 usingSpringWithDamping:kSpringDappeningView initialSpringVelocity:.5f options:UIViewAnimationOptionCurveLinear animations:^{aboutBlurView.frame = CGRectMake(5, 150, 310, 280);} completion:^(BOOL finished){}];
    }
    
}

- (void)showVision {
    
    FXBlurView *visionBlurView;
    
    if (iPadEnviroment) {
        visionBlurView = [[FXBlurView alloc] initWithFrame:CGRectMake(171, 1024, 682, 475)];
    }
    else {
        visionBlurView = [[FXBlurView alloc] initWithFrame:CGRectMake(5, 569, 310, 368)];
    }
    visionBlurView.layer.cornerRadius = 15;
    visionBlurView.layer.masksToBounds = YES;
    visionBlurView.dynamic = NO;
    visionBlurView.tintColor = [UIColor clearColor];
    visionBlurView.blurRadius = 25;
    [visionBlurView setBlurEnabled:YES];
    
    Vision *visionView;
    
    if (iPadEnviroment){
        visionView = [[Vision alloc] initWithFrame:CGRectMake(0, 0, 682, 475)];
    }
    else {
        if (kDeviceHeight == 568)
            visionView = [[Vision alloc] initWithFrame:CGRectMake(0, 0, 310, 368)];
        else
            visionView = [[Vision alloc] initWithFrame:CGRectMake(0, 0, 310, 280)];
    }
    visionBlurView.tag = 103;
    [visionBlurView addSubview:visionView];
    [self.view addSubview:visionBlurView];
    
    if (iPadEnviroment) {
        [UIView animateWithDuration:kAnimationDuration delay:0 usingSpringWithDamping:kSpringDappeningView initialSpringVelocity:.5f options:UIViewAnimationOptionCurveLinear animations:^{visionBlurView.frame = CGRectMake(171, 250, 682, 475);} completion:^(BOOL finished){}];
    }
    else {
        if (kDeviceHeight == 568) {
            [UIView animateWithDuration:kAnimationDuration delay:0 usingSpringWithDamping:kSpringDappeningView initialSpringVelocity:.5f options:UIViewAnimationOptionCurveLinear animations:^{visionBlurView.frame = CGRectMake(5, 150, 310, 368);} completion:^(BOOL finished){}];
        }
        else
            [UIView animateWithDuration:kAnimationDuration delay:0 usingSpringWithDamping:kSpringDappeningView initialSpringVelocity:.5f options:UIViewAnimationOptionCurveLinear animations:^{visionBlurView.frame = CGRectMake(5, 150, 310, 280);} completion:^(BOOL finished){}];
    }

    
}

- (void)showProjects {
    
    int tall;
    int wide;
    
    int x;
    int y;
    NSArray *countArrayX;
    NSArray *countArrayY;
    
    if (iPadEnviroment) {
        tall = 1;
        wide = 5;
        x = 250;
        y = 25;
        countArrayX = [NSArray arrayWithObjects:@0,@1,@2,@3,@4, nil];
        countArrayY = [NSArray arrayWithObjects:@1,@1,@1,@1,@1, nil];
        
    }
    else {
        wide = 1;
        tall = 5;
        x = 25;
        y = 440;
        countArrayY = [NSArray arrayWithObjects:@0,@1,@2,@3, @4, nil];
        countArrayX= [NSArray arrayWithObjects:@1,@1,@1,@1,@1, nil];
    }
    
    FXBlurView *projectsBlurView;
    UIScrollView *scrollView;
    
    if (iPadEnviroment) {
        projectsBlurView = [[FXBlurView alloc] initWithFrame:CGRectMake(50, 924, 735, 475)];
        scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 924, 475)];

    }
    else {
        if (kDeviceHeight == 568) {
            projectsBlurView = [[FXBlurView alloc] initWithFrame:CGRectMake(10, 569, 300, 380)];
            scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 300, 380)];
        }
        else {
            projectsBlurView = [[FXBlurView alloc] initWithFrame:CGRectMake(10, 569, 300, 274)];
            scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 300, 274)];
        }

    }
    projectsBlurView.layer.cornerRadius = 15;
    projectsBlurView.layer.masksToBounds = YES;
    projectsBlurView.dynamic = NO;
    projectsBlurView.tintColor = [UIColor clearColor];
    projectsBlurView.blurRadius = 25;
    [projectsBlurView setBlurEnabled:YES];
    
    scrollView.showsVerticalScrollIndicator = NO;
    
    evhsView = [[ProjectDetail alloc] initWithFrame:CGRectMake([[countArrayX objectAtIndex:0] integerValue] * x, y * [[countArrayY objectAtIndex:0] integerValue], 250, 400)];
    [evhsView setTitle:@"EVHS"];
    NSString *textString = [NSString stringWithFormat:@"Evergreen Valley High School\nAn app built by iSchoolerz that I lead code development on. It was an awesome challenge. I learned to download an XML file, parse the data, and display it for the user. I also was forced to do get things working and it taught me so many things."];
    projectsBlurView.tag = 102;
    [scrollView addSubview:evhsView];
    
    [evhsView setProjDesription:textString];
    
    
    timeMarksView = [[ProjectDetail alloc] initWithFrame:CGRectMake([[countArrayX objectAtIndex:1] integerValue] * x, y * [[countArrayY objectAtIndex:1] integerValue], 250, 400)];
    [timeMarksView setTitle:@"TM"];
    [scrollView addSubview:timeMarksView];
    [timeMarksView setProjDesription:[NSString stringWithFormat:@"Time Marks\nAt my church we record the sermons using a DVD recorder. The problem is before we used the DVD recorder we used a laptop where we could make video breaks for the the slide would change. I suggested that if we ran a timer alongside the recorder we could mark when the slides were. I thought this was going to be easy, but as it turns out NSDates are annoying and Timers can't run in the background. Eventually I actually reverse engineered the structure of Apple's Timer app to build my own."]];
    
    animalView = [[ProjectDetail alloc] initWithFrame:CGRectMake([[countArrayX objectAtIndex:2] integerValue] * x, y * [[countArrayY objectAtIndex:2] integerValue], 250, 400)];
    [animalView setTitle:@"AF"];
    [scrollView addSubview:animalView];
    [animalView setProjDesription:[NSString stringWithFormat:@"Animal Facts\nMy first app on the App Store. Starting out as Giraffe Facts, I built this app to prove to a friend that I could do iOS programming. This is where I learned about messing with arrays and plist files. After the inital giraffe facts I completely rewrote the app to supply multiple animals simply by adding an image file, facts, and a button to show them"]];
    
    [projectsBlurView addSubview:scrollView];
    
    ProjectDetail *keyperView = [[ProjectDetail alloc] initWithFrame:CGRectMake([[countArrayX objectAtIndex:3] integerValue] * x, y * [[countArrayY objectAtIndex:3] integerValue], 250, 400)];
    [keyperView setTitle:@"KP"];
    [scrollView addSubview:keyperView];
    [keyperView setProjDesription:[NSString stringWithFormat:@"Keyper\nAs a musician and leader of the youth worship band at my Church I carry around quite a bit of music. The problem is sometimes it's hard to go through all the copies and know what we have, what we've learned, when we last played it and more. With Keyper I began by creating a list of songs that you can add to and remove. Once you create it you can share with others using the .kyds file format and the Open In... framework"]];
    
    ProjectDetail *eyeflyView = [[ProjectDetail alloc] initWithFrame:CGRectMake([[countArrayX objectAtIndex:4] integerValue] * x, y*[[countArrayY objectAtIndex:4] integerValue], 250, 400)];
    [eyeflyView setTitle:@"EF"];
    [scrollView addSubview:eyeflyView];
    [eyeflyView setProjDesription:[NSString stringWithFormat:@"Eyefly\nA hackthon project during a StudentRND where we played a form of Doodle Jump by tracking the user's head. I worked with two others to create this app in less than 24 hours. We won best application and \"Most Technically Challenging\""]] ;
    
   
    
    [self.view addSubview:projectsBlurView];

    [scrollView setContentSize:CGSizeMake(250 *wide, 440 *tall)];

    if (iPadEnviroment) {
        [UIView animateWithDuration:kAnimationDuration delay:0 usingSpringWithDamping:kSpringDappeningView initialSpringVelocity:.5f options:UIViewAnimationOptionCurveLinear animations:^{projectsBlurView.frame = CGRectMake(50, 250, 924, 475);} completion:^(BOOL finished){}];
    }
    else {
        
        if (kDeviceHeight == 568) {
            [UIView animateWithDuration:kAnimationDuration delay:0 usingSpringWithDamping:kSpringDappeningView initialSpringVelocity:.5f options:UIViewAnimationOptionCurveLinear animations:^{projectsBlurView.frame = CGRectMake(10, 150, 300, 380);} completion:^(BOOL finished){}];
        }
        else {
            [UIView animateWithDuration:kAnimationDuration delay:0 usingSpringWithDamping:kSpringDappeningView initialSpringVelocity:.5f options:UIViewAnimationOptionCurveLinear animations:^{projectsBlurView.frame = CGRectMake(10, 150, 300, 274);} completion:^(BOOL finished){}];
        }
    }
}

- (void)handleTap:(UITapGestureRecognizer*)sender{
    
    __block float positionX;
    __block float positionY;
    __block float spaceBetween;
    
    __block float animateY;
    
    if (iPadEnviroment) {
        spaceBetween = ((1024 - (kNumberOfButtons*kiPadCircle))/(kNumberOfButtons + 1));
        positionX = (((sender.view.tag + 1)*spaceBetween) + (sender.view.tag * kiPadCircle) + kiPadCircle/2);
        positionY = 386;
        animateY = 130;
    }
    else {
        
        if (kDeviceHeight == 568) {
            spaceBetween = ((568 - (kNumberOfButtons*kiPhoneCircle5))/(kNumberOfButtons + 1));
            positionY = (((sender.view.tag + 1)*spaceBetween) + (sender.view.tag * kiPhoneCircle5) + kiPhoneCircle5/2);
            positionX = 160;
            animateY = 75;
        }
        else {
            spaceBetween = ((480 - (kNumberOfButtons*kiPhoneCircle4))/(kNumberOfButtons + 1));
            positionY = (((sender.view.tag + 1)*spaceBetween) + (sender.view.tag * kiPhoneCircle4) + kiPhoneCircle4/2);
            positionX = 160;
            animateY = 75;
        }
        
        
    }
    
    if (sender.view.center.y == 75 || sender.view.center.y == 130){
        switch (sender.view.tag) {
            {case 0:
                for (UIView *subView in self.view.subviews)
                {
                    if (subView.tag == 102)
                    {
                        if (iPadEnviroment) {
                            [UIView animateWithDuration:kAnimationDuration delay:0 usingSpringWithDamping:kSpringDappeningButton initialSpringVelocity:.01f options:UIViewAnimationOptionCurveLinear animations:^{subView.frame = CGRectMake(171, 1024, 682, 575);} completion:^(BOOL finished){[subView removeFromSuperview];}];
                        }
                        else {
                            [UIView animateWithDuration:kAnimationDuration delay:0 usingSpringWithDamping:kSpringDappeningButton initialSpringVelocity:.01f options:UIViewAnimationOptionCurveLinear animations:^{subView.frame = CGRectMake(5, 568, 310, 700);} completion:^(BOOL finished){[subView removeFromSuperview];}];
                        }
                        
                    }
                }
                blurAppsCircle.dynamic = YES;
                [UIView animateWithDuration:kAnimationDuration delay:0 usingSpringWithDamping:kSpringDappeningButton initialSpringVelocity:.01f options:UIViewAnimationOptionCurveLinear animations:^{
                    sender.view.center = CGPointMake(positionX, positionY);
                    sender.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
                    blurVisionCircle.alpha = 1;
                    blurAboutCircle.alpha = 1;
                    blurAppsCircle.alpha = 1;
                    
                } completion:^(BOOL finished){blurAppsCircle.dynamic = NO;}];
                break;}
            {case 1:
                blurAboutCircle.dynamic = YES;
                for (UIView *subView in self.view.subviews)
                {
                    if (subView.tag == 101)
                    {
                        if (iPadEnviroment) {
                            [UIView animateWithDuration:kAnimationDuration delay:0 usingSpringWithDamping:kSpringDappeningButton initialSpringVelocity:.01f options:UIViewAnimationOptionCurveLinear animations:^{subView.frame = CGRectMake(171, 1024, 682, 575);} completion:^(BOOL finished){[subView removeFromSuperview];}];
                        }
                        else {
                            [UIView animateWithDuration:kAnimationDuration delay:0 usingSpringWithDamping:kSpringDappeningButton initialSpringVelocity:.01f options:UIViewAnimationOptionCurveLinear animations:^{subView.frame = CGRectMake(5, 568, 310, 700);} completion:^(BOOL finished){[subView removeFromSuperview];}];
                        }
                        
                    }
                }
                [UIView animateWithDuration:kAnimationDuration delay:0 usingSpringWithDamping:kSpringDappeningButton initialSpringVelocity:.01f options:UIViewAnimationOptionCurveLinear animations:^{
                    sender.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
                    sender.view.center = CGPointMake(positionX, positionY);
                    blurVisionCircle.alpha = 1;
                    blurAppsCircle.alpha = 1;
                    blurAboutCircle.alpha = 1;
                } completion:^(BOOL finished){blurAboutCircle.dynamic = NO;}];
                break;}
            {case 2:
                blurVisionCircle.dynamic = YES;
                for (UIView *subView in self.view.subviews)
                {
                    if (subView.tag == 103)
                    {
                        if (iPadEnviroment) {
                            [UIView animateWithDuration:kAnimationDuration delay:0 usingSpringWithDamping:kSpringDappeningButton initialSpringVelocity:.01f options:UIViewAnimationOptionCurveLinear animations:^{subView.frame = CGRectMake(171, 1024, 682, 575);} completion:^(BOOL finished){[subView removeFromSuperview];}];
                        }
                        else {
                            [UIView animateWithDuration:kAnimationDuration delay:0 usingSpringWithDamping:kSpringDappeningButton initialSpringVelocity:.01f options:UIViewAnimationOptionCurveLinear animations:^{subView.frame = CGRectMake(5, 568, 310, 700);} completion:^(BOOL finished){[subView removeFromSuperview];}];
                        }
                        
                    }
                }
                [UIView animateWithDuration:kAnimationDuration delay:0 usingSpringWithDamping:kSpringDappeningButton initialSpringVelocity:.01f options:UIViewAnimationOptionCurveLinear animations:^{
                    sender.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
                    sender.view.center = CGPointMake(positionX, positionY);
                    blurAppsCircle.alpha = 1;
                    blurAboutCircle.alpha = 1;
                    blurVisionCircle.alpha = 1;
                } completion:^(BOOL finished){blurVisionCircle.dynamic = NO;}];
                break;}
            default:
                break;
        }
    }
    else if (sender.view.center.y != 130 || sender.view.center.y != 75){
        
            switch (sender.view.tag) {
                {case 0:
                    [self showProjects];
                    blurAppsCircle.dynamic = YES;
                    [UIView animateWithDuration:kAnimationDuration delay:0 usingSpringWithDamping:kSpringDappeningButton initialSpringVelocity:.01f options:UIViewAnimationOptionTransitionCurlDown animations:^{
                        sender.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, .65, .65);
                        sender.view.center = CGPointMake(self.view.bounds.size.width/2, animateY);
                        blurVisionCircle.alpha = 0;
                        blurAboutCircle.alpha = 0;
                        blurAppsCircle.alpha = 1;
                        
                    }completion:^(BOOL finished){blurAppsCircle.dynamic = NO;}];
                    break;}
                {case 1:
                    [self showAboutView];
                    blurAboutCircle.dynamic = YES;
                    [UIView animateWithDuration:kAnimationDuration delay:0 usingSpringWithDamping:kSpringDappeningButton initialSpringVelocity:.01f options:UIViewAnimationOptionCurveLinear animations:^{
                        sender.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, .65, .65);
                        sender.view.center = CGPointMake(self.view.bounds.size.width/2, animateY);
                        blurVisionCircle.alpha = 0;
                        blurAppsCircle.alpha = 0;
                        blurAboutCircle.alpha = 1;
                    }completion:^(BOOL finished){ blurAboutCircle.dynamic = NO;}];
                    break;}
                {case 2:
                    [self showVision];
                    blurVisionCircle.dynamic = YES;
                    [UIView animateWithDuration:kAnimationDuration delay:0 usingSpringWithDamping:kSpringDappeningButton initialSpringVelocity:.01f options:UIViewAnimationOptionCurveLinear animations:^{
                        sender.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, .65, .65);
                        sender.view.center = CGPointMake(self.view.bounds.size.width/2, animateY);
                        blurAppsCircle.alpha = 0;
                        blurAboutCircle.alpha = 0;
                        blurVisionCircle.alpha = 1;
                    }completion:^(BOOL finished){
                        blurVisionCircle.dynamic = NO;}];
                    break;}
                default:
                    break;
            }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect frame;
    
    NSLog(@"%f", kDeviceHeight);
    
    //Add background image and then blur.
    if ( kDeviceHeight == 1024 )
    {
        iPadEnviroment = YES;
        frame = CGRectMake(0, 0, 1024, 768);
        
    }
    else if (kDeviceHeight == 568){
        iPadEnviroment = NO;
        frame = CGRectMake(0, 0, 320, 568);
    }
    else if (kDeviceHeight == 480){
        frame = CGRectMake(0, 0, 320, 480);
    }
    
    blurBackground = [[FXBlurView alloc] initWithFrame:frame];
    UIImage *image = [UIImage imageNamed:@"background.jpg"];
    [self.view addSubview:[[UIImageView alloc]initWithImage:image]];
    blurBackground.blurRadius = 10;
    blurBackground.tintColor = [UIColor clearColor];
    blurBackground.dynamic = NO;
    [blurBackground setBlurEnabled:YES];
    [self.view addSubview:blurBackground];
    
   
    [self setUpButtons];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
