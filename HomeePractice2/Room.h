//
//  Room.h
//  HomeePractice2
//
//  Created by Chang Choi on 2/1/16.
//  Copyright © 2016 solechang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Room : NSObject

@property (nonatomic) UIImageView *roomImage;

@property (nonatomic) UILabel *roomName;
@property (nonatomic) UILabel *subtitle;
@property (nonatomic) UILabel *chatText;

- (id) initWithRoomDescription: (NSString*)roomName :(NSString*)subTitle :(NSString*)chatText;
@end
