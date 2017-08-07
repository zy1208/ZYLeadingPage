//
//  ZYLeadingPageController.m
//  ZYLeadingPage
//
//  Created by mac on 17/4/30.
//  Copyright (c) 2017年 zy. All rights reserved.
//

#import "ZYLeadingPageController.h"
#import "ZYLeadingPageCell.h"

#define MARGIN 5

@interface ZYLeadingPageController ()<UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate>

@property (nonatomic, copy) setUpHandler setUpHandler;

@property (nonatomic, copy) finishHandler finishHandler;

@end

static NSString *const reuseIdentifier = @"leadingPageCellId";

@implementation ZYLeadingPageController

- (instancetype)initLeadingPageWithImageCount:(NSInteger)count setUpHandler:(setUpHandler)setUphandler finishHandler:(finishHandler)finishHandler {
    if (self = [super initWithNibName:nil bundle:nil]) {
        _count = count;
        _setUpHandler = [setUphandler copy];
        _finishHandler = [finishHandler copy];
        [self.view addSubview:self.collectionView];
        [self.view addSubview:self.pageControl];
        [self.collectionView registerClass:[ZYLeadingPageCell class] forCellWithReuseIdentifier:reuseIdentifier];
    }
    return self;
}

//懒加载
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.itemSize = self.view.bounds.size;
        flowLayout.minimumInteritemSpacing = 0.f;
        flowLayout.minimumLineSpacing = 0.f;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.bounces = NO;
        collectionView.pagingEnabled = YES;
        _collectionView = collectionView;
    }
    return _collectionView;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        UIPageControl *pageControl = [[UIPageControl alloc] init];
        pageControl.numberOfPages = self.count;
        pageControl.currentPage = 0;
        CGSize size = [pageControl sizeForNumberOfPages:self.count];
        CGFloat pageControlX = (self.view.bounds.size.width - size.width) / 2;
        CGFloat pageControlY = self.view.bounds.size.height - size.height - 50.f;
        pageControl.frame = CGRectMake(pageControlX, pageControlY, size.width, size.height);
        _pageControl = pageControl;
    }
    return _pageControl;
}

#pragma mark -- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZYLeadingPageCell *leadingPageCell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (indexPath.row != self.count - 1) {
        leadingPageCell.finishButton.hidden = YES;
    } else {
        leadingPageCell.finishButton.hidden = NO;
        [leadingPageCell.finishButton addTarget:self action:@selector(finishButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    if (_setUpHandler) {
        _setUpHandler(leadingPageCell, indexPath);
    }
    return leadingPageCell;
}

#pragma mark -- 完成按钮的点击事件
- (void)finishButtonDidClick:(UIButton *)btn {
    if (_finishHandler) {
        self.finishHandler(btn);
    }
}

#pragma mark -- UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger currentPage = scrollView.contentOffset.x / scrollView.bounds.size.width + 0.5;
    if (self.pageControl.currentPage != currentPage) {
        self.pageControl.currentPage = currentPage;
    }
}

@end
