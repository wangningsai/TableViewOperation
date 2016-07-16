//
//  WNFriendGroupModel.m
//  TabViewOperation
//
//  Created by ym on 16/7/16.
//  Copyright © 2016年 王宁. All rights reserved.
//

#import "WNFriendGroupModel.h"
#import "WNFriendModel.h"
@implementation WNFriendGroupModel
- (instancetype)initWithNSDictionary:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

+ (instancetype)wnFriendGroupModelWithNSDictionary:(NSDictionary *)dic {
    
    return [[self alloc] initWithNSDictionary:dic];
}

+ (NSArray *)WNFriendGroupList {

    NSString *paths =  [[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil];
    
    NSArray *array = [NSArray arrayWithContentsOfFile:paths];
    NSLog(@"%ld",array.count);
    NSMutableArray *Marray = [NSMutableArray arrayWithCapacity:array.count];
    NSLog(@"%@",Marray);
    for (NSDictionary *tempDic in array) {
        WNFriendGroupModel *groupModel = [WNFriendGroupModel wnFriendGroupModelWithNSDictionary:tempDic];
        NSMutableArray *friendListArray = [NSMutableArray array];
        for (NSDictionary *friendListDic in groupModel.friends) {
            WNFriendModel *Friendmodel = [WNFriendModel wnFriendModelWithNSDictionart:friendListDic];
            [friendListArray addObject:Friendmodel];
        }
        groupModel.friends = friendListArray;
        [Marray addObject:groupModel];
    }

    return Marray;
    
}

@end
