//
//  FLTableViewCell.h
//  FlowLayoutCell
//
//  Created by Phil on 15/4/9.
//  Copyright (c) 2015年 Phil. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  FLListEntity;

@interface FLTableViewCell : UITableViewCell

@property (nonatomic, strong) FLListEntity *entity;

@end
