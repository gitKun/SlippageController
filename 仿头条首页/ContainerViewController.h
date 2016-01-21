//
//  ContainerViewController.h
//  仿头条首页
//
//  Created by apple on 15/12/9.
//  Copyright © 2015年 CaiFu. All rights reserved.
//

#import "XLPagerTabStripViewController.h"

@class ContainerViewController;

@protocol ContainerViewControllerDelegate <NSObject>

- (void)containerVC:(ContainerViewController *)conterVC updateIndicatorFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)tiIndex;

@end

@interface ContainerViewController : XLPagerTabStripViewController

/** 这是标记是否要调用代理  此成员为必须有 */
@property (nonatomic, assign) BOOL shouldResetHeaderView;

@property (nonatomic, assign) id<ContainerViewControllerDelegate>mDelegate;

@end
