//
//  SafeMutableDictionary.h
//  OnePiece
//
//  Created by huangshuqing on 29/6/2017.
//  Copyright © 2017 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SafeMutableDictionary : NSObject
+ (instancetype)dictionary;

@property (readonly) NSUInteger count;

- (id)objectForKey:(id)aKey;
- (void)removeObjectForKey:(id)aKey;
- (void)removeAllObjects;
- (void)removeObjectsForKeys:(NSArray*)keyArray;
- (void)setObject:(id)anObject forKey:(id)aKey;
- (void)addEntriesFromDictionary:(NSDictionary*)otherDictionary;
@end
