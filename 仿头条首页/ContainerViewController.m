//
//  ContainerViewController.m
//  仿头条首页
//
//  Created by apple on 15/12/9.
//  Copyright © 2015年 CaiFu. All rights reserved.
//

#import "ContainerViewController.h"

@interface ContainerViewController ()

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

#warning message == 要注意子视图的 frame 特别是高是否正确

#pragma mark ====  XLPagerTabStripViewControllerDataSource
/** 在这个方法中添加你的 子视图控制器 */
-(NSArray *)childViewControllersForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    // create child view controllers that will be managed by XLPagerTabStripViewController
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    // NSArray *pagerTypeArr = @[@(0),@(30),@(10),@(40),@(20),@(50)];
    for (NSInteger i = 0; i<6; i++) {
        UIViewController *blVC = [[UIViewController alloc] init];
        blVC.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
        //        if (i != 0) {
        //            blVC.pagerType = pagerTypeArr[i];
        //        }
        [arr addObject:blVC];
    }
    return arr;
}

#pragma mark ==++== 重写父类协议
-(void)pagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController updateIndicatorFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    
    if ([self.mDelegate respondsToSelector:@selector(containerVC:updateIndicatorFromIndex:toIndex:)] && _shouldResetHeaderView) {
        [_mDelegate containerVC:self updateIndicatorFromIndex:fromIndex toIndex:toIndex];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [super scrollViewDidScroll:scrollView];
    if (self.containerView == scrollView) {
        self.shouldResetHeaderView = YES;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
