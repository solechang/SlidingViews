//
//  NewViewController.m
//  HomeePractice2
//
//  Created by Jake Choi on 2/1/16.
//  Copyright © 2016 solechang. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController ()

@property (nonatomic, strong) UIView *test;

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.test = [[UIView alloc]init];
    self.test.frame = CGRectMake(0, 100, 100, 100);
    [self.view addSubview:self.test];
    self.test.backgroundColor = [UIColor greenColor];
    self.test.tag = 5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:self.view];

    NSLog(@"%@", touch.view);
    
    if ([[touch view] tag] == 5) {
        
        CGRect frame = self.test.frame;
        frame.origin.x = location.x;
        frame.origin.y = location.y;
        self.test.frame = frame;
       

    }

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
