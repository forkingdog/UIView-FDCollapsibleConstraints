//
//  FDListEntity.h
//  FlowLayoutCell
//
//  Created by Phil on 15/4/9.
//  Copyright (c) 2015年 Phil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FDListEntity : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, assign) BOOL hasAudioClip;

@end
