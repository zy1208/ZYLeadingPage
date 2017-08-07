//
//  ZYLeadingPageCell.m
//  ZYLeadingPage
//
//  Created by mac on 17/4/30.
//  Copyright (c) 2017年 zy. All rights reserved.
//

#import "ZYLeadingPageCell.h"

#define MARGIN 5

@implementation ZYLeadingPageCell

- (instancetype)init {
    if (self = [super init]) {
        [self commoninit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        [self commoninit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ([super initWithCoder:aDecoder]) {
        [self commoninit];
    }
    return self;
}

- (void)commoninit {
    [self.contentView addSubview:self.pageImageView];
    [self.contentView addSubview:self.finishButton];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.pageImageView.frame = self.bounds;
    [self.finishButton sizeToFit];
    CGFloat finishBtnW = self.finishButton.bounds.size.width;
    CGFloat finishBtnH = self.finishButton.bounds.size.height + 2 *MARGIN;
    CGFloat finishBtnX = (self.bounds.size.width - finishBtnW) *0.5;
    CGFloat finishBtnY = self.bounds.size.height - 200 - finishBtnH;
    self.finishButton.frame = CGRectMake(finishBtnX, finishBtnY, finishBtnW, finishBtnH);
}

- (UIButton *)finishButton {
    if (!_finishButton) {
        UIButton *button = [UIButton new];
        button.backgroundColor = [UIColor orangeColor];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 10.f;
        _finishButton = button;
    }
    return _finishButton;
}

- (UIImageView *)pageImageView {
    if (!_pageImageView) {
        UIImageView *imageView = [UIImageView new];
        imageView.contentMode = UIViewContentModeScaleToFill;
        _pageImageView = imageView;
    }
    return _pageImageView;
}

@end
