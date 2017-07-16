//
//  HTTPClient.m
//  GZBankProject
//
//  Created by Wu Ting on 2017/7/16.
//  Copyright © 2017年 wuting. All rights reserved.
//

#import "HTTPClient.h"
#import "AFHTTPSessionManager.h"

@interface HTTPClient ()
@property (strong, nonatomic, readwrite) AFHTTPSessionManager *httpSessionManager;
@property (nonatomic, strong) AFHTTPResponseSerializer<AFURLResponseSerialization> *responseSerializer;
@end

@implementation HTTPClient

+ (instancetype)sharedInstance {
    static id _sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] initWithBaseURL:nil];
    });
    
    return _sharedInstance;
}

- (instancetype)initWithBaseURL:(NSURL *)baseURL {
    self = [super init];
    if (self) {
        _baseURL = baseURL;
        _responseSerializer = [[AFJSONResponseSerializer alloc] init];
        _responseSerializer.acceptableContentTypes = nil;
    }
    
    return self;
}

- (NSURLSessionDataTask *)GET:(NSString *)URLString parameters:(NSDictionary *)parameters success:(HttpClientSuccessBlock)success failure:(HttpClientFailureBlock)failure {
    return [self.httpSessionManager GET:URLString parameters:parameters success:success failure:failure];
}

- (NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(NSDictionary *)parameters success:(HttpClientSuccessBlock)success failure:(HttpClientFailureBlock)failure {
    return [self.httpSessionManager POST:URLString parameters:parameters success:success failure:failure];
}

- (AFHTTPSessionManager *)httpSessionManager {
    if (!_httpSessionManager) {
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        sessionConfiguration.timeoutIntervalForRequest = 5.0f;
        sessionConfiguration.timeoutIntervalForResource = 5.0f;
        _httpSessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:self.baseURL sessionConfiguration:sessionConfiguration];
        AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
        requestSerializer.timeoutInterval = 5.0f;
        _httpSessionManager.requestSerializer = requestSerializer;
        _httpSessionManager.responseSerializer = _responseSerializer;
    }
    
    return _httpSessionManager;
}

@end
