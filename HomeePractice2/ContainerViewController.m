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

@interface ContainerViewController () <UIGestureRecognizerDelegate>

@property NSUInteger pageIndex;

@property (nonatomic, retain) ChatTableViewController *chatTVC;
@property (nonatomic, retain) DesignViewController *designVC;
@property (nonatomic, retain) ShopTableViewController *shopTVC;

@property (nonatomic) UISegmentedControl* segmentedControl;

@property (nonatomic) UISlider *slider;

@property (nonatomic) UIView *sliderView;

@property (nonatomic) UIScrollView *scrollView;

@property (nonatomic) UIView *slideButton;

@property (nonatomic) UILabel *chatLabel;
@property (nonatomic) UILabel *designLabel;
@property (nonatomic) UILabel *shopLabel;
@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    [self setUpView];
    [self setUpScrollView];
    [self setupViewControllers];
//    [self addSegmentedControl];
//    [self addSlider];
    [self createCustomSliderView];
 
}

- (void) setUpView {
    self.automaticallyAdjustsScrollViewInsets = NO;
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
    

    self.segmentedControl.selectedSegmentIndex = 0;
    
    [self.view addSubview:self.segmentedControl];
}



- (void) createCustomSliderView {
    
    self.sliderView = [[UIView alloc] initWithFrame:CGRectMake(0, 65, self.view.bounds.size.width, 50)];
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [tapRecognizer setNumberOfTapsRequired:1];
    [tapRecognizer setDelegate:self];
    [self.view addGestureRecognizer:tapRecognizer];
    
    self.slideButton = [[UIView alloc]  initWithFrame:CGRectMake(0, 10, 20, 20)];
    self.slideButton.tag = 2;
    [self.slideButton setBackgroundColor:[UIColor redColor]];
    
    self.chatLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 50, 20)];
    self.chatLabel.text = @"Chat";
    self.chatLabel.textColor = [UIColor colorWithRed: 180.0/255.0 green: 238.0/255.0 blue:180.0/255.0 alpha: 1.0];
    
    self.designLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 - 12, 30, 100, 20)];
    self.designLabel.text = @"Design";
    
    
    self.shopLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width- 40, 30, 100, 20)];
    self.shopLabel.text = @"Shop";

    [self.sliderView addSubview:self.chatLabel];
    [self.sliderView addSubview:self.designLabel];
    [self.sliderView addSubview:self.shopLabel];
    [self.sliderView addSubview: self.slideButton];
    
    [self.view addSubview:self.sliderView];

}

- (void) tapped:(id)sender {
    
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    
    if ([[touch view] tag] == 2) {

        CGPoint location = [touch locationInView:self.view];
        CGRect frame = self.slideButton.frame;
        frame.origin.x = location.x;
        self.slideButton.frame = frame;
        
        [self.scrollView setContentOffset:CGPointMake(2*location.x, 1)];



    }
}

-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [[event allTouches] anyObject];
    
    if ([[touch view] tag] == 2) {
        CGPoint location = [touch locationInView:self.view];
        CGRect frame = self.slideButton.frame;
    
        float sliderValue = location.x / self.view.bounds.size.width;
        if (sliderValue > .25 && sliderValue < .75) {
            
            // Design
            
            frame.origin.x = self.view.bounds.size.width/2.0f;
            self.slideButton.frame = frame;
            [self.scrollView setContentOffset:CGPointMake(self.view.bounds.size.width*1, 0) animated:YES];
            
        } else if (sliderValue > .50) {
            
            // Shop
            self.slideButton.frame = frame;
            frame.origin.x = self.view.bounds.size.width - 20;

            [self.scrollView setContentOffset:CGPointMake(self.view.bounds.size.width*2, 0) animated:YES];
            
        } else if (sliderValue < .25) {
            // Chat
            self.slideButton.frame = frame;
            frame.origin.x = 0.0f;
            [self.scrollView setContentOffset:CGPointMake(self.view.bounds.size.width*0, 0) animated:YES];
            
        }
          self.slideButton.frame = frame;

    }
}

- (void) changeTextColor {
    
}

//-(void)sliderStops:(id)sender
//{
//    UISlider *slider = (UISlider*)sender;
//    
//    if (slider.value > 25 && slider.value < 75) {
//        
//        [self.slider setValue:50];
//        [self.scrollView setContentOffset:CGPointMake(self.view.bounds.size.width*1, 0) animated:YES];
//        
//    } else if (slider.value > 50) {
//    
//        [self.slider setValue:100 animated:YES];
//        [self.scrollView setContentOffset:CGPointMake(self.view.bounds.size.width*2, 0) animated:YES];
//        
//    } else if (slider.value < 25) {
//        [self.slider setValue:0 animated:YES];
//        [self.scrollView setContentOffset:CGPointMake(self.view.bounds.size.width*0, 0) animated:YES];
//
//    }
//}
//
//-(void)sliderAction:(id)sender {
//    
//    [self.scrollView setContentOffset:CGPointMake(self.view.bounds.size.width*2*self.slider.value/100, 1)];
//
//}

#pragma mark - scrollView Delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
//    if ( scrollView.contentOffset.x == 0 ){
//        
//        self.segmentedControl.selectedSegmentIndex = 0;
//        [self.slider setValue:0];
//    } else if ( scrollView.contentOffset.x == self.view.bounds.size.width*1 ){
//        
//        [self.slider setValue:50];
//        self.segmentedControl.selectedSegmentIndex = 1;
//        
//    } else if ( scrollView.contentOffset.x == self.view.bounds.size.width*2 ){
//        [self.slider setValue:100];
//        self.segmentedControl.selectedSegmentIndex = 2;
//        
//    }
    
}


@end

