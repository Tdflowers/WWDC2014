//
//  AppDetail.h
//  TylerFlowers
//
//  Created by Tyler Flowers on 4/4/14.
//  Copyright (c) 2014 tylerflowers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FXBlurView.h"

@interface ProjectDetail : UIView {
    
    UILabel *title;
    
    UITextView *descriptionView;
}
- (void)setTitle :(NSString *)titleText;
- (void)setProjDesription :(NSString *)description;

@end
