//
//  FLListEntity.m
//  FlowLayoutCell
//
//  Created by Phil on 15/4/9.
//  Copyright (c) 2015年 Phil. All rights reserved.
//

#import "FLListEntity.h"

@implementation FLListEntity

+ (instancetype)entityWithTitle:(NSString *)title content:(NSString *)content images:(NSArray *)images andAudio:(BOOL)hasAudio
{
    FLListEntity *entity = [[self alloc] init];

    entity.title = title;
    entity.content = content;
    entity.hasAudioClip = hasAudio;
    if (images.count > 0) {
        entity.images = images;
    }

    return entity;
}

- (BOOL)hasImages
{
    return self.images.count > 0;
}

- (BOOL)hasContent
{
    return self.content.length > 0;
}

@end
