<h1>SlidingViews</h1>

What does SlidingViews do?

	Slide/scroll through 3 view different controllers with a button slider horizontally


<h3>Instructions for setting up and using SlidingViews: </h3>

Step 1.) Import
	
	#import SlidingViews.h

Step 2.) Create 3 properties of the view controllers that you are going to display

	For example:

		@property (nonatomic, retain) ViewController *vc1;
		@property (nonatomic, retain) ViewController *vc2;
		@property (nonatomic, retain) ViewController *vc3;

Step 2.) Set up the frame of the View Controllers that you want to scroll through by setting the X coordinates of each View Controllers accordingly
 
    **** NOTE!!!! ****
    - However, since the default of the scrollView height shorten by 100, account for the height of the View Controllers that the users are going to scroll through
 
    For Example: make sure that
        a.) The first view controller's view has a frame of CGRectMake(self.view.bounds.size.width * 0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 100)
        b.) the second view controller's view has a frame of CGRectMake(self.view.bounds.size.width * 1, 0, self.view.bounds.size.width, self.view.bounds.size.height - 100)
        c.) the third view controller's view has a frame of CGRectMake(self.view.bounds.size.width * 2, 0, self.view.bounds.size.width, self.view.bounds.size.height - 100)

Step 3.) addViewControllersToScrollView

Step 4.) addSubview SlidingViews to current view


Easy to use:
- From TestSlidingViewController.m's viewDidLoad will guide you on how to set up SlidingViews

	****** Example code*****

    	SlidingViews *sliding = [[SlidingViews alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    	self.chatTVC = [[ChatTableViewController alloc] init];
    	self.shopTVC = [[ShopTableViewController alloc] init];
    	self.designVC = [[DesignViewController alloc] init];
    	[sliding addViewControllersToScrollView:self.chatTVC :self.designVC :self.shopTVC];
    
    	// Users can change the section names
    	sliding.label2.text = @"THugLYfe";
    
    	[self.view addSubview:sliding];




