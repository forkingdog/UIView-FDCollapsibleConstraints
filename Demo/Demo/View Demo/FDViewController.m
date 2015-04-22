//
//  FDViewController.m
//  Demo
//
//  Created by sunnyxx on 15/4/22.
//  Copyright (c) 2015年 Phil. All rights reserved.
//

#import "FDViewController.h"
#import "UIView+FDCollapsibleConstraints.h"

@interface FDViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *logoImageView;
@property (nonatomic, assign) BOOL expanding;

@end

@implementation FDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Default value
    self.logoImageView.fd_collapsed = YES;
}

- (IBAction)expandButtonAction:(UIButton *)sender
{
    [sender setTitle:self.expanding ? @"Expand" : @"Collapse" forState:UIControlStateNormal];
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveLinear animations:^{
        self.logoImageView.fd_collapsed = self.expanding;
        [self.view layoutSubviews];
    } completion:^(BOOL finished) {
        self.expanding = !self.expanding;
    }];
}

@end
