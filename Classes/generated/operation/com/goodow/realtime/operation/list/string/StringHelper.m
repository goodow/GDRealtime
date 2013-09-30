//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#include "com/goodow/realtime/operation/list/string/StringHelper.h"
#include "elemental/json/JsonArray.h"
#include "java/lang/StringBuilder.h"

@implementation ComGoodowRealtimeOperationListStringStringHelper

static ComGoodowRealtimeOperationListStringStringHelper * ComGoodowRealtimeOperationListStringStringHelper_INSTANCE_;

+ (int)TYPE {
  return ComGoodowRealtimeOperationListStringStringHelper_TYPE;
}

+ (ComGoodowRealtimeOperationListStringStringHelper *)INSTANCE {
  return ComGoodowRealtimeOperationListStringStringHelper_INSTANCE_;
}

- (int)lengthWithId:(NSString *)values {
  return [((NSString *) nil_chk(values)) length];
}

- (NSString *)parseValuesWithGDRJsonArray:(id<GDRJsonArray>)serialized {
  NSAssert([((id<GDRJsonArray>) nil_chk(serialized)) getNumberWithInt:0] == ComGoodowRealtimeOperationListStringStringHelper_TYPE && [serialized length] == 2, @"/Users/retechretech/dev/workspace/realtime/realtime-operation/src/main/java/com/goodow/realtime/operation/list/string/StringHelper.java:31 condition failed: assert serialized.getNumber(0) == TYPE && serialized.length() == 2;");
  NSString *string = [serialized getStringWithInt:1];
  NSAssert(![((NSString *) nil_chk(string)) isEmpty], @"/Users/retechretech/dev/workspace/realtime/realtime-operation/src/main/java/com/goodow/realtime/operation/list/string/StringHelper.java:33 condition failed: assert !string.isEmpty();");
  return string;
}

- (NSString *)replaceWithWithId:(NSString *)values
                        withInt:(int)startIndex
                        withInt:(int)length
                         withId:(NSString *)replacement {
  return [NSString stringWithFormat:@"%@%@%@", [((NSString *) nil_chk(values)) substring:0 endIndex:startIndex], (replacement == nil ? @"" : replacement), [values substring:startIndex + length]];
}

- (JavaLangStringBuilder *)serializeWithId:(NSString *)values {
  JavaLangStringBuilder *sb = [[JavaLangStringBuilder alloc] init];
  (void) [sb appendWithChar:'['];
  (void) [((JavaLangStringBuilder *) nil_chk([((JavaLangStringBuilder *) nil_chk([((JavaLangStringBuilder *) nil_chk([sb appendWithInt:ComGoodowRealtimeOperationListStringStringHelper_TYPE])) appendWithNSString:@",\""])) appendWithNSString:values])) appendWithChar:'"'];
  (void) [sb appendWithChar:']'];
  return sb;
}

- (NSString *)subsetWithId:(NSString *)values
                   withInt:(int)startIndex
                   withInt:(int)length {
  return [((NSString *) nil_chk(values)) substring:startIndex endIndex:startIndex + length];
}

- (NSString *)subsetWithId:(NSString *)values
                   withInt:(int)startIndex0
                   withInt:(int)length0
                   withInt:(int)startIndex1
                   withInt:(int)length1 {
  return [self subsetWithId:values withInt:startIndex0 withInt:length0 withId:values withInt:startIndex1 withInt:length1];
}

- (NSString *)subsetWithId:(NSString *)values0
                   withInt:(int)startIndex0
                   withInt:(int)length0
                    withId:(NSString *)values1
                   withInt:(int)startIndex1
                   withInt:(int)length1 {
  return [NSString stringWithFormat:@"%@%@", [self subsetWithId:values0 withInt:startIndex0 withInt:length0], [self subsetWithId:values1 withInt:startIndex1 withInt:length1]];
}

- (id)init {
  return [super init];
}

+ (void)initialize {
  if (self == [ComGoodowRealtimeOperationListStringStringHelper class]) {
    ComGoodowRealtimeOperationListStringStringHelper_INSTANCE_ = [[ComGoodowRealtimeOperationListStringStringHelper alloc] init];
  }
}

@end
