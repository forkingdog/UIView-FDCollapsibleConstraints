//
//  FDListEntity.m
//  FlowLayoutCell
//
//  Created by Phil on 15/4/9.
//  Copyright (c) 2015年 Phil. All rights reserved.
//

#import "FDListEntity.h"

@implementation FDListEntity

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = super.init;
    if (self) {
        self.title = dictionary[@"title"];
        self.content = dictionary[@"content"];
        self.imageName = dictionary[@"imageName"];
        self.hasAudioClip = [dictionary[@"audio"] boolValue];
    }
    return self;
}

@end
