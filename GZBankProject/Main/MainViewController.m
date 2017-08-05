//
//  MainViewController.m
//  GZBankProject
//
//  Created by Wu Ting on 2017/7/16.
//  Copyright © 2017年 wuting. All rights reserved.
//

#import "MainViewController.h"
#import "WebAppAddressCenter.h"
#import "WebAppViewController.h"
#import "SplashView.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupTabBar];
    [self setupEntrys];
    [self loadSplashView];
}

- (void)loadSplashView {
    SplashView *splash = [[SplashView alloc] initWithFrame:self.view.bounds];
    splash.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:splash];
    [splash loadSplashImageWithHideInterval:3.0];
}

- (void)setupTabBar {
    self.tabBar.translucent = NO;
    self.tabBar.tintColor = [UIColor darkGrayColor];
}

- (void)setupEntrys {
    WebAppViewController *index = [[WebAppViewController alloc] initWithUrlString:[WebAppAddressCenter webAppIndexURL]];
    index.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"tab_home"] selectedImage:[UIImage imageNamed:@"tab_home_press"]];
    
    WebAppViewController *personal = [[WebAppViewController alloc] initWithUrlString:[WebAppAddressCenter webAppPersonalCenterURL]];
    personal.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"个人中心" image:[UIImage imageNamed:@"tab_me"] selectedImage:[UIImage imageNamed:@"tab_me_press"]];
    
    self.viewControllers = @[index, personal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
