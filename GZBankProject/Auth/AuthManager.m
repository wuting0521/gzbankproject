//
//  AuthManager.m
//  GZBankProject
//
//  Created by Wu Ting on 2017/7/22.
//  Copyright © 2017年 wuting. All rights reserved.
//

#import "AuthManager.h"
#import "NSString+Hashes.h"

@interface AuthManager ()
@property (nonatomic, nullable, copy) NSNumber *uid;
@property (nonatomic, nullable, copy) NSString *authHash;
@end

@implementation AuthManager

+ (instancetype)sharedInstance {
    static id _sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[AuthManager alloc] init];
    });
    
    return _sharedInstance;
}

static NSString * const kAuthUidUserDefaultsKey = @"com.gzbank.webapp.auth.uid";
static NSString * const kAuthHashUserDefaultskey = @"com.gzbank.webapp.auth.hash";

- (instancetype)init {
    self = [super init];
    if (self) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        self.uid = [defaults  objectForKey:kAuthUidUserDefaultsKey];
        self.authHash = [defaults objectForKey:kAuthHashUserDefaultskey];
    }
    
    return self;
}

- (void)saveUid:(NSNumber *)uid {
    if (!uid) {
        return;
    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:uid forKey:kAuthUidUserDefaultsKey];
    [defaults synchronize];
    self.uid = uid;
}

- (void)saveAuthHash:(NSString *)authHash {
    if (!authHash) {
        return;
    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:authHash forKey:kAuthHashUserDefaultskey];
    [defaults synchronize];
    self.authHash = authHash;
}

- (void)removeLoginInformation {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:kAuthUidUserDefaultsKey];
    [defaults removeObjectForKey:kAuthHashUserDefaultskey];
    [defaults synchronize];
    
    self.uid = nil;
    self.authHash = nil;
}

@end
