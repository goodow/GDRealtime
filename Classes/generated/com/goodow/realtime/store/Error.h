//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/retechretech/dev/workspace/realtime/realtime-store/src/main/java/com/goodow/realtime/store/Error.java
//
//  Created by retechretech.
//

#ifndef _ComGoodowRealtimeStoreError_H_
#define _ComGoodowRealtimeStoreError_H_

@class ComGoodowRealtimeStoreErrorTypeEnum;

#import "JreEmulation.h"

@protocol ComGoodowRealtimeStoreError < NSObject, JavaObject >

- (BOOL)isFatal;

- (NSString *)message;

- (ComGoodowRealtimeStoreErrorTypeEnum *)type;

@end

__attribute__((always_inline)) inline void ComGoodowRealtimeStoreError_init() {}

#endif // _ComGoodowRealtimeStoreError_H_