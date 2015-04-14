//
//  FDTableViewController.m
//  FlowLayoutCell
//
//  Created by Phil on 15/4/9.
//  Copyright (c) 2015年 Phil. All rights reserved.
//

#import "FDTableViewController.h"
#import "FDTableViewCell.h"
#import "FDListEntity.h"

@interface FDTableViewController ()

@property NSArray *entities;

@end

@implementation FDTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

    [self seed];
}

- (void)seed
{
    self.entities = @[
        [FDListEntity entityWithTitle:@"Only text"
                              content:@"content"
                               images:@[]
                             andAudio:NO],
        [FDListEntity entityWithTitle:@"Only audio"
                              content:@""
                               images:@[]
                             andAudio:YES],
        [FDListEntity entityWithTitle:@"Text + image"
                              content:@"content"
                               images:@[@"image1"]
                             andAudio:NO],
        [FDListEntity entityWithTitle:@"Audio + images"
                              content:@""
                               images:@[@"image1"]
                             andAudio:YES],
        [FDListEntity entityWithTitle:@"Text + Audio + images"
                              content:@"content"
                               images:@[@"image1"]
                             andAudio:YES],
        [FDListEntity entityWithTitle:@"Text + Audio + images"
                              content:@"content content content content content content content content content content content content content content content content "
                               images:@[@"image1"]
                             andAudio:YES]
    ];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.entities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row >= self.entities.count) {
        return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FDEmptyCell"];
    }

    NSString *identifier = NSStringFromClass([FDTableViewCell class]);
    FDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.entity = self.entities[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row >= self.entities.count) {
        return 0;
    }

    NSString *identifier = NSStringFromClass([FDTableViewCell class]);
    CGFloat height = [self cellHeightWithReuseIdentifier:identifier configuration:^(FDTableViewCell *cell) {
        cell.entity = self.entities[indexPath.row];
    }];
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathsForSelectedRows][0] animated:YES];
}

#pragma mark - Auto Layout Cell

/// code pulled out from FDAutoLayoutCell.
- (CGFloat)cellHeightWithReuseIdentifier:(NSString *)identifier configuration:(void (^)(id))configuration
{
    static UITableViewCell *layoutCell;
    if (!layoutCell) {
        layoutCell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
    }

    !configuration ?: configuration(layoutCell);

    // add fixed width constraint to confine multiline labels
    const CGFloat width = CGRectGetWidth(self.tableView.frame);
    UIView *contentView = layoutCell.contentView;
    id widthConstraint = [NSLayoutConstraint constraintWithItem:contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];
    [contentView addConstraint:widthConstraint];

    // calculate size with auto layout using system's method
    CGSize size = [layoutCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    [contentView removeConstraint:widthConstraint];

    // fix for UITableViewCell selected state
    if (self.tableView.separatorStyle != UITableViewCellSeparatorStyleNone) {
        size.height += 0.5;
    }
    return size.height;
}

@end
