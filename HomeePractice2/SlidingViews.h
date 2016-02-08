//
//  SlidingViews.h
//  HomeePractice2
//
//  Created by Chang Choi on 2/8/16.
//  Copyright © 2016 solechang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlidingViews : UIView  <UIScrollViewDelegate>

@property (nonatomic) UIView *sliderView;

// The height of the scrollView is shorten by 120 because the Y coorindate starts at 120
@property (nonatomic,strong) UIScrollView *scrollView;

@property (nonatomic) UIView *sliderButtonView;

// Users can change the name of the 3 different sectioned UILabels
@property (nonatomic) UILabel *label1;
@property (nonatomic) UILabel *label2;
@property (nonatomic) UILabel *label3;

/*
 * Instructions for setting up and using SlidingViews:
 * Step 1.) Create 3 properties of the view controllers that you are going to display
        - For example: @property (nonatomic, retain) ViewController *vc1;
                       @property (nonatomic, retain) ViewController *vc2;
                       @property (nonatomic, retain) ViewController *vc3;
 *
 * Step 2.)
 * Set up the frame of the View Controllers that you want to scroll through by setting the X coordinates of each View Controllers accordingly
 
    **** NOTE!!!! ****
    - However, since the default of the scrollView height shorten by 120, account for the height of the View Controllers that the users are going to scroll through
 
    For Example: make sure that
        a.) The first view controller's view has a frame of CGRectMake(self.view.bounds.size.width * 0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 120)
        b.) the second view controller's view has a frame of CGRectMake(self.view.bounds.size.width * 1, 0, self.view.bounds.size.width, self.view.bounds.size.height - 120)
        c.) the third view controller's view has a frame of CGRectMake(self.view.bounds.size.width * 2, 0, self.view.bounds.size.width, self.view.bounds.size.height - 120)

 *  Step 3.) addViewControllersToScrollView
 *  Step 4.) addSubview SlidingViews to current view
 */

- (void) addViewControllersToScrollView:(UIViewController*)controller1 :(UIViewController*)controller2 :(UIViewController*)controller3;

@end
