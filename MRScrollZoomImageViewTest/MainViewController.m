//
//  MainViewController.m
//  MRScrollZoomImageViewTest
//
//  Created by Mr.洛洛 on 2016/12/20.
//  Copyright © 2016年 coderLL. All rights reserved.
//

#import "MainViewController.h"
#import "MRScrollZoomView.h"

@interface MainViewController ()<MRScrollZoomViewDelegate> {
    MRScrollZoomView *_zoomView, *_zoomView1;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
    
    MRScrollZoomView *zoomView = [[MRScrollZoomView alloc] init];
    zoomView.frame = CGRectMake(0, 0, 70, 70);
    zoomView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, 30);
    zoomView.minScale = 0.5;
    zoomView.maxScale = 1.35;
    zoomView.imageTopMargin = 10;
    zoomView.scaleRate = 3.0;
    zoomView.delegate = self;
    zoomView.imageView.image = [UIImage imageNamed:@"headIcon"];
    [self.navigationController.navigationBar addSubview:zoomView];
    _zoomView = zoomView;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 24;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"MRScrollZoomViewCell -- %zd", indexPath.row];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [_zoomView zoomWithScrollView:scrollView];
    [_zoomView1 zoomWithScrollView:scrollView];
}

#pragma mark - MRScrollZoomViewDelegate
- (void)zoomViewDidClick:(MRScrollZoomView *)zoomView {
    NSLog(@"点击图片");
}

@end
