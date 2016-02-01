//
//  RoomCell.m
//  HomeePractice2
//
//  Created by Jake Choi on 1/29/16.
//  Copyright © 2016 solechang. All rights reserved.
//

#import "RoomCell.h"

@implementation RoomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.roomImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 60, 60)];
        
        self.roomName = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 100, 20)];
        
        self.subtitle = [[UILabel alloc] initWithFrame:CGRectMake(100, 30, 100, 20)];
        self.chatText = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 100, 20)];
        
        [self.contentView addSubview:self.roomImage];
        [self.contentView addSubview:self.roomName];
        [self.contentView addSubview:self.subtitle];
        [self.contentView addSubview:self.chatText];
        
    }
    return self;
}


@end
