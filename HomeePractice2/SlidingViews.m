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
    
    if ((self = [super initWithFrame:frame])) {
        [self setUpScrollView];
        [self createCustomSliderView];
        [self createSliderButtonView];
        [self setUpLabels];
        
    }
    return self;
}

- (void) setUpScrollView {

    // Depending on the height of the slider you want to use, users can change the height accordingly
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 120, self.bounds.size.width, self.bounds.size.height - 120)];
    
    self.scrollView.delegate = self;
    
    self.scrollView.bounces = NO;
    self.scrollView.pagingEnabled = YES;
    
    self.scrollView.contentSize = CGSizeMake(self.bounds.size.width * 3, self.scrollView.bounds.size.height);
}

- (void) addViewControllersToScrollView:(UIViewController*)controller1 :(UIViewController*)controller2 :(UIViewController*)controller3 {
        
    //just adding 3 controllers
    [self.scrollView addSubview:controller1.view];
    
    [self.scrollView addSubview:controller2.view];
    
    [self.scrollView addSubview:controller3.view];

    [self addSubview:self.scrollView];
    
}

- (void) createCustomSliderView {
    
    self.sliderView = [[UIView alloc] initWithFrame:CGRectMake(5, 65, self.bounds.size.width - 10, 30)];
    [self.sliderView setBackgroundColor:[UIColor lightGrayColor]];
    self.sliderView.layer.cornerRadius = 15.0;
    self.sliderView.layer.masksToBounds = YES;
    
}

- (void) createSliderButtonView {

    self.sliderButtonView = [[UIView alloc]  initWithFrame:CGRectMake(0, 0, 100, 30)];
    self.sliderButtonView.tag = 0;
    self.sliderButtonView.alpha = 0.7;
    [self.sliderButtonView setBackgroundColor:[UIColor whiteColor]];
}

- (void) setUpLabels {

    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [tapRecognizer setNumberOfTapsRequired:1];
    
    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    [self.label1 setBackgroundColor:[UIColor redColor]];
    self.label1.textAlignment = NSTextAlignmentCenter;
    self.label1.text = @"Chat";
    self.label1.textColor = [UIColor colorWithRed: 180.0/255.0 green: 238.0/255.0 blue:180.0/255.0 alpha: 1.0];
    [self.label1 addGestureRecognizer:tapRecognizer];
    self.label1.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapDesignRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [tapRecognizer setNumberOfTapsRequired:1];
    
    self.label2 = [[UILabel alloc] initWithFrame:
                        CGRectMake(self.sliderView.bounds.size.width/2 - 50.0f, 0, 100, 30)];
    self.label2.text = @"Design";
    self.label2.textAlignment = NSTextAlignmentCenter;
    [self.label2 setBackgroundColor:[UIColor redColor]];
    [self.label2 addGestureRecognizer:tapDesignRecognizer];
    self.label2.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapShopRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [tapRecognizer setNumberOfTapsRequired:1];
    
    self.label3 = [[UILabel alloc] initWithFrame:
                      CGRectMake(self.sliderView.bounds.size.width- 100, 0, 100, 30)];
    self.label3.text = @"Shop";
    [self.label3 addGestureRecognizer:tapShopRecognizer];
    [self.label3 setBackgroundColor:[UIColor redColor]];
    self.label3.userInteractionEnabled = YES;
    self.label3.textAlignment = NSTextAlignmentCenter;
    
    [self.sliderView addSubview:self.label1];
    [self.sliderView addSubview:self.label2];
    [self.sliderView addSubview:self.label3];
    
    [self.sliderView addSubview: self.sliderButtonView];
    
    [self addSubview:self.sliderView];
    
}

- (void) tapped:(UIGestureRecognizer *)gesture {
    
    if (gesture.view == self.label1) {
        
        [self.scrollView setContentOffset:CGPointMake(self.bounds.size.width * 0, 0) animated:YES];
        [self changeTextColor:0];
        
    } else if (gesture.view == self.label2) {
        
        [self.scrollView setContentOffset:CGPointMake(self.bounds.size.width * 1, 0) animated:YES];
        [self changeTextColor:1];
        
    } else if (gesture.view == self.label3) {

        [self.scrollView setContentOffset:CGPointMake(self.bounds.size.width * 2, 0) animated:YES];
        [self changeTextColor:2];
        
    }
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:self.sliderView];
    
    if ([touch view] == self.sliderButtonView) {
        [self.scrollView setContentOffset:CGPointMake( 2*location.x, 1)];
        
    }
}

