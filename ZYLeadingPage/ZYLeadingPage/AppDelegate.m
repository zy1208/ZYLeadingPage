//
//  AppDelegate.m
//  ZYLeadingPage
//
//  Created by mac on 17/4/30.
//  Copyright (c) 2017年 zy. All rights reserved.
//

#import "AppDelegate.h"
#import "ZYLeadingPageController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    ZYLeadingPageController *leadingPageVC = [[ZYLeadingPageController alloc] initLeadingPageWithImageCount:5 setUpHandler:^(ZYLeadingPageCell *collectionViewCell, NSIndexPath *indexPath) {
        
        NSString *imageName = [NSString stringWithFormat:@"wangyiyun%ld",indexPath.row + 1];
        UIImage *image = [UIImage imageNamed:imageName];
        collectionViewCell.pageImageView.image = image;
        [collectionViewCell.finishButton setTitle:@"立即体验" forState:UIControlStateNormal];
        [collectionViewCell.finishButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
    } finishHandler:^(UIButton *finishBtn) {
        
        NSLog(@"点击了完成按钮———————————");
        
    }];
    leadingPageVC.pageControl.currentPageIndicatorTintColor = [UIColor yellowColor];
    leadingPageVC.pageControl.pageIndicatorTintColor = [UIColor purpleColor];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = leadingPageVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
