//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/larry/dev/workspace/realtime/realtime-operation/src/main/java/com/goodow/realtime/operation/list/string/StringDeleteComponent.java
//

#include "J2ObjC_source.h"
#include "com/goodow/realtime/json/JsonArray.h"
#include "com/goodow/realtime/operation/impl/AbstractComponent.h"
#include "com/goodow/realtime/operation/list/AbstractDeleteComponent.h"
#include "com/goodow/realtime/operation/list/AbstractListComponent.h"
#include "com/goodow/realtime/operation/list/string/StringDeleteComponent.h"
#include "com/goodow/realtime/operation/list/string/StringHelper.h"
#include "com/goodow/realtime/operation/list/string/StringInsertComponent.h"

@implementation ComGoodowRealtimeOperationListStringStringDeleteComponent

+ (ComGoodowRealtimeOperationListStringStringDeleteComponent *)parseWithComGoodowRealtimeJsonJsonArray:(id<ComGoodowRealtimeJsonJsonArray>)serialized {
  return ComGoodowRealtimeOperationListStringStringDeleteComponent_parseWithComGoodowRealtimeJsonJsonArray_(serialized);
}

- (instancetype)initWithNSString:(NSString *)id_
                         withInt:(jint)startIndex
                         withInt:(jint)length {
  return [super initWithNSString:id_ withInt:startIndex withInt:length];
}

- (instancetype)initWithNSString:(NSString *)id_
                         withInt:(jint)startIndex
                    withNSString:(NSString *)values {
  return [super initWithNSString:id_ withInt:startIndex withId:values];
}

- (ComGoodowRealtimeOperationListStringStringInsertComponent *)invert {
  NSAssert(values_ != nil, @"com/goodow/realtime/operation/list/string/StringDeleteComponent.java:36 condition failed: assert values != null;");
  return [[ComGoodowRealtimeOperationListStringStringInsertComponent alloc] initWithNSString:id__ withInt:startIndex_ withNSString:values_];
}

- (ComGoodowRealtimeOperationListStringStringDeleteComponent *)createWithInt:(jint)startIndex
                                                                     withInt:(jint)length {
  return [[ComGoodowRealtimeOperationListStringStringDeleteComponent alloc] initWithNSString:id__ withInt:startIndex withInt:length];
}

- (ComGoodowRealtimeOperationListStringStringDeleteComponent *)createWithInt:(jint)startIndex
                                                                      withId:(NSString *)values {
  return [[ComGoodowRealtimeOperationListStringStringDeleteComponent alloc] initWithNSString:id__ withInt:startIndex withNSString:values];
}

- (ComGoodowRealtimeOperationListStringStringHelper *)getHelper {
  return ComGoodowRealtimeOperationListStringStringHelper_get_INSTANCE_();
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "parseWithComGoodowRealtimeJsonJsonArray:", "parse", "Lcom.goodow.realtime.operation.list.string.StringDeleteComponent;", 0x9, NULL },
    { "initWithNSString:withInt:withInt:", "StringDeleteComponent", NULL, 0x1, NULL },
    { "initWithNSString:withInt:withNSString:", "StringDeleteComponent", NULL, 0x1, NULL },
    { "invert", NULL, "Lcom.goodow.realtime.operation.list.string.StringInsertComponent;", 0x1, NULL },
    { "createWithInt:withInt:", "create", "Lcom.goodow.realtime.operation.list.string.StringDeleteComponent;", 0x4, NULL },
    { "createWithInt:withNSString:", "create", "Lcom.goodow.realtime.operation.list.string.StringDeleteComponent;", 0x4, NULL },
    { "getHelper", NULL, "Lcom.goodow.realtime.operation.list.string.StringHelper;", 0x4, NULL },
  };
  static const char *superclass_type_args[] = {"Ljava.lang.String;"};
  static const J2ObjcClassInfo _ComGoodowRealtimeOperationListStringStringDeleteComponent = { 1, "StringDeleteComponent", "com.goodow.realtime.operation.list.string", NULL, 0x1, 7, methods, 0, NULL, 1, superclass_type_args};
  return &_ComGoodowRealtimeOperationListStringStringDeleteComponent;
}

@end

ComGoodowRealtimeOperationListStringStringDeleteComponent *ComGoodowRealtimeOperationListStringStringDeleteComponent_parseWithComGoodowRealtimeJsonJsonArray_(id<ComGoodowRealtimeJsonJsonArray> serialized) {
  ComGoodowRealtimeOperationListStringStringDeleteComponent_init();
  NSCAssert([((id<ComGoodowRealtimeJsonJsonArray>) nil_chk(serialized)) getNumberWithInt:0] == ComGoodowRealtimeOperationListAbstractDeleteComponent_TYPE && [serialized length] == 4, @"com/goodow/realtime/operation/list/string/StringDeleteComponent.java:21 condition failed: assert serialized.getNumber(0) == TYPE && serialized.length() == 4;");
  return [[ComGoodowRealtimeOperationListStringStringDeleteComponent alloc] initWithNSString:ComGoodowRealtimeOperationImplAbstractComponent_parseIdWithComGoodowRealtimeJsonJsonArray_(serialized) withInt:ComGoodowRealtimeOperationListAbstractListComponent_parseStartIndexWithComGoodowRealtimeJsonJsonArray_(serialized) withInt:J2ObjCFpToInt([serialized getNumberWithInt:3])];
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ComGoodowRealtimeOperationListStringStringDeleteComponent)
