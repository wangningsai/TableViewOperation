//
//  LinkageVC.m
//  TabViewOperation
//
//  Created by ym on 16/7/16.
//  Copyright © 2016年 王宁. All rights reserved.
//

#import "LinkageVC.h"
#import "Linkage1VC.h"
@interface LinkageVC ()<UITableViewDelegate,UITableViewDataSource,ProductsDelegate>
@property (nonatomic, strong) NSMutableArray * LinkageArr;
@property (nonatomic, strong) UITableView * linkageTableView;
@property (nonatomic, strong)  Linkage1VC *productsVC;

@end

@implementation LinkageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"商品";
    [self configData];
    [self createTableView];
    [self createProductsVC];
}
-(void)configData
{
    if (!self.LinkageArr)
    {
        NSArray *numArr = @[@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"十",@"十一",@"十二",@"十三",@"十四",@"十五",@"十六",@"十七",@"十八",@"十九",@"二十"];
        NSMutableArray *tmpArr = [[NSMutableArray alloc]init];
        for (int i = 0; i<20; i++)
        {
            NSString *tmpStr = [NSString stringWithFormat:@"第%@类",numArr[i]];
            [tmpArr addObject:tmpStr];
        }
        _LinkageArr = tmpArr;
    }
}
- (void)createTableView {
    
    self.linkageTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width * 0.25, self.view.frame.size.height) style:UITableViewStylePlain];
    self.linkageTableView.delegate = self;
    self.linkageTableView.dataSource = self;
    self.linkageTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.linkageTableView];
}
- (void)createProductsVC {
    
    _productsVC = [[Linkage1VC alloc] init];
    _productsVC.delegate = self;
    [self addChildViewController:_productsVC];
    [self.view addSubview:_productsVC.view];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//MARK:-tableView的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.LinkageArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *ident = @"ident";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
    
    cell.textLabel.text = [_LinkageArr objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_productsVC) {
        [_productsVC scrollToSelectedIndexPath:indexPath];
    }
}

#pragma mark - ProductsDelegate
- (void)willDisplayHeaderView:(NSInteger)section {
    
    [self.linkageTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:section inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}

-(void)didEndDisplayHeaderView:(NSInteger)section{
    
    [self.linkageTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:section + 1 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}

@end
