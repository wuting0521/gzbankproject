//
//  WebAppScriptMessageHandler.m
//  GZBankProject
//
//  Created by Wu Ting on 2017/7/23.
//  Copyright © 2017年 wuting. All rights reserved.
//

#import "WebAppScriptMessageHandler.h"

@implementation WebAppScriptMessageHandler

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    if ([message.name isEqualToString:@"getToken"]) {
        
    }
}

@end
