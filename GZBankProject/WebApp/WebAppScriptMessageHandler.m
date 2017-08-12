//
//  WebAppScriptMessageHandler.m
//  GZBankProject
//
//  Created by Wu Ting on 2017/7/23.
//  Copyright © 2017年 wuting. All rights reserved.
//

#import "WebAppScriptMessageHandler.h"
#import "AuthManager.h"
#import "NSString+Hashes.h"
#import "MainViewController.h"

@interface WebAppScriptMessageHandler ()
@property (weak, nonatomic) WKWebView *webView;
@property (copy, nonatomic) void (^evaluateJavaScriptCompletionHandler)(id result, NSError *error);
@end

@implementation WebAppScriptMessageHandler

- (instancetype)init {
    self = [super init];
    if (self) {
        self.evaluateJavaScriptCompletionHandler = ^(id result, NSError *error) {
            NSLog(@"[JS Evaluation]%@----%@", result, error);
        };
    }
    
    return self;
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    self.webView = message.webView;
    if ([message.name isEqualToString:@"saveToken"]) {
        NSString *token = message.body;
        [[AuthManager sharedInstance] saveAuthHash:token];
    } else if ([message.name isEqualToString:@"getToken"]) {
        NSString *token = [[AuthManager sharedInstance] authHash];
        NSString *jsStr = [NSString stringWithFormat:@"getTokenResult('%@')", token];
        [self.webView evaluateJavaScript:jsStr completionHandler:self.evaluateJavaScriptCompletionHandler];
    } else if ([message.name isEqualToString:@"encryptData"]) {
        NSString *data = message.body;
        NSString *jsStr = [NSString stringWithFormat:@"encryptDataResult('%@')", data.sha1];
        [self.webView evaluateJavaScript:jsStr completionHandler:self.evaluateJavaScriptCompletionHandler];
    } else if ([message.name isEqualToString:@"goToTab"]) {
        MainViewController *vc = (MainViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
        NSString *tab = message.body;
        vc.selectedIndex = [tab integerValue];
    }
}

@end
