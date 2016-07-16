//
//  WNFriendModel.h
//  TabViewOperation
//
//  Created by ym on 16/7/16.
//  Copyright © 2016年 王宁. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  好友列表 模型
 */

@interface WNFriendModel : NSObject
/**
 *  头像
 */

@property (nonatomic, copy) NSString *icon;
///个性签名
@property (nonatomic, copy) NSString *intro;
///好友名称
@property (nonatomic, copy) NSString *name;
///是不是会员
@property (nonatomic, assign, getter=isVip) BOOL vip;

- (instancetype)initWithNSDictionary:(NSDictionary *)dic;

+ (instancetype)wnFriendModelWithNSDictionart:(NSDictionary *)dic;

@end
