//
//  WebAppUserContentController.h
//  GZBankProject
//
//  Created by Wu Ting on 2017/7/23.
//  Copyright © 2017年 wuting. All rights reserved.
//

#import <WebKit/WebKit.h>

@class WebAppScriptMessageHandler;
@interface WebAppUserContentController : WKUserContentController
@property (nonatomic, readonly) WebAppScriptMessageHandler *messageHandler;
@end
