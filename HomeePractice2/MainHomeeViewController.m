 //
//  MainHomeeViewController.m
//  HomeePractice2
//
//  Created by Jake Choi on 2/1/16.
//  Copyright © 2016 solechang. All rights reserved.
//

#import "MainHomeeViewController.h"
#import "Room.h"
#import "ContainerViewController.h"

@interface MainHomeeViewController () 
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
    
    Room *room = [[Room alloc] initWithRoomDescription:@"2Pac" :@"Thug Life" :@"Ambitionz az a Ridah" ];
    
    for (int i = 0; i < 5; i++) {
        
        [self.roomsArray addObject:room];
    }

}

- (void) initializeViewElements {
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void) setUpScrollView {
    
    //standard UIScrollView is added
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    self.scrollView.delegate = self;
    self.scrollView.bounces = NO;
    self.scrollView.pagingEnabled = NO;
    self.scrollView.decelerationRate = UIScrollViewDecelerationRateFast;
    
    [self setRoomViews];
    
}

- (void) setRoomViews {
    
    float startingXPoint = 60.0f;
    float lastSpacing = 60.0f;
    float spacingBetweenViews = 10.0f;
    float widthOfRoomView = (self.view.bounds.size.width/1.50f);
    
    
    self.scrollView.contentSize = CGSizeMake(startingXPoint + self.roomsArray.count*spacingBetweenViews +
                                             self.roomsArray.count * (widthOfRoomView) + lastSpacing,
                                             self.scrollView.bounds.size.height); //this must be the appropriate size!
    
    for (int i = 0; i < self.roomsArray.count; i++) {
        
        Room *room = [self.roomsArray objectAtIndex:i];
        
        UIView *roomView = [[UIView alloc] initWithFrame:
                            CGRectMake(startingXPoint + spacingBetweenViews*i + i*(widthOfRoomView),
                                       125, widthOfRoomView, self.view.bounds.size.height*.5)];
        
        // Labels room description
        UILabel *labelRoomName = [[UILabel alloc] initWithFrame:
                                  CGRectMake(20, 220, 150, 20)];
        UILabel *labelsubTitle = [[UILabel alloc] initWithFrame:
                                  CGRectMake(20, 240, 150, 20)];
        UILabel *labelchatText = [[UILabel alloc] initWithFrame:
                                  CGRectMake(20, 260, 180, 20)];
        
        labelRoomName.text = room.roomName.text;
        labelsubTitle.text = room.subtitle.text;
        labelchatText.text = room.chatText.text;
        
        [roomView addSubview:labelRoomName];
        [roomView addSubview:labelsubTitle];
        [roomView addSubview:labelchatText];
        
        // Room Image
        UIImageView *roomImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, widthOfRoomView, 200)];
        
        roomImage.image = room.roomImage.image;
        [roomView addSubview:roomImage];
        
        [self addGestureRecogniser:roomView];
        [roomView setBackgroundColor:[UIColor blueColor]];
        
        [self.scrollView addSubview:roomView];
        
    }
    
    [self.view addSubview:self.scrollView];
    
}
-(void)addGestureRecogniser:(UIView *)touchView{
    
    UITapGestureRecognizer *singleTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showRoom:)];
    [touchView addGestureRecognizer:singleTap];
    

}
-(void)showRoom: (UIView *) touchView{
    
    // Check which view is clicked so that we can approriately display the correct content
    ContainerViewController *containerTVC = [[ContainerViewController alloc] init];
    [self.navigationController pushViewController:containerTVC animated:YES];
    
}

#pragma mark - scrollView Delegate
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

    } else {
        
        // The velocity calculates if the user is swiping left or right
        // Positive number = swiping right
        // Negative number = swiping left

        newPage = velocity.x > 0 ? _currentPage + 1 : _currentPage - 1;
        
        if (newPage < 0)
            newPage = 0; // For first view
        if (newPage > self.scrollView.contentSize.width / pageWidth)
            newPage = ceil(self.scrollView.contentSize.width / pageWidth) - 1.0; // For last View
    }

    // After velocity calculation, the targetContentOffset is where the scrollView should land
    *targetContentOffset = CGPointMake(newPage * pageWidth, targetContentOffset->y);

}

@end
