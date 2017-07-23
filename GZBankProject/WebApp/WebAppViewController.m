//
//  WebAppViewController.m
//  GZBankProject
//
//  Created by Wu Ting on 2017/7/16.
//  Copyright © 2017年 wuting. All rights reserved.
//

#import "WebAppViewController.h"
#import <WebKit/WebKit.h>
#import "WebAppUserContentController.h"

@interface WebAppViewController ()
@property (nonatomic) WKWebView *webView;
@property (nonatomic) WebAppUserContentController *contentController;
@property (copy, nonatomic) NSString *urlString;
@end

@implementation WebAppViewController

- (instancetype)initWithUrlString:(NSString *)urlString {
    if (self = [super init]) {
        _urlString = [urlString copy];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupWebView];
}

- (void)setupWebView {
    [self.view addSubview:self.webView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
- (WKWebView *)webView {
    if (!_webView) {
        WKWebViewConfiguration *conf = [[WKWebViewConfiguration alloc] init];
        conf.userContentController = self.contentController;
        
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:conf];
        _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    
    return _webView;
}

- (WebAppUserContentController *)contentController {
    if (!_contentController) {
        _contentController = [[WebAppUserContentController alloc] init];
    }
    
    return _contentController;
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
