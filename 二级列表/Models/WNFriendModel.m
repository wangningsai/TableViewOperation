//
//  WNFriendModel.m
//  TabViewOperation
//
//  Created by ym on 16/7/16.
//  Copyright © 2016年 王宁. All rights reserved.
//

#import "WNFriendModel.h"

@implementation WNFriendModel
- (instancetype)initWithNSDictionary:(NSDictionary *)dic {
    
    self = [super init];
    if (self) {
        
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

+ (instancetype)wnFriendModelWithNSDictionart:(NSDictionary *)dic {
    
    return [[self alloc] initWithNSDictionary:dic];
}

@end
