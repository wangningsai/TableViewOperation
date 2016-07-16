//
//  LongMoveVC.m
//  TabViewOperation
//
//  Created by ym on 16/7/16.
//  Copyright © 2016年 王宁. All rights reserved.
//
#define IS_IOS7 [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0
#import "LongMoveVC.h"

@interface LongMoveVC ()
@property (nonatomic, strong) NSMutableArray * array;
@end

@implementation LongMoveVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.array = [[NSMutableArray alloc]initWithObjects:@"数据1",@"数据2",@"数据3",@"数据4",@"数据5",@"数据6",@"数据7",@"数据8",@"数据9", nil];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressGestureRecognized:)];
    
    [self.tableView addGestureRecognizer:longPress];
    
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
    NSString *cell1 = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell1];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell1];
    }
    cell.textLabel.text = self.array[indexPath.row];
    
    // Configure the cell...
    
    return cell;
}
- (void)longPressGestureRecognized:(id)sender
{
    //获取长按手势
    UILongPressGestureRecognizer *longPress = (UILongPressGestureRecognizer *)sender;
    //长按状态
    UIGestureRecognizerState states = longPress.state;
    //获取长按的位置
    CGPoint location = [longPress locationInView:self.tableView];
    //根据位置得到cell的下标
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    //创建一个截图
    static UIView *snapshot = nil;
    //开始移动cell的indexPath
    static NSIndexPath *souceIndexPath = nil;
    switch (states) {
        case UIGestureRecognizerStateBegan: {
            //刚开始按下的时候获取到当前位置的cell
            souceIndexPath = indexPath;
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
            //得到一个截图View
            snapshot = [self customSnapShottFromView:cell];
            //将得到的截图放到列表上
            __block CGPoint center = cell.center;
            snapshot.center = center;
            snapshot.alpha = 0.0;
            [self.tableView addSubview:snapshot];
            //使用动画完成一个截图的拖拽效果
            [UIView animateWithDuration:0.15
                             animations:^{
                                 center.y = location.y;
                                 snapshot.center = center;
                                 //将截图方法
                                 snapshot.transform = CGAffineTransformMakeScale(1.05, 1.05);
                                 //将截图渐变
                                 snapshot.alpha = 0.98;
                                 //设置背景颜色
                                 cell.backgroundColor = [UIColor clearColor];
                             }
                             completion:^(BOOL finished){
                                 
                             }];
        } break;
        case UIGestureRecognizerStateChanged: {
            //如果手势移动的距离对应带另外一个 index path 就需要告诉table View，让它移动rows，同时你需要对data source进行更新。
            CGPoint center = snapshot.center;
            center.y = location.y;
            snapshot.center = center;
            //判断是否移动初始化的cell，indexPath为当前选中的cell sourceIndexPath为“移动”的cell
            if (indexPath && ![indexPath isEqual:souceIndexPath]) {
                // TODO交换数据
                [self.array exchangeObjectAtIndex:indexPath.row withObjectAtIndex:souceIndexPath.row];
                //交换cell
                [self.tableView moveRowAtIndexPath:souceIndexPath toIndexPath:indexPath];
                //将indexPath最为移动的cell
                souceIndexPath = indexPath;
            }
        } break;
        default: {
            //当手势结束或者取消的时候，table view 和 data source都是最新的，将snapshot View
            //从tableView中移除，并将tableViewcell的背景颜色还原
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
            [UIView animateWithDuration:0.15
                             animations:^{
                                 snapshot.center = cell.center;
                                 //还原成初始化的状态
                                 snapshot.transform = CGAffineTransformIdentity;
                                 snapshot.alpha = 0.0;
                                 cell.backgroundColor = [UIColor whiteColor];
                                 
                             }
                             completion:^(BOOL finished) {
                                 [snapshot removeFromSuperview];
                             }];
            
            souceIndexPath = nil;
            NSLog(@"%@",self.array);
            
        } break;
    }

}
- (UIView *)customSnapShottFromView:(UIView *)view {
    if (IS_IOS7) {
        UIView *snapshot_IOS7 = [view snapshotViewAfterScreenUpdates:YES];
        snapshot_IOS7.layer.masksToBounds = NO;
        snapshot_IOS7.layer.cornerRadius = 0.0;
        snapshot_IOS7.layer.shadowOffset = CGSizeMake(-5.0, 0.0);
        snapshot_IOS7.layer.shadowRadius = 5.0;
        snapshot_IOS7.layer.shadowOpacity = 0.4;
        
        return snapshot_IOS7;
    } else {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
        [view.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        UIView *snapshotView = [[UIView alloc] initWithFrame:view.bounds];
        [snapshotView setBackgroundColor:[UIColor colorWithPatternImage:snapshot]];
        snapshotView.layer.masksToBounds = NO;
        snapshotView.layer.cornerRadius = 0.0;
        snapshotView.layer.shadowOffset = CGSizeMake(-5.0, 0.0);
        snapshotView.layer.shadowRadius = 5.0;
        snapshotView.layer.shadowOpacity = 0.4;
        
        return snapshotView;
    }
}

@end
