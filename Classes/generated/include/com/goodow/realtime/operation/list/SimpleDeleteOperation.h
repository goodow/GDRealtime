//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#ifndef _ComGoodowRealtimeOperationListSimpleDeleteOperation_H_
#define _ComGoodowRealtimeOperationListSimpleDeleteOperation_H_

@class JavaLangStringBuilder;
@protocol GDJsonArray;

#import "JreEmulation.h"
#include "com/goodow/realtime/operation/list/AbstractDeleteOperation.h"
#include "com/goodow/realtime/operation/list/ListHelper.h"

@interface ComGoodowRealtimeOperationListSimpleDeleteOperation : ComGoodowRealtimeOperationListAbstractDeleteOperation < ComGoodowRealtimeOperationListListHelper > {
 @public
  id<ComGoodowRealtimeOperationListListHelper> delegate_;
}

+ (ComGoodowRealtimeOperationListSimpleDeleteOperation *)parseWithGDJsonArray:(id<GDJsonArray>)serialized;
- (id)initWithNSString:(NSString *)id_
               withInt:(int)startIndex
               withInt:(int)length;
- (id)initWithNSString:(NSString *)id_
               withInt:(int)startIndex
                withId:(id)values;
- (ComGoodowRealtimeOperationListSimpleDeleteOperation *)invert;
- (int)lengthWithId:(id)values;
- (id)parseValuesWithGDJsonArray:(id<GDJsonArray>)serialized;
- (id)replaceWithWithId:(id)values
                withInt:(int)startIndex
                withInt:(int)length
                 withId:(id)replacement;
- (JavaLangStringBuilder *)serializeWithId:(id)values;
- (id)subsetWithId:(id)values
           withInt:(int)startIndex
           withInt:(int)length;
- (id)subsetWithId:(id)values
           withInt:(int)startIndex0
           withInt:(int)length0
           withInt:(int)startIndex1
           withInt:(int)length1;
- (id)subsetWithId:(id)values0
           withInt:(int)startIndex0
           withInt:(int)length0
            withId:(id)values1
           withInt:(int)startIndex1
           withInt:(int)length1;
- (ComGoodowRealtimeOperationListSimpleDeleteOperation *)createWithInt:(int)startIndex
                                                               withInt:(int)length;
- (ComGoodowRealtimeOperationListSimpleDeleteOperation *)createWithInt:(int)startIndex
                                                                withId:(id)values;
- (id<ComGoodowRealtimeOperationListListHelper>)getHelper;
- (id<ComGoodowRealtimeOperationListListHelper>)getDelegateWithId:(id)values;
- (void)copyAllFieldsTo:(ComGoodowRealtimeOperationListSimpleDeleteOperation *)other;
@end

J2OBJC_FIELD_SETTER(ComGoodowRealtimeOperationListSimpleDeleteOperation, delegate_, id<ComGoodowRealtimeOperationListListHelper>)

#endif // _ComGoodowRealtimeOperationListSimpleDeleteOperation_H_
