//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/retechretech/dev/workspace/realtime/realtime-operation/src/main/java/com/goodow/realtime/operation/Operation.java
//
//  Created by retechretech.
//

#ifndef _ComGoodowRealtimeOperationOperation_H_
#define _ComGoodowRealtimeOperationOperation_H_

@protocol ComGoodowRealtimeJsonJsonElement;

#import "JreEmulation.h"

@protocol ComGoodowRealtimeOperationOperation < NSObject, JavaObject >

- (void)applyWithId:(id)target;

- (id<ComGoodowRealtimeOperationOperation>)invert;

- (id<ComGoodowRealtimeJsonJsonElement>)toJson;

- (id<ComGoodowRealtimeOperationOperation>)transformWithComGoodowRealtimeOperationOperation:(id<ComGoodowRealtimeOperationOperation>)other
                                                                                withBoolean:(BOOL)applied;

@end

__attribute__((always_inline)) inline void ComGoodowRealtimeOperationOperation_init() {}

#endif // _ComGoodowRealtimeOperationOperation_H_