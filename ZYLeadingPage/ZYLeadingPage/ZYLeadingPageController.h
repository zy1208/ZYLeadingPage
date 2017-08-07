//
//  ZYLeadingPageController.h
//  ZYLeadingPage
//
//  Created by mac on 17/4/30.
//  Copyright (c) 2017年 zy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYLeadingPageCell.h"

typedef void (^setUpHandler) (ZYLeadingPageCell *collectionViewCell, NSIndexPath *indexPath);

typedef void (^finishHandler) (UIButton *finishBtn);

@interface ZYLeadingPageController : UIViewController

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, assign) NSInteger count;

- (instancetype)initLeadingPageWithImageCount:(NSInteger)count setUpHandler:(setUpHandler)setUphandler finishHandler:(finishHandler)finishHandler;

@end
