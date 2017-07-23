//
//  AuthManager.h
//  GZBankProject
//
//  Created by Wu Ting on 2017/7/22.
//  Copyright © 2017年 wuting. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AuthManager : NSObject

@property (nonatomic, readonly, nullable) NSNumber *uid;
@property (nonatomic, readonly, nullable) NSString *authHash;

+ (instancetype _Nonnull )sharedInstance;
- (void)saveLoginInformationWithUid:(NSNumber *_Nonnull)uid authHash:(NSString *_Nonnull)authHash;
- (void)removeLoginInformation;

- (NSString *_Nullable)webTokenForRequestString:(NSString *_Nonnull)requestString;
@end
