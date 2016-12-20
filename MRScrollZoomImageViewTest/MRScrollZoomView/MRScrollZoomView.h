//
//  MRScrollZoomView.h
//  MRScrollZoomImageViewTest
//
//  Created by Mr.洛洛 on 2016/12/20.
//  Copyright © 2016年 coderLL. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MRScrollZoomView;

@protocol MRScrollZoomViewDelegate <NSObject>

@optional

- (void)zoomViewDidClick:(MRScrollZoomView *)zoomView;

@end

@interface MRScrollZoomView : UIView

// ================ 属性 =================
/**
 头像图片
 */
@property (nonatomic, weak) UIImageView *imageView;
/**
 最大缩放比例 --- 默认值1.0(保持初始比例)
 */
@property (nonatomic, assign) CGFloat maxScale;
/**
 最小缩放比例 --- 默认值1.0(保持初始比例)
 */
@property (nonatomic, assign) CGFloat minScale;
/**
 头像顶部固定间距 --- 默认值0
 */
@property (nonatomic, assign) CGFloat imageTopMargin;
/**
 变化速率 --- 默认为3.0(偏移量/高度*速率), 越小越快
 */
@property (nonatomic, assign) CGFloat scaleRate;
/**
 代理协议
 */
@property (nonatomic, weak) id<MRScrollZoomViewDelegate> delegate;

// ================ 方法 =================
/**
 调用该方法，根据偏移量计算缩放比例
 */
- (void)zoomWithScrollView:(UIScrollView *)scrollView;

@end
