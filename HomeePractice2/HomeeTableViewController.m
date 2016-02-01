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

@interface HomeeTableViewController ()

@end

@implementation HomeeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeTableView];

}

- (void) initializeTableView {
    // because of the registered a RoomCell class (can also instantiate a nib), the cell will
    // never return a nil
    [self.tableView registerClass:[RoomCell class] forCellReuseIdentifier:@"RoomCell"];
    
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


@end
