 //
//  MainHomeeViewController.m
//  HomeePractice2
//
//  Created by Jake Choi on 2/1/16.
//  Copyright © 2016 solechang. All rights reserved.
//

#import "MainHomeeViewController.h"
#import "Room.h"

@interface MainHomeeViewController () <UIScrollViewDelegate>
@property (nonatomic) UIScrollView *scrollView;

@property (nonatomic) int currentPage;

@property (nonatomic) NSMutableArray *roomsArray;

@end

@implementation MainHomeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self initializeRoomsArray];
    
    [self initializeViewElements];
    
    [self setUpScrollView];
    
}

- (void) initializeRoomsArray {
    self.roomsArray = [[NSMutableArray alloc] init];
    
    Room *room = [[Room alloc] initWithRoomDescription:@"HI" :@"HELLO" :@"Lets get work done" ];
    [self.roomsArray addObject:room];

}

- (void) initializeViewElements {
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void) setUpScrollView {
    
    //standard UIScrollView is added
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    self.scrollView.delegate = self;
    
    self.scrollView.bounces = NO;
//    self.scrollView.clipsToBounds = NO;
    self.scrollView.pagingEnabled = NO;
    
    float startingPoint = 60.0f;
    
    
    self.scrollView.contentSize = CGSizeMake(60.0f + self.roomsArray.count*10.0f + 3.0f*(self.view.bounds.size.width/1.5f) +250.0f + 60.0f  , self.scrollView.bounds.size.height); //this must be the appropriate size!

    

    [self.scrollView setBackgroundColor:[UIColor yellowColor]];
    
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(60.0, 100, self.view.bounds.size.width/1.5f, self.view.bounds.size.height*.5)];
    [view1 setBackgroundColor:[UIColor blueColor]];
    [self.scrollView addSubview:view1];
    
//    NSLog(@"2.)Content size:  %f ",  self.view.bounds.size.width/1.5f );
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(60.0f + 10.0f + (self.view.bounds.size.width/1.5f), 100, self.view.bounds.size.width/1.5, self.view.bounds.size.height*.5)];
    [view2 setBackgroundColor:[UIColor redColor]];
    [self.scrollView addSubview:view2];
    
//    NSLog(@"3.)Content size:  %f ", 60.0f + 10.0f + (self.view.bounds.size.width/1.5f));
    
    UIView *view3 = [[UIView alloc] initWithFrame:
                     CGRectMake(60.0f + 20.0f + 2.0f*(self.view.bounds.size.width/1.5), 100, self.view.bounds.size.width/1.5f, self.view.bounds.size.height*.5)];
    [view3 setBackgroundColor:[UIColor greenColor]];
    [self.scrollView addSubview:view3];
    
//    NSLog(@"4.)Content size:  %f ", 60.0f + 20.0f + 2.0f*(self.view.bounds.size.width/1.5));
    
    
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(60.0f + 30.0f + 3.0f*(self.view.bounds.size.width/1.5f), 100, self.view.bounds.size.width/1.5f, self.view.bounds.size.height*.5)];
    [view4 setBackgroundColor:[UIColor cyanColor]];
    [self.scrollView addSubview:view4];
    
    NSLog(@"1.)Content size:  %f ", (4*self.scrollView.bounds.size.width/1.50f ));
    NSLog(@"2.)Content size:  %f ", self.scrollView.bounds.size.width/1.50f );
    NSLog(@"5.)Content size:  %f ", 60.0f + 30.0f + 3.0f*(self.view.bounds.size.width/1.5f) +250.0f + 60.0f);
    
    [self.view addSubview:self.scrollView];
    
    
    
}

#pragma mark - scrollView Delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    
}

- (void) scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    CGFloat pageWidth = self.scrollView.frame.size.width/1.5 + 10 /* Optional Photo app like gap between images */;
    
    self.currentPage = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
}


-(void) scrollViewWillEndDragging:(UIScrollView*)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint*)targetContentOffset {
    
    CGFloat pageWidth = self.scrollView.frame.size.width/1.5 + 10;
    
    int newPage = self.currentPage;
    
    if (velocity.x == 0) // slow dragging not lifting finger
    {
        newPage = floor((targetContentOffset->x - pageWidth / 2) / pageWidth) + 1;
    }
    else
    {
        newPage = velocity.x > 0 ? _currentPage + 1 : _currentPage - 1;
        
        if (newPage < 0)
            newPage = 0;
        if (newPage > self.scrollView.contentSize.width / pageWidth)
            newPage = ceil(self.scrollView.contentSize.width / pageWidth) - 1.0;
    }
    
    NSLog(@"Dragging - You will be on %i page (from page %i)", newPage, self.currentPage);
    
    *targetContentOffset = CGPointMake(newPage * pageWidth, targetContentOffset->y);
//    NSLog(@"1.) %f", targetContentOffset->x);
}

@end
