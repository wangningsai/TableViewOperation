//
//  WNViewController.m
//  TabViewOperation
//
//  Created by ym on 16/7/16.
//  Copyright © 2016年 王宁. All rights reserved.
//

#import "WNViewController.h"
#import "WNFriendCell.h"
#import "WNFriendModel.h"
#import "WNFriendGroupModel.h"
#import "WNFriendGroupHeaderView.h"
@interface WNViewController ()<UITableViewDataSource, UITableViewDelegate,WNFriendGroupHeaderViewDelegate>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSArray *friendGroup;


@end

@implementation WNViewController
- (NSArray *)friendGroup {
    if (!_friendGroup) {
        self.friendGroup = [WNFriendGroupModel WNFriendGroupList];
        
    }
    
    
    return _friendGroup;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupNAViewAndTableViewContent];
}

- (void)setupNAViewAndTableViewContent {
    self.title = @"QQ好友列表";
    self.navigationController.navigationBar.barTintColor = [UIColor purpleColor];
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.sectionHeaderHeight = 44;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    
}


#pragma mark---------UITableViewDataSource, UITableViewDelegate 代理方法


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    NSLog(@"%ld",self.friendGroup.count);
    return self.friendGroup.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    WNFriendGroupModel *model = self.friendGroup[section];
    
    return model.isExpend ? model.friends.count : 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WNFriendCell *cell = [WNFriendCell wnFriendCellWithTableView:tableView];
    
    cell.friendModel = [self.friendGroup[indexPath.section] friends][indexPath.row];
    return cell;
    
    
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    WNFriendGroupHeaderView *headerView = [WNFriendGroupHeaderView wnFriendHeaderViewWithTableView:tableView];
    headerView.delegate = self;
    WNFriendGroupModel *groupModel = self.friendGroup[section];
    
    headerView.groupModel = groupModel;
    headerView.tag = section;
    return headerView;
    
}


#pragma mark - headerView的代理方法

- (void)WNHeaderViewDidClickBtn:(WNFriendGroupHeaderView *)headerView {
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:headerView.tag];
    
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationNone];
    
}

@end
