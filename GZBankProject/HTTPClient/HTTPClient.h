//
//  HTTPClient.h
//  GZBankProject
//
//  Created by Wu Ting on 2017/7/16.
//  Copyright © 2017年 wuting. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPClient : NSObject
@property (strong, nonatomic, readonly) NSURL *baseURL;

+ (instancetype)sharedInstance;
- (instancetype)initWithBaseURL:(NSURL *)url;

typedef void (^HttpClientSuccessBlock)(NSURLSessionDataTask *task, id responseObject);
typedef void (^HttpClientFailureBlock)(NSURLSessionDataTask *task, NSError *error);

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(NSDictionary *)parameters
                      success:(HttpClientSuccessBlock)success
                      failure:(HttpClientFailureBlock)failure;

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(NSDictionary *)parameters
                       success:(HttpClientSuccessBlock)success
                       failure:(HttpClientFailureBlock)failure;

@end
