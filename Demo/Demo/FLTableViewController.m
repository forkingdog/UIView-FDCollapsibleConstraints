//
//  FLTableViewController.m
//  FlowLayoutCell
//
//  Created by Phil on 15/4/9.
//  Copyright (c) 2015年 Phil. All rights reserved.
//

#import "FLTableViewController.h"
#import "FLTableViewCell.h"
#import "FLListEntity.h"

@interface FLTableViewController ()

@property NSArray *entities;

@end

@implementation FLTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

    [self seed];
}

- (void)seed
{
    self.entities = @[
        [FLListEntity entityWithTitle:@"Only text"
                              content:@"content"
                               images:@[]
                             andAudio:NO],
        [FLListEntity entityWithTitle:@"Only audio"
                              content:@""
                               images:@[]
                             andAudio:YES],
        [FLListEntity entityWithTitle:@"Text + image"
                              content:@"content"
                               images:@[@"image1"]
                             andAudio:NO],
        [FLListEntity entityWithTitle:@"Audio + images"
                              content:@""
                               images:@[@"image1"]
                             andAudio:YES],
        [FLListEntity entityWithTitle:@"Text + Audio + images"
                              content:@"content"
                               images:@[@"image1"]
                             andAudio:YES],
        [FLListEntity entityWithTitle:@"Text + Audio + images"
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
        return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FLEmptyCell"];
    }

    NSString *identifier = NSStringFromClass([FLTableViewCell class]);
    FLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.entity = self.entities[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row >= self.entities.count) {
        return 0;
    }

    NSString *identifier = NSStringFromClass([FLTableViewCell class]);
    CGFloat height = [self zd_cellHeightWithReuseIdentifier:identifier configuration:^(FLTableViewCell *cell) {
        cell.entity = self.entities[indexPath.row];
    }];
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathsForSelectedRows][0] animated:YES];
}

#pragma mark - Auto Layout Cell

- (CGFloat)zd_cellHeightWithReuseIdentifier:(NSString *)identifier configuration:(void (^)(id))configuration
{
    static UITableViewCell *layoutCell;
    if (!layoutCell) {
        layoutCell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
    }

    !configuration ?: configuration(layoutCell);

    const CGFloat width = CGRectGetWidth(self.tableView.frame);
    UIView *contentView = layoutCell.contentView;
    id widthConstraint = [NSLayoutConstraint constraintWithItem:contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:width];

    // add fixed width constraint to wrap labels
    [contentView addConstraint:widthConstraint];
    
    CGSize size = [layoutCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    [contentView removeConstraint:widthConstraint];
    
    if (self.tableView.separatorStyle != UITableViewCellSeparatorStyleNone) {
        size.height += 0.5;
    }
    return size.height;
}

@end
