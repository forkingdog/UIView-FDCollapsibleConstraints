//
//  FDTableViewCell.m
//  FlowLayoutCell
//
//  Created by Phil on 15/4/9.
//  Copyright (c) 2015年 Phil. All rights reserved.
//

#import "FDTableViewCell.h"
#import "FDListEntity.h"
#import "UIView+FDCollapsibleConstraints.h"

@interface FDTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel     *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel     *contentLabel;
@property (weak, nonatomic) IBOutlet UIView      *audioBubble;
@property (weak, nonatomic) IBOutlet UIImageView *thumbImageView;

@end

@implementation FDTableViewCell

- (void)setEntity:(FDListEntity *)entity
{
    _entity = entity;

    self.titleLabel.text = entity.title;
    self.contentLabel.text = entity.content;
    if (entity.imageName.length) {
        self.thumbImageView.image = [UIImage imageNamed:entity.imageName];
    } else {
        self.thumbImageView.image = nil;
    }
    self.audioBubble.fd_collapsed = !entity.hasAudioClip;
}

@end
