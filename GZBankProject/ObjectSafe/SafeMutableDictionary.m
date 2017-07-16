//
//  SafeMutableDictionary.m
//  OnePiece
//
//  Created by huangshuqing on 29/6/2017.
//  Copyright © 2017 YY. All rights reserved.
//

#import "SafeMutableDictionary.h"
#import <pthread.h>

@implementation SafeMutableDictionary
{
    NSMutableDictionary* _dictionary;
    pthread_mutex_t _lock;
}

+ (instancetype)dictionary
{
    return [[self alloc] init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        pthread_mutex_init(&_lock, NULL);
        _dictionary = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)dealloc
{
    pthread_mutex_destroy(&_lock);
}

- (id)objectForKey:(id)aKey
{
    id result = nil;
    
    if (aKey) {
        pthread_mutex_lock(&_lock);
        result = [_dictionary objectForKey:aKey];
        pthread_mutex_unlock(&_lock);
    }
    
    return result;
}

- (void)removeObjectForKey:(id)aKey
{
    if (aKey)
    {
        pthread_mutex_lock(&_lock);
        [_dictionary removeObjectForKey:aKey];
        pthread_mutex_unlock(&_lock);
    }
}

- (void)removeAllObjects
{
    pthread_mutex_lock(&_lock);
    [_dictionary removeAllObjects];
    pthread_mutex_unlock(&_lock);
}

- (void)removeObjectsForKeys:(NSArray*)keyArray
{
    if (keyArray && keyArray.count) {
        pthread_mutex_lock(&_lock);
        for (id aKey in keyArray) {
            if (aKey) {
                [_dictionary removeObjectForKey:aKey];
            }
        }
        pthread_mutex_unlock(&_lock);
    }
}

- (void)setObject:(id)anObject forKey:(id)aKey
{
    if (anObject && aKey) {
        pthread_mutex_lock(&_lock);
        [_dictionary setObject:anObject forKey:aKey];
        pthread_mutex_unlock(&_lock);
    }
}

- (void)addEntriesFromDictionary:(NSDictionary*)otherDictionary
{
    if (otherDictionary && otherDictionary.count) {
        pthread_mutex_lock(&_lock);
        [_dictionary addEntriesFromDictionary:otherDictionary];
        pthread_mutex_unlock(&_lock);
    }
}

- (NSUInteger)count
{
    NSUInteger count = 0;
    pthread_mutex_lock(&_lock);
    count = [_dictionary count];
    pthread_mutex_unlock(&_lock);
    return count;
}

@end
