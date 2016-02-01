//
//  ShopTableViewController.m
//  HomeePractice2
//
//  Created by Jake Choi on 1/29/16.
//  Copyright © 2016 solechang. All rights reserved.
//

#import "ShopTableViewController.h"

@interface ShopTableViewController ()
@property (nonatomic) NSInteger myPosition;
@end

@implementation ShopTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeTableView];
    
}

- (void) initializeTableView {
    
    UITableView *tV = [[UITableView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width*self.myPosition, 0, self.view.bounds.size.width, self.view.bounds.size.height-120)];
    
    self.tableView = tV;
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
}

- (id)initWithPosition:(NSInteger)position text:(NSString*)text
{
    if (self = [super init]) {
        self.myPosition = position;
        
    }
    return self;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 30;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = @"whaddup homee";
    
    return cell;
}


@end
