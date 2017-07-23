//
//  WebAppUserContentController.m
//  GZBankProject
//
//  Created by Wu Ting on 2017/7/23.
//  Copyright © 2017年 wuting. All rights reserved.
//

#import "WebAppUserContentController.h"
#import "WebAppScriptMessageHandler.h"

@interface WebAppUserContentController ()
@property (nonatomic) WebAppScriptMessageHandler *messageHandler;
@end

@implementation WebAppUserContentController

- (instancetype)init {
    self = [super init];
    if (self) {
        _messageHandler = [[WebAppScriptMessageHandler alloc] init];
        [self addMessageHandler];
    }
    
    return self;
}

- (void)addMessageHandler {
    [self addScriptMessageHandler:self.messageHandler name:@"getToken"];
}
@end
