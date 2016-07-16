//
//  WNFriendGroupHeaderView.h
//  TabViewOperation
//
//  Created by ym on 16/7/16.
//  Copyright © 2016年 王宁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WNFriendGroupModel.h"

@class WNFriendGroupHeaderView;

// 定义一个 协议
@protocol WNFriendGroupHeaderViewDelegate <NSObject>

- (void)WNHeaderViewDidClickBtn:(WNFriendGroupHeaderView *)headerView;

@end

@interface WNFriendGroupHeaderView : UITableViewHeaderFooterView
//代理属性
@property (nonatomic, assign) id<WNFriendGroupHeaderViewDelegate>delegate;

@property (nonatomic, strong) WNFriendGroupModel *groupModel;

+ (instancetype)wnFriendHeaderViewWithTableView:(UITableView *)tableView;

@end
