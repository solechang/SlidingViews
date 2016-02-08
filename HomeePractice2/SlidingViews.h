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

@property (nonatomic,strong) UIScrollView *scrollView;

@property (nonatomic) UIView *sliderButtonView;

// 3 different sections
// Users can change the name of the 3 different labels
@property (nonatomic) UILabel *label1;
@property (nonatomic) UILabel *label2;
@property (nonatomic) UILabel *label3;

/*
 * Instructions for setting up and using SlidingViews:
 * 1.) Make properties of the view controllers that you are going to display
        - For example: @property (nonatomic, retain) ShopTableViewController *shopTVC;
 *
 * 2.)
 * Set up the frame of the View Controllers that you want to scroll through by setting the X coordinates of each View Controllers accordingly
 * Make sure that the first view controller has a frame of CGRectMake(self.view.bounds.size.width * 0, 0, self.view.bounds.size.width, self.view.bounds.size.height)
 * the second view controller should have frame of CGRectMake(self.view.bounds.size.width * 1, 0, self.view.bounds.size.width, self.view.bounds.size.height)
 * and the third view controller should have a frame of CGRectMake(self.view.bounds.size.width * 2, 0, self.view.bounds.size.width, self.view.bounds.size.height)
 
 */
- (void) addViewControllersToScrollView:(UIViewController*)controller1 :(UIViewController*)controller2 :(UIViewController*)controller3;

@end
