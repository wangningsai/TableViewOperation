//
//  WNFriendGroupModel.h
//  TabViewOperation
//
//  Created by ym on 16/7/16.
//  Copyright © 2016年 王宁. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  好友列表分组 模型
 */
@interface WNFriendGroupModel : NSObject


///分组名称
@property (nonatomic, copy) NSString *name;
///在线的人数
@property (nonatomic, assign) NSInteger online;

///好友列表数组
@property (nonatomic, strong) NSArray *friends;

///是否展开 默认NO

@property (nonatomic, assign, getter=isExpend) BOOL expend;

- (instancetype)initWithNSDictionary:(NSDictionary *)dic;

+ (instancetype)wnFriendGroupModelWithNSDictionary:(NSDictionary *)dic;

+ (NSArray *)WNFriendGroupList;

@end
