//
//  DeleteVC.m
//  TabViewOperation
//
//  Created by ym on 16/7/15.
//  Copyright © 2016年 王宁. All rights reserved.
//

#import "DeleteVC.h"

@interface DeleteVC ()
@property (nonatomic, strong)  NSMutableArray * array;
@end

@implementation DeleteVC

- (void)viewDidLoad {
    [super viewDidLoad];
    

     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.array = [[NSMutableArray alloc]initWithObjects:@"数据1",@"数据2",@"数据3",@"数据4",@"数据5",@"数据6",@"数据7",@"数据8",@"数据9", nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cell1 = @"cell1";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell1];
    }
    cell.textLabel.text = self.array[indexPath.row];
    
    return  cell;
    
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    //删除数组中指定位置的值
    [self.array removeObjectAtIndex:indexPath.row];
    //删除数据
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationAutomatic];
}


@end
