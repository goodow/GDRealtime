//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/larry/dev/workspace/realtime/realtime-operation/src/main/java/com/goodow/realtime/operation/OperationSink.java
//

#ifndef _ComGoodowRealtimeOperationOperationSink_H_
#define _ComGoodowRealtimeOperationOperationSink_H_

@protocol ComGoodowRealtimeOperationOperation;

#include "J2ObjC_header.h"

@protocol ComGoodowRealtimeOperationOperationSink < NSObject, JavaObject >

- (void)consumeWithComGoodowRealtimeOperationOperation:(id<ComGoodowRealtimeOperationOperation>)op;

- (NSString *)description;

@end

J2OBJC_EMPTY_STATIC_INIT(ComGoodowRealtimeOperationOperationSink)

J2OBJC_TYPE_LITERAL_HEADER(ComGoodowRealtimeOperationOperationSink)

#endif // _ComGoodowRealtimeOperationOperationSink_H_
