//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/larry/dev/workspace/realtime/realtime-store/src/main/java/com/goodow/realtime/store/ValuesSetEvent.java
//

#ifndef _ComGoodowRealtimeStoreValuesSetEvent_H_
#define _ComGoodowRealtimeStoreValuesSetEvent_H_

@protocol ComGoodowRealtimeJsonJsonArray;

#include "J2ObjC_header.h"
#include "com/goodow/realtime/store/BaseModelEvent.h"

@protocol ComGoodowRealtimeStoreValuesSetEvent < ComGoodowRealtimeStoreBaseModelEvent, NSObject, JavaObject >
- (jint)index;

- (id<ComGoodowRealtimeJsonJsonArray>)newValues OBJC_METHOD_FAMILY_NONE;

- (id<ComGoodowRealtimeJsonJsonArray>)oldValues;

@end

J2OBJC_EMPTY_STATIC_INIT(ComGoodowRealtimeStoreValuesSetEvent)

J2OBJC_TYPE_LITERAL_HEADER(ComGoodowRealtimeStoreValuesSetEvent)

#endif // _ComGoodowRealtimeStoreValuesSetEvent_H_
