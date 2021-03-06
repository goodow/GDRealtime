//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/larry/dev/workspace/realtime/realtime-operation/src/main/java/com/goodow/realtime/operation/list/SimpleDeleteComponent.java
//

#ifndef _ComGoodowRealtimeOperationListSimpleDeleteComponent_H_
#define _ComGoodowRealtimeOperationListSimpleDeleteComponent_H_

@protocol ComGoodowRealtimeJsonJsonArray;

#include "J2ObjC_header.h"
#include "com/goodow/realtime/operation/list/AbstractDeleteComponent.h"
#include "com/goodow/realtime/operation/list/ListHelper.h"

@interface ComGoodowRealtimeOperationListSimpleDeleteComponent : ComGoodowRealtimeOperationListAbstractDeleteComponent < ComGoodowRealtimeOperationListListHelper > {
}

+ (ComGoodowRealtimeOperationListSimpleDeleteComponent *)parseWithComGoodowRealtimeJsonJsonArray:(id<ComGoodowRealtimeJsonJsonArray>)serialized;

- (instancetype)initWithNSString:(NSString *)id_
                         withInt:(jint)startIndex
                         withInt:(jint)length;

- (instancetype)initWithNSString:(NSString *)id_
                         withInt:(jint)startIndex
                          withId:(id)values;

- (ComGoodowRealtimeOperationListSimpleDeleteComponent *)invert;

- (jint)lengthWithId:(id)values;

- (id)parseValuesWithComGoodowRealtimeJsonJsonArray:(id<ComGoodowRealtimeJsonJsonArray>)serialized;

- (id)replaceWithWithId:(id)values
                withInt:(jint)startIndex
                withInt:(jint)length
                 withId:(id)replacement;

- (id)subsetWithId:(id)values
           withInt:(jint)startIndex
           withInt:(jint)length;

- (id)subsetWithId:(id)values
           withInt:(jint)startIndex0
           withInt:(jint)length0
           withInt:(jint)startIndex1
           withInt:(jint)length1;

- (id)subsetWithId:(id)values0
           withInt:(jint)startIndex0
           withInt:(jint)length0
            withId:(id)values1
           withInt:(jint)startIndex1
           withInt:(jint)length1;

- (id<ComGoodowRealtimeJsonJsonArray>)toJsonWithId:(id)values;

- (ComGoodowRealtimeOperationListSimpleDeleteComponent *)createWithInt:(jint)startIndex
                                                               withInt:(jint)length;

- (ComGoodowRealtimeOperationListSimpleDeleteComponent *)createWithInt:(jint)startIndex
                                                                withId:(id)values;

- (id<ComGoodowRealtimeOperationListListHelper>)getHelper;

@end

J2OBJC_EMPTY_STATIC_INIT(ComGoodowRealtimeOperationListSimpleDeleteComponent)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT ComGoodowRealtimeOperationListSimpleDeleteComponent *ComGoodowRealtimeOperationListSimpleDeleteComponent_parseWithComGoodowRealtimeJsonJsonArray_(id<ComGoodowRealtimeJsonJsonArray> serialized);
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(ComGoodowRealtimeOperationListSimpleDeleteComponent)

#endif // _ComGoodowRealtimeOperationListSimpleDeleteComponent_H_
