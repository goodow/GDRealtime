//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/larry/dev/workspace/realtime/realtime-operation/src/main/java/com/goodow/realtime/operation/Transformer.java
//

#include "J2ObjC_source.h"
#include "com/goodow/realtime/json/JsonArray.h"
#include "com/goodow/realtime/json/JsonObject.h"
#include "com/goodow/realtime/operation/Operation.h"
#include "com/goodow/realtime/operation/Transformer.h"
#include "com/goodow/realtime/operation/util/Pair.h"

@interface ComGoodowRealtimeOperationTransformer : NSObject
@end

@implementation ComGoodowRealtimeOperationTransformer

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "composeWithComGoodowRealtimeJsonJsonArray:", "compose", "TO;", 0x401, NULL },
    { "createOperationWithComGoodowRealtimeJsonJsonObject:", "createOperation", "TO;", 0x401, NULL },
    { "transformWithComGoodowRealtimeOperationOperation:withComGoodowRealtimeOperationOperation:", "transform", "Lcom.goodow.realtime.operation.util.Pair;", 0x401, NULL },
  };
  static const J2ObjcClassInfo _ComGoodowRealtimeOperationTransformer = { 1, "Transformer", "com.goodow.realtime.operation", NULL, 0x201, 3, methods, 0, NULL, 0, NULL};
  return &_ComGoodowRealtimeOperationTransformer;
}

@end

J2OBJC_INTERFACE_TYPE_LITERAL_SOURCE(ComGoodowRealtimeOperationTransformer)
