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


@property (nonatomic) UIScrollView *containerScrollView;

@property (nonatomic) UISegmentedControl* segmentedControl;

// Array of view controllers to switch between
@property (nonatomic, copy) NSMutableArray *allViewControllers;

// Currently selected view controller
@property (nonatomic, strong) UIViewController *currentViewController;

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [super viewDidLoad];
    
    
//    self.pageController.
//    [self setUpScrollView];
//    [self setUpViewElements];
//    
    [self setupViewControllers];
//    [self setUpSwipeGesture];
 
}

- (void) setUpScrollView {
    
}

- (void) setupViewControllers {
    
    //standard UIScrollView is added
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    [self.view addSubview:scrollView];
    
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(320*2, 460); //this must be the appropriate size!
    
    //required to keep your view controllers around
    self.allViewControllers = [[NSMutableArray alloc] initWithCapacity:0];
    
    //just adding two controllers
    ChatTableViewController *one = [[ChatTableViewController alloc] initWithPosition:0 text:@"one"];
    
    [scrollView addSubview:one.view];
    [self.allViewControllers addObject:one];
    
    DesignViewController *two = [[DesignViewController alloc] initWithPosition:1 text:@"two"];
    [scrollView addSubview:two.view];
    [self.allViewControllers addObject:two];
    
    
//    ShopTableViewController *vcC = [[ShopTableViewController alloc] init];
    
    
//    [self.scrollView setBackgroundColor:[UIColor redColor]];
//    [self.view addSubview:view1];
//    [self.view addSubview:view2];
//    [self.view addSubview:view3];

//    [self cycleFromViewController:self.currentViewController toViewController:[self.allViewControllers objectAtIndex:self.segmentedControl.selectedSegmentIndex]];
    
}

- (void) addSegmentedControl {
    
    NSArray *itemArray = [NSArray arrayWithObjects: @"Chat", @"Design", @"Shop", nil];
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    self.segmentedControl.frame = CGRectMake(60, 80, 250, 50);
    
    [self.segmentedControl addTarget:self action:@selector(MySegmentControlAction:) forControlEvents: UIControlEventValueChanged];
    self.segmentedControl.selectedSegmentIndex = 0;
    
//    UIView *viewForSegmentedControl = [[UIView alloc] initWithFrame:CGRectMake(60, 80, 250, 50)];
//    viewForSegmentedControl addSubview:<#(nonnull UIView *)#>
    
//    [self.view addSubview:self.segmentedControl];
}




@end

