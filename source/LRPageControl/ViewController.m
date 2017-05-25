//
//  ViewController.m
//  LRPageControl
//
//  Created by 宇中 on 2017/5/25.
//  Copyright © 2017年 广州宇中网络科技有限公司. All rights reserved.
//

#import "ViewController.h"
#import "LRPageControl.h"
#define totalPages 6

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) LRPageControlView *pageControlView;
@property (nonatomic, strong) UIScrollView *bannerScrollView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bannerScrollView = ({
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 300)];
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.contentSize = CGSizeMake(totalPages * self.view.frame.size.width, 120);
        for (int index = 0; index < totalPages; index ++) {
            UIImageView *bannerImageView = ({
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(index * self.view.frame.size.width, 0, self.view.frame.size.width, 120)];
                imageView.image = [UIImage imageNamed:@"kongbaiye"];
                [scrollView addSubview:imageView];
                imageView;
            });
        }
        scrollView.delegate = self;
        scrollView.pagingEnabled = YES;
        [self.view addSubview:scrollView];
        scrollView;
    });
    self.pageControlView = [[LRPageControlView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 200) * .5, 200, 200, 30)];
    self.pageControlView.numberOfPages = totalPages;
    self.pageControlView.bindingScrollView = self.bannerScrollView;
    self.pageControlView.selectedColor = [UIColor redColor];
    self.pageControlView.unSelectedColor = [UIColor lightGrayColor];
    self.pageControlView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.pageControlView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    self.pageControlView.contentOffset_x = scrollView.contentOffset.x;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    self.pageControlView.lastContentOffset_x = scrollView.contentOffset.x;
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    self.pageControlView.lastContentOffset_x = scrollView.contentOffset.x;
}


@end
