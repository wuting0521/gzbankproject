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
#import <JavaScriptCore/JavaScriptCore.h>
#import "WebAppScriptMessageHandler.h"

@interface WebAppViewController () <WKNavigationDelegate>
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
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupWebView];
}

- (void)setupWebView {
    [self.view addSubview:self.webView];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.webView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:20]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.webView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.webView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.webView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:0]];
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
//    NSString *html = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
//    [self.webView loadHTMLString:html baseURL:[[NSBundle mainBundle] bundleURL]];
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
        
        WKPreferences *pref = [[WKPreferences alloc] init];
        pref.javaScriptCanOpenWindowsAutomatically = YES;
        pref.minimumFontSize = 40;
        conf.preferences = pref;
        
        _webView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:conf];
        _webView.translatesAutoresizingMaskIntoConstraints = NO;
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
