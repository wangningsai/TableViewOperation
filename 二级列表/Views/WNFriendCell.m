//
//  WNFriendCell.m
//  TabViewOperation
//
//  Created by ym on 16/7/16.
//  Copyright © 2016年 王宁. All rights reserved.
//

#import "WNFriendCell.h"

@implementation WNFriendCell

+ (instancetype)wnFriendCellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"cell";
    WNFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

-(void)setFriendModel:(WNFriendModel *)friendModel
 {
    
    _friendModel = friendModel;
    self.textLabel.text = friendModel.name;
    self.detailTextLabel.text = friendModel.intro;
    self.textLabel.textColor = friendModel.isVip ? [UIColor orangeColor] : [UIColor blackColor];
}
@end
