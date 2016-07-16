//
//  WNFriendCell.h
//  TabViewOperation
//
//  Created by ym on 16/7/16.
//  Copyright © 2016年 王宁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WNFriendModel.h"
@interface WNFriendCell : UITableViewCell
@property (nonatomic, strong) WNFriendModel *friendModel;

+ (instancetype)wnFriendCellWithTableView:(UITableView *)tableView;

@end
