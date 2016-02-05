//
//  RoomScrollView.m
//  HomeePractice2
//
//  Created by Jake Choi on 2/5/16.
//  Copyright © 2016 solechang. All rights reserved.
//

#import "RoomScrollView.h"

@implementation RoomScrollView

- (id)initWithFrame:(CGRect)frame
{
    return [super initWithFrame:frame];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"1.)");
    // If not dragging, send event to next responder
    if (!self.dragging){
         NSLog(@"2.)");
        [self.nextResponder touchesMoved: touches withEvent:event];
    }
    else{
         NSLog(@"3.)");
        [super touchesMoved: touches withEvent: event];
    }
}


@end
