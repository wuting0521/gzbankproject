//
//  WebAppAddressCenter.m
//  GZBankProject
//
//  Created by Wu Ting on 2017/7/16.
//  Copyright © 2017年 wuting. All rights reserved.
//

#import "WebAppAddressCenter.h"

static NSString * kWebAppDevelopDomain = @"http://39.108.155.19:8080";

static NSString * kWebAppIndexURL = @"/front/index.html";
static NSString * kWebAppPersonalCenterURL = @"/front/index.html#/person/index";

static NSString * kAppSplashImageURL = @"/end/core/image/start";

@implementation WebAppAddressCenter

+ (NSString *)webAppDomain {
    return kWebAppDevelopDomain;
}

+ (NSString *)webAppIndexURL {
    return [NSString stringWithFormat:@"%@%@", [WebAppAddressCenter webAppDomain], kWebAppIndexURL];
}

+ (NSString *)webAppPersonalCenterURL {
    return [NSString stringWithFormat:@"%@%@", [WebAppAddressCenter webAppDomain], kWebAppPersonalCenterURL];
}

+ (NSString *)appSplashImageURL {
    return [NSString stringWithFormat:@"%@%@", [WebAppAddressCenter webAppDomain], kAppSplashImageURL];
}

@end
