//
//  ViewController.m
//  TabViewOperation
//
//  Created by ym on 16/7/15.
//  Copyright © 2016年 王宁. All rights reserved.
//

#import "ViewController.h"
#import "MoveVC.h"
#import "DeleteVC.h"
#import "InsertVC.h"
#import "LongMoveVC.h"
#import "LinkageVC.h"
#import "WNViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray * array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.array = [[NSMutableArray alloc]initWithObjects:@"cell的移动",@"cell的删除",@"cell的添加",@"长按cell的移动",@"TableView的联动",@"二级列表", nil];

    
  
    
//    创建一个tableView
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
//    遵循代理
    tableView.delegate = self;
    tableView.dataSource = self;
    
    
    [self.view addSubview:tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cell1 = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1];
    if (cell == nil )
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell1];
    }
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        NSLog(@"llll");
        MoveVC *moveVC = [[MoveVC alloc]init];
        
        [self.navigationController pushViewController:moveVC animated:YES];
        
    }
    if (indexPath.row == 1)
    {
        DeleteVC *deleteVC = [[DeleteVC alloc]init];
        
        [self.navigationController pushViewController:deleteVC animated:YES];
        
    }

    if (indexPath.row == 2)
    {
        InsertVC *insertVC = [[InsertVC alloc]init];
        
        [self.navigationController pushViewController:insertVC animated:YES];
        
    }
    if (indexPath.row == 3)
    {
        LongMoveVC *longMoveVC = [[LongMoveVC alloc]init];
        
        [self.navigationController pushViewController:longMoveVC animated:YES];
    }
    if (indexPath.row == 4)
    {
        LinkageVC *linkageVC = [[LinkageVC alloc]init];
        
        [self.navigationController pushViewController:linkageVC animated:YES];
    }
    if (indexPath.row == 5)
    {
        WNViewController *wnVC = [[WNViewController alloc]init];
        
        [self.navigationController pushViewController:wnVC animated:YES];
    }


}
@end
