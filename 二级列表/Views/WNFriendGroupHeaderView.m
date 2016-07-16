//
//  WNFriendGroupHeaderView.m
//  TabViewOperation
//
//  Created by ym on 16/7/16.
//  Copyright © 2016年 王宁. All rights reserved.
//

#import "WNFriendGroupHeaderView.h"
@interface WNFriendGroupHeaderView ()
@property (nonatomic, weak) UIButton *headerBtn;

@property (nonatomic, weak) UILabel *countOnline;

@end

@implementation WNFriendGroupHeaderView

///像 自定义cell一样 定义一个headerView
+ (instancetype)wnFriendHeaderViewWithTableView:(UITableView *)tableView {
    static NSString *headerID = @"header";
    WNFriendGroupHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
    if (headerView == nil) {
        headerView = [[self alloc] initWithReuseIdentifier:headerID];
    }
    
    return headerView;
}


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        //布局子控件
        [self setupChlidView];
    }
    
    return self;
}


- (void)setupChlidView{
    //头视图  按钮
    
    UIButton *headerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:headerBtn];
    self.headerBtn = headerBtn;
    [self.headerBtn setTitleColor:[UIColor blackColor] forState:0];
    [self.headerBtn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:0];
    ///这是对齐方式
    self.headerBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    ///设置内边距
    self.headerBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    self.headerBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    //按钮的背景图片
    [self.headerBtn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:0];
    [self.headerBtn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:1];
    self.headerBtn.imageView.contentMode = UIViewContentModeCenter;
    
    self.headerBtn.imageView.clipsToBounds = NO;
    
    [self.headerBtn addTarget:self action:@selector(headerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *countOnline = [[UILabel alloc] init];
    [self.contentView addSubview:countOnline];
    self.countOnline = countOnline;
    self.countOnline.textAlignment = NSTextAlignmentRight;
    self.countOnline.font = [UIFont  systemFontOfSize:14.0];
    self.countOnline.textColor = [UIColor grayColor];
    
}

/// 按钮的监听事件
- (void)headerBtnClick:(UIButton *)sender {
    self.groupModel.expend = !self.groupModel.expend;
    
    if (!self.groupModel.isExpend) {
        //没有展开
        self.headerBtn.imageView.transform = CGAffineTransformMakeRotation(0);
    }else {
        //展开
        self.headerBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }
    
    if ([self.delegate respondsToSelector:@selector(WNHeaderViewDidClickBtn:)]) {
        
        [self.delegate WNHeaderViewDidClickBtn:self];
    }
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.headerBtn.frame = self.bounds;
    
    CGFloat countX = self.bounds.size.width - 160;
    
    self.countOnline.frame = CGRectMake(countX, 0, 150, 44);
}


- (void)setGroupModel:(WNFriendGroupModel *)groupModel {
    _groupModel = groupModel;
    [self.headerBtn setTitle:groupModel.name forState:0];
    self.countOnline.text = [NSString stringWithFormat:@"%ld/%lu",(long)groupModel.online,(unsigned long)groupModel.friends.count];
    
    if (self.groupModel.isExpend) {
        self.headerBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        self.headerBtn.imageView.transform = CGAffineTransformMakeRotation(0);
    }
    
}

@end
