//
//  Room.m
//  HomeePractice2
//
//  Created by Jake Choi on 2/1/16.
//  Copyright © 2016 solechang. All rights reserved.
//

#import "Room.h"

@implementation Room

- (id) initWithRoomDescription: (NSString*)roomName :(NSString*)subTitle :(NSString*)chatText {
    
    if (self = [super init]) {
        
        self.roomImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 60, 60)];
        
        self.roomName = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 100, 20)];
        self.subtitle = [[UILabel alloc] initWithFrame:CGRectMake(100, 30, 100, 20)];
        self.chatText = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 100, 20)];
        
        self.roomName.text = roomName;
        self.subtitle.text = subTitle;
        self.chatText.text = chatText;
        
        [self.roomImage setImage: [UIImage imageNamed: @"defaultIcon.png"]];
    }
    return self;
    
}

@end
