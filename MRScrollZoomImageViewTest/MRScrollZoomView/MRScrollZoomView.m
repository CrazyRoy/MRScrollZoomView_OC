//
//  MRScrollZoomView.m
//  MRScrollZoomImageViewTest
//
//  Created by Mr.洛洛 on 2016/12/20.
//  Copyright © 2016年 coderLL. All rights reserved.
//

#import "MRScrollZoomView.h"

@implementation MRScrollZoomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setDefaultData];
        [self setupUI];
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self setDefaultData];
    [self setupUI];
}

/**
 设置默认数据
 */
- (void)setDefaultData {
    _imageTopMargin = 0.f;
    _maxScale = 1.f;
    _minScale = 1.f;
    _scaleRate = 3.f;
}

/**
 初始化UI
 */
- (void)setupUI {
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.frame = CGRectMake(self.frame.origin.x, _imageTopMargin, self.frame.size.width, self.frame.size.height);
    imageV.layer.cornerRadius = self.frame.size.width/2;
    imageV.layer.masksToBounds = YES;
    imageV.userInteractionEnabled = YES;
    [self addSubview:imageV];
    _imageView = imageV;
    
    // 创建并添加点击手势
    UITapGestureRecognizer *panGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewClick:)];
    [_imageView addGestureRecognizer:panGes];
}


/**
 根据偏移量计算缩放比例

 @param scrollView 滚动视图
 */
- (void)zoomWithScrollView:(UIScrollView *)scrollView {
    // 获取偏移量
    CGFloat offsetY = scrollView.contentOffset.y + scrollView.contentInset.top;
    // 缩放比例
    CGFloat scale = 1.0;
    // 变化基数
    CGFloat changeHeight = _scaleRate * self.frame.size.height;
    if(offsetY > 0) {   // 偏移量为正, 上拉缩小
        scale = MAX(_minScale, 1-offsetY/changeHeight);
    }else {  // 偏移量为负, 下拉放大
        scale = MIN(_maxScale, 1-offsetY/changeHeight);
    }
    // 形变变化
    _imageView.transform = CGAffineTransformMakeScale(scale, scale);
    // 固定顶部坐标, 保持不变
    CGRect frame = _imageView.frame;
    frame.origin.y = _imageTopMargin;
    _imageView.frame = frame;
}


/**
 点击事件处理
 */
- (void)imageViewClick:(UIImageView *)imageView {
    if([self.delegate respondsToSelector:@selector(zoomViewDidClick:)]) {
        [self.delegate zoomViewDidClick:self];
    }
}

@end
