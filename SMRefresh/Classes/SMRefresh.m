//
//  QKRefresh.m
//  QKFresh
//
//  Created by xiwang wang on 2018/11/30.
//  Copyright © 2018 com.simon. All rights reserved.
//

#import "SMRefresh.h"
#import <MJRefresh/MJRefresh.h>
@interface SMRefresh () {
    
}
// 下拉触发的block
@property (nonatomic, copy) QKRefreshAction DropDownRefreshBlock;
// 上拉触发的block
@property (nonatomic, copy) QKRefreshAction UpDropRefreshBlock;
// Tableview
@property (nonatomic, strong) UITableView *parameterTableView;

@end

@implementation SMRefresh

- (instancetype)init {
    if (self = [super init]) {
        // 初始化图片数组
        _idleImages = [NSArray arrayWithObjects:@"", nil];
        _pullingImages = [NSArray arrayWithObjects:@"", nil];
        _refreshImages = [NSArray arrayWithObjects:@"", nil];
        
    }
    return self;
}

- (void)nomalRefresh:(UITableView *)tableView refreshType:(SMRefreshType)refreshType dropDownBlock:(QKRefreshAction)dropDownBlock dropUpBlock:(QKRefreshAction)dropUpBlock {
    _parameterTableView = tableView;
    _DropDownRefreshBlock = dropDownBlock;
    _UpDropRefreshBlock = dropUpBlock;
    
    switch (refreshType) {
        case SMRefreshDropDwon:{
            [self setNomalFreshHeaderView];
        }
            break;
        case SMRefreshUpDrop: {
            [self setNomalFreshFooterView];
        }
            break;
        case SMRefreshDropBoth: {
            [self setNomalFreshHeaderView];
            [self setNomalFreshFooterView];
        }
        default:
            break;
    }
}

- (void)gifRefresh:(UITableView *)tableView refreshType:(SMRefreshType)refreshType dropDownBlock:(QKRefreshAction)dropDownBlock dropUpBlock:(QKRefreshAction)dropUpBlock {
    _parameterTableView = tableView;
    _DropDownRefreshBlock = dropDownBlock;
    _UpDropRefreshBlock = dropUpBlock;
    
    switch (refreshType) {
        case SMRefreshDropDwon:{
            [self setGifFreshHeaderView];
        }
            break;
        case SMRefreshUpDrop: {
            [self setGifFreshFooterView];
        }
            break;
        case SMRefreshDropBoth: {
            [self setGifFreshHeaderView];
            [self setGifFreshFooterView];
        }
        default:
            break;
    }
}

- (void)setNomalFreshHeaderView {
    _parameterTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dropDownBlockAction)];
    if (_firstInRefresh) {
        [_parameterTableView.mj_header beginRefreshing];
    }
}

- (void)setNomalFreshFooterView {
    _parameterTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upDropBlockAction)];
    [(MJRefreshAutoNormalFooter *)_parameterTableView.mj_footer setTitle:_noMoreDataTitle?_noMoreDataTitle: @"哥,这下真没了!" forState:MJRefreshStateNoMoreData];
}

- (void)setGifFreshHeaderView {
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(dropDownBlockAction)];
    [header setImages:_idleImages forState:MJRefreshStateIdle];
    [header setImages:_pullingImages forState:MJRefreshStatePulling];
    [header setImages:_refreshImages forState:MJRefreshStateRefreshing];
    _parameterTableView.mj_header = header;
    if (_firstInRefresh) {
        [_parameterTableView.mj_header beginRefreshing];
    }
}

- (void)setGifFreshFooterView {
    _parameterTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upDropBlockAction)];
    [(MJRefreshAutoNormalFooter *)_parameterTableView.mj_footer setTitle:_noMoreDataTitle?_noMoreDataTitle: @"哥,这下真没了!" forState:MJRefreshStateNoMoreData];
}


- (void)dropDownBlockAction {
    if (_DropDownRefreshBlock) {
        _DropDownRefreshBlock();
        [_parameterTableView.mj_footer resetNoMoreData];
    }
}

- (void)upDropBlockAction {
    if (_UpDropRefreshBlock) {
        _UpDropRefreshBlock();
    }
}

@end
