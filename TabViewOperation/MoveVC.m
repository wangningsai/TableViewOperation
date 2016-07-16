//
//  MoveVC.m
//  TabViewOperation
//
//  Created by ym on 16/7/15.
//  Copyright © 2016年 王宁. All rights reserved.
//

#import "MoveVC.h"

@interface MoveVC ()
@property (nonatomic, strong) NSMutableArray * array;
@end

@implementation MoveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.array = [[NSMutableArray alloc]initWithObjects:@"a",@"b",@"c",@"h",@"d",@"ds",@"sd",@"fd",@"gdd",@"ad", nil];
      self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    static NSString *cell1 = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell1];
    }
    cell.textLabel.text = self.array[indexPath.row];
    // Configure the cell...
    
    return cell;
}
//　对当前行设置编辑模式，删除、插入或者不可编辑。
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}
//通知委托在编辑模式下是否需要对表视图指定行进行缩进，NO为关闭缩进，这个方法可以用来去掉move时row前面的空白。
-(BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}
//移动行之后调用的方法，可以在里面设置表视图数据list的一些操作
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    id object = [self.array objectAtIndex:sourceIndexPath.row];
    
    [self.array removeObjectAtIndex:sourceIndexPath.row];
    [self.array insertObject:object atIndex:destinationIndexPath.row];
}
@end
