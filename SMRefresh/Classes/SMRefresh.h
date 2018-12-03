//
//  QKRefresh.h
//  QKFresh
//
//  Created by xiwang wang on 2018/11/30.
//  Copyright © 2018 com.simon. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SMRefreshType) {
    SMRefreshDropBoth = 0,  // 同时支持上、下拉
    SMRefreshDropDwon ,     // 只支持下拉
    SMRefreshUpDrop,    // 只支持下来
};

typedef void(^QKRefreshAction) (void);

NS_ASSUME_NONNULL_BEGIN

@interface SMRefresh : NSObject

/**
 第一次进入的时候是否刷新 默认为NO
 */
@property (nonatomic, assign) BOOL firstInRefresh;

/**
 没有数据footer显示
 */
@property (nonatomic, copy) NSString *noMoreDataTitle;

/**
 空转显示动画图片
 */
@property (nonatomic, strong) NSArray *idleImages;

/**
 下拉显示动画图片
 */
@property (nonatomic, strong) NSArray *pullingImages;

/**
 刷新显示动画图片
 */
@property (nonatomic, strong) NSArray *refreshImages;

- (void)nomalRefresh:(UITableView *)tableView refreshType:(SMRefreshType)refreshType dropDownBlock:(QKRefreshAction)dropDownBlock dropUpBlock:(QKRefreshAction)dropUpBlock;

// gifRefresh
- (void)gifRefresh:(UITableView *)tableView refreshType:(SMRefreshType)refreshType dropDownBlock:(QKRefreshAction)dropDownBlock dropUpBlock:(QKRefreshAction)dropUpBlock;

@end

NS_ASSUME_NONNULL_END
