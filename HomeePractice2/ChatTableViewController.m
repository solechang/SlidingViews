//
//  ChatTableViewController.m
//  HomeePractice2
//
//  Created by Chang Choi on 1/29/16.
//  Copyright © 2016 solechang. All rights reserved.
//

#import "ChatTableViewController.h"

@interface ChatTableViewController ()

@property (nonatomic) NSInteger myPosition;

@end

@implementation ChatTableViewController

- (id)initWithPosition:(NSInteger)position {
    if (self = [super init]) {
        self.myPosition = position;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeTableView];

}

- (void) initializeTableView {

    UITableView *tV = [[UITableView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width * 0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 100)];
    
    self.tableView = tV;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

   return 30;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {\
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = @"LOL";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
