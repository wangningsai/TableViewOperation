//
//  Linkage1VC.h
//  TabViewOperation
//
//  Created by ym on 16/7/16.
//  Copyright © 2016年 王宁. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ProductsDelegate<NSObject>
-(void)willDisplayHeaderView:(NSInteger)section;
-(void)didEndDisplayHeaderView:(NSInteger)section;
@end
@interface Linkage1VC : UIViewController
@property (nonatomic, strong) id<ProductsDelegate> delegate;
/**
 *  当linkageTableView滚动时,ProductsTableView跟随滚动至指定section
 *
 *  @param section
 */
- (void)scrollToSelectedIndexPath:(NSIndexPath *)indexPath;
@end
