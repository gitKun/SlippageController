//
//  ViewController.m
//  仿头条首页
//
//  Created by apple on 15/12/9.
//  Copyright © 2015年 CaiFu. All rights reserved.
//

#import "ViewController.h"
#import "WJItemsControlView.h"
#import "ContainerViewController.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ViewController ()<WJItemsControlViewDelegate,ContainerViewControllerDelegate>

@property (weak, nonatomic) IBOutlet WJItemsControlView *titleScrollView;
@property (nonatomic, strong) ContainerViewController *containerVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1];
    
    [self headerMarkScrollViewInit];
}

- (void)headerMarkScrollViewInit {
    self.automaticallyAdjustsScrollViewInsets = NO;
    NSArray *titleArr = @[@"全部",@"提现",@"充值",@"回款",@"扣款",@"活动"];
    //头部控制的segMent
    WJItemsConfig *config = [[WJItemsConfig alloc]init];
    config.itemWidth = ScreenWidth/6.0;
    _titleScrollView.tapAnimation = YES;
    _titleScrollView.config = config;
    _titleScrollView.titleArray = titleArr;
    _titleScrollView.mDelegate = self;
}

#pragma mark ==== WJItemsControlViewDelegate
- (void)WJItemsControlView:(WJItemsControlView *)wjItemsControlView clickAtIndex:(NSInteger)index animation:(BOOL)animation {
    self.containerVC.shouldResetHeaderView = NO;
    [self.containerVC moveToViewControllerAtIndex:index animated:animation];
}

#pragma mark ==== ContainerOfAssetsMainVCDelegate
-(void)containerVC:(ContainerViewController *)tvc updateIndicatorFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    [_titleScrollView endMoveToIndex:toIndex];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toChildContainerOfAssetsMain"]) {
        self.containerVC = [segue destinationViewController];
        _containerVC.mDelegate = self;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
