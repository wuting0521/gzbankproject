//
//  NSDictionary+Safe.m
//  YYMobileFramework
//
//  Created by wuwei on 14-3-19.
//  Copyright (c) 2014年 YY Inc. All rights reserved.
//

#import "NSDictionary+Safe.h"

@implementation NSDictionary (Safe)

- (NSString *)stringForKey:(id)key
{
    return [self stringForKey:key or:nil];
}

- (NSString *)stringForKey:(id)key or:(NSString *)fall
{
    return [self objectForKey:key expectedClass:[NSString class] or:fall];
}

- (NSNumber *)numberForKey:(id)key
{
    return [self numberForKey:key or:nil];
}
- (NSNumber *)numberForKey:(id)key or:(NSNumber *)fall
{
    return [self objectForKey:key expectedClass:[NSNumber class] or:fall];
}

- (NSDictionary *)dictionaryForKey:(id)key
{
    return [self dictionaryForKey:key or:nil];
}

- (NSDictionary *)dictionaryForKey:(id)key or:(NSDictionary *)fall
{
    return [self objectForKey:key expectedClass:[NSDictionary class] or:fall];
}

- (NSArray *)arrayForKey:(id)key
{
    return [self arrayForKey:key or:nil];
}

- (NSArray *)arrayForKey:(id)key or:(NSArray *)fall
{
   return [self objectForKey:key expectedClass:[NSArray class] or:fall];
}

- (NSData *)dataForKey:(id)key
{
    return [self dataForKey:key or:nil];
}

- (NSData *)dataForKey:(id)key or:(NSData *)fall
{
    return [self objectForKey:key expectedClass:[NSData class] or:fall];
}

- (id)objectForKey:(id)key expectedClass:(Class)class
{
    return [self objectForKey:key expectedClass:class or:nil];
}

- (id)objectForKey:(id)key expectedClass:(Class)class or:(id)fall
{
    id obj = [self objectForKey:key];
    if (class && [obj isKindOfClass:class]) {
        return obj;
    }
    return fall;
}

@end

@implementation NSDictionary (SafeCompatible)

- (NSString *)stringForKeyCompatibleNumber:(id)key
{
    id result = [self objectForKey:key expectedClass:[NSString class]];
    if (!result) {
        result = [self objectForKey:key expectedClass:[NSNumber class]];
    }
    return result;
}

- (NSNumber *)numberForKeyCompatibleString:(id)key
{
    id result = [self objectForKey:key expectedClass:[NSNumber class]];
    if (!result) {
        result = [self objectForKey:key expectedClass:[NSString class]];
    }
    return result;
}

@end
