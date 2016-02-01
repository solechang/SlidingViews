//
//  HomeeTableViewController.m
//  HomeePractice2
//
//  Created by Jake Choi on 1/29/16.
//  Copyright © 2016 solechang. All rights reserved.
//

#import "HomeeTableViewController.h"
#import "RoomCell.h"
#import "ContainerViewController.h"
#import "ChatTableViewController.h"
#import "DesignViewController.h"
#import "ShopTableViewController.h"

@interface HomeeTableViewController () {
    NSMutableArray *controllers;
}

@end

@implementation HomeeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeTableView];

}

- (void) initializeTableView {
    
    [self.tableView registerClass:[RoomCell class] forCellReuseIdentifier:@"RoomCell"];
    
}

- (void) setupViewControllers {
    
    
    //standard UIScrollView is added
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:scrollView];
    
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*2, self.view.bounds.size.height); //this must be the appropriate size!
    
    //required to keep your view controllers around
    controllers = [[NSMutableArray alloc] initWithCapacity:0];
    
    //just adding two controllers
    ChatTableViewController *one = [[ChatTableViewController alloc] initWithPosition:0];
    
    [scrollView addSubview:one.view];
    [controllers addObject:one];
    
    DesignViewController *two = [[DesignViewController alloc] initWithPosition:1 ];
    [scrollView addSubview:two.view];
    [controllers addObject:two];
    
    
    //    ShopTableViewController *vcC = [[ShopTableViewController alloc] init];
    
    
    //    [self.scrollView setBackgroundColor:[UIColor redColor]];
    //    [self.view addSubview:view1];
    //    [self.view addSubview:view2];
    //    [self.view addSubview:view3];
    
    //    [self cycleFromViewController:self.currentViewController toViewController:[self.allViewControllers objectAtIndex:self.segmentedControl.selectedSegmentIndex]];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RoomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RoomCell" forIndexPath:indexPath];
    cell.roomName.text = @"Hi";
    cell.subtitle.text = @"Hi";
    cell.chatText.text = @"Hello";

    [cell.roomImage setImage: [UIImage imageNamed: @"defaultIcon.png"]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ContainerViewController *chatTVC = [[ContainerViewController alloc] init];
    [self.navigationController pushViewController:chatTVC animated:YES];
    
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
