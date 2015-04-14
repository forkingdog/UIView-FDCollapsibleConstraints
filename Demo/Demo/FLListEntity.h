//
//  FLListEntity.h
//  FlowLayoutCell
//
//  Created by Phil on 15/4/9.
//  Copyright (c) 2015年 Phil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FLListEntity : NSObject

@property (nonatomic, copy)  NSString *title;
@property (nonatomic, copy)  NSString *content;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, assign) BOOL     hasAudioClip;

+ (instancetype)entityWithTitle:(NSString *)title content:(NSString *)content images:(NSArray *)images andAudio:(BOOL)hasAudio;

- (BOOL)hasImages;
- (BOOL)hasContent;

@end
