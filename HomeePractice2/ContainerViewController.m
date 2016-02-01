//
//  ContainerViewController.m
//  HomeePractice2
//
//  Created by Jake Choi on 1/29/16.
//  Copyright © 2016 solechang. All rights reserved.
//

#import "ContainerViewController.h"
#import "ChatTableViewController.h"
#import "ShopTableViewController.h"
#import "DesignViewController.h"

@interface ContainerViewController ()

@property NSUInteger pageIndex;

@property (nonatomic, retain) ChatTableViewController *chatTVC;
@property (nonatomic, retain) DesignViewController *designVC;
@property (nonatomic, retain) ShopTableViewController *shopTVC;

@property (nonatomic) UISegmentedControl* segmentedControl;

@property (nonatomic) UIScrollView *scrollView;

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setUpView];
    [self setUpScrollView];
    [self setupViewControllers];
    [self addSegmentedControl];
 
}

- (void) setUpView {
    [self.view setBackgroundColor:[UIColor whiteColor]];

}

- (void) setUpScrollView {
    
    //standard UIScrollView is added
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 120, self.view.bounds.size.width, self.view.bounds.size.height-120)];
    
    self.scrollView.delegate = self;
    
    self.scrollView.bounces = NO;
    self.scrollView.pagingEnabled = YES;
    
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*3, self.scrollView.bounds.size.height); //this must be the appropriate size!
    

    [self.view addSubview:self.scrollView];
   
}

- (void) setupViewControllers {
    
    //just adding 3 controllers
    self.chatTVC = [[ChatTableViewController alloc] initWithPosition:0];
    [self.scrollView addSubview:self.chatTVC.view];
    
    self.designVC = [[DesignViewController alloc] initWithPosition:1];
    [self.scrollView addSubview:self.designVC.view];
    
    self.shopTVC = [[ShopTableViewController alloc] initWithPosition:2];
    [self.scrollView addSubview:self.shopTVC.view];


}

- (void) addSegmentedControl {
    
    NSArray *itemArray = [NSArray arrayWithObjects: @"Chat", @"Design", @"Shop", nil];
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    self.segmentedControl.frame = CGRectMake(0, 65, self.view.bounds.size.width, 50);
    
    [self.segmentedControl addTarget:self action:@selector(MySegmentControlAction:) forControlEvents: UIControlEventValueChanged];
    self.segmentedControl.selectedSegmentIndex = 0;
    
    [self.view addSubview:self.segmentedControl];
}

- (void)MySegmentControlAction:(UISegmentedControl *)segment
{
    
    NSUInteger index = segment.selectedSegmentIndex;
 
    if (index == 0) {
        [self.scrollView setContentOffset:CGPointMake(self.view.bounds.size.width*0, 0) animated:YES];
    } else if (index == 1) {
        
        [self.scrollView setContentOffset:CGPointMake(self.view.bounds.size.width*1, 0) animated:YES];
        
    } else if (index == 2) {
        
        [self.scrollView setContentOffset:CGPointMake(self.view.bounds.size.width*2, 0) animated:YES];
    }
  
}

#pragma mark - scrollView Delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    if ( scrollView.contentOffset.x == 0 ){
        
        self.segmentedControl.selectedSegmentIndex = 0;
        
    } else if ( scrollView.contentOffset.x == self.view.bounds.size.width*1 ){
        
        self.segmentedControl.selectedSegmentIndex = 1;
        
    } else if ( scrollView.contentOffset.x == self.view.bounds.size.width*2 ){
        
        self.segmentedControl.selectedSegmentIndex = 2;
        
    }
    
}


@end

