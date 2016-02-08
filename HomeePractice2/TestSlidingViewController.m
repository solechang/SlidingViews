//
//  TestSlidingViewController.m
//  HomeePractice2
//
//  Created by Chang Choi on 2/8/16.
//  Copyright © 2016 solechang. All rights reserved.
//

#import "TestSlidingViewController.h"
#import "SlidingViews.h"
#import "ChatTableViewController.h"
#import "ShopTableViewController.h"
#import "DesignViewController.h"

@interface TestSlidingViewController ()
@property (nonatomic, retain) ChatTableViewController *chatTVC;
@property (nonatomic, retain) DesignViewController *designVC;
@property (nonatomic, retain) ShopTableViewController *shopTVC;

@end

@implementation TestSlidingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpView];
    
    SlidingViews *sliding = [[SlidingViews alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    self.chatTVC = [[ChatTableViewController alloc] init];
    self.shopTVC = [[ShopTableViewController alloc] init];
    self.designVC = [[DesignViewController alloc] init];
    [sliding addViewControllersToScrollView:self.chatTVC :self.designVC :self.shopTVC];
    
    // Users can change the section names
    sliding.label2.text = @"THugLYfe";
    
    [self.view addSubview:sliding];
    
}

- (void) setUpView {
//    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
