//
//  SlidingViews.m
//  HomeePractice2
//
//  Created by Jake Choi on 2/8/16.
//  Copyright © 2016 solechang. All rights reserved.
//

#import "SlidingViews.h"

@implementation SlidingViews

- (id) initWithFrame:(CGRect)frame {
    
}


- (void) setUpScrollView {
    
    //standard UIScrollView is added
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 120, self.currentView.bounds.size.width, self.currentView.bounds.size.height - 120)];
    
    self.scrollView.delegate = self;
    
    self.scrollView.bounces = NO;
    self.scrollView.pagingEnabled = YES;
    
    self.scrollView.contentSize = CGSizeMake(self.currentView.bounds.size.width*3, self.scrollView.bounds.size.height);
}

- (void) addViewControllersToScrollView:(UIViewController*)controller1 :(UIViewController*)controller2 :(UIViewController*)controller3 {
        
    //just adding 3 controllers
    [self.scrollView addSubview:controller1.view];
    

    [self.scrollView addSubview:controller2.view];
    
    [self.scrollView addSubview:controller3.view];

    [self.currentView addSubview:self.scrollView];
    
        
    
}

@end
