//
//  SlidingViews.h
//  HomeePractice2
//
//  Created by Jake Choi on 2/8/16.
//  Copyright © 2016 solechang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlidingViews : UIView  < UIScrollViewDelegate>

@property (nonatomic) UIView *currentView;

@property (nonatomic) UIView *sliderView;

@property (nonatomic,strong) UIScrollView *scrollView;

@property (nonatomic) UIView *slideButtonView;

// 3 different sections
@property (nonatomic) UILabel *label1;
@property (nonatomic) UILabel *label2;
@property (nonatomic) UILabel *label3;


- (void) setUpScrollView;


/*
 * Initialize the frame of the View Controllers first
 * For example make sure that the first view controller has a frame of CGRectMake(self.view.bounds.size.width* 0, 0, self.view.bounds.size.width, self.view.bounds.size.height)
 * the second view controller should have frame of CGRectMake(self.view.bounds.size.width * 1, 0, self.view.bounds.size.width, self.view.bounds.size.height)
 * and the third view controller should have a frame of CGRectMake(self.view.bounds.size.width * 2, 0, self.view.bounds.size.width, self.view.bounds.size.height)
 
 */
- (void) addViewControllersToScrollView:(UIViewController*)controller1 :(UIViewController*)controller2 :(UIViewController*)controller3;

@end