-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:self];
    
    if ([touch view] == self.sliderButtonView) {
        
        float sliderValue = location.x / self.bounds.size.width;
        
        if (sliderValue > .33 && sliderValue < .63) {
            // Design (Middle Section)
            [self.scrollView setContentOffset:CGPointMake(self.bounds.size.width*1, 0) animated:YES];
            [self changeTextColor:1];
            
        } else if (sliderValue > .63) {
            
            // Shop (Right Section)
            [self.scrollView setContentOffset:CGPointMake(self.bounds.size.width*2, 0) animated:YES];
            [self changeTextColor:2];
            
        } else if (sliderValue < .33) {
            
            // Chat (Left Section)

            [self.scrollView setContentOffset:CGPointMake(self.bounds.size.width*0, 0) animated:YES];
            [self changeTextColor:0];
            
        }
        
    }
    
    
    
}

- (void) changeTextColor :(int) label{
    if (label == 0) {
        self.label1.textColor = [UIColor colorWithRed: 180.0/255.0 green: 238.0/255.0 blue:180.0/255.0 alpha: 1.0];
        self.label3.textColor= [UIColor blackColor];
        self.label2.textColor = [UIColor blackColor];
    } else if (label == 1) {
        self.label1.textColor = [UIColor blackColor];
        self.label3.textColor= [UIColor blackColor];
        self.label2.textColor = [UIColor colorWithRed: 180.0/255.0 green: 238.0/255.0 blue:180.0/255.0 alpha: 1.0];
        
    } else {
        
        self.label1.textColor = [UIColor blackColor];
        self.label3.textColor= [UIColor colorWithRed: 180.0/255.0 green: 238.0/255.0 blue:180.0/255.0 alpha: 1.0];
        self.label2.textColor =  [UIColor blackColor];
        
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    // When the animation of the scrollView ends
    // Need this when the user taps on the button sections
    CGRect frame = self.sliderButtonView.frame;
    
    if (scrollView.contentOffset.x < 750.0/3.0) {
        
        frame.origin.x = 0.0f ;
        
    } else if ((scrollView.contentOffset.x > 750.0/3.0) && scrollView.contentOffset.x < 750.0*(2.0/3.0)) {
        
        frame.origin.x = self.sliderView.bounds.size.width/2.0f - 50.0f;
        
    } else if (scrollView.contentOffset.x > 750.0*(2.0/3.0)) {
        
        
        frame.origin.x = self.sliderView.bounds.size.width - 100.0f;
        
    }
    self.sliderButtonView.frame = frame;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // When the scrollView is scrolling
    
    //    NSLog(@"0.) %f",scrollView.contentOffset.x/((self.sliderView.bounds.size.width)/((self.sliderView.bounds.size.width/2) -50.0)));
    
    CGRect frame = self.sliderButtonView.frame;
    
    // -10 because that is the width size of the scrollView compared to view.bounds.size.width
    frame.origin.x = ((scrollView.contentOffset.x-10)/
                      ((self.sliderView.bounds.size.width)/
                       ((self.sliderView.bounds.size.width/2) - 50.0)));
    
    if (frame.origin.x >= 0 && frame.origin.x <= self.sliderView.bounds.size.width - 100.0f) {
        // 100.0f is the size of the section views
        // Left end and Right end so that the sliderButton doesn't go out of bounds
        
        self.sliderButtonView.frame = frame;
    }
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    // scrollView stopped moving
    CGRect frame = self.sliderButtonView.frame;
    
    if (scrollView.contentOffset.x < 750.0/3.0) {
        
        frame.origin.x = 0.0f ;
        [self changeTextColor:0];
        
    } else if ((scrollView.contentOffset.x > 750.0/3.0) && scrollView.contentOffset.x < 750.0*(2.0/3.0)) {
        
        
        frame.origin.x = self.sliderView.bounds.size.width/2.0f - 50.0f;
        
        [self changeTextColor:1];
        
    } else if (scrollView.contentOffset.x > 750.0*(2.0/3.0)) {
        
        
        frame.origin.x = self.sliderView.bounds.size.width - 100.0f;
        [self changeTextColor:2];
    }
    self.sliderButtonView.frame = frame;
    
}

@end
