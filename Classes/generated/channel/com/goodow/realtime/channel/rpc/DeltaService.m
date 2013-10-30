//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#include "IOSClass.h"
#include "com/goodow/realtime/channel/ChannelDemuxer.h"
#include "com/goodow/realtime/channel/constant/Constants.h"
#include "com/goodow/realtime/channel/rpc/DeltaService.h"
#include "com/goodow/realtime/channel/rpc/Rpc.h"
#include "com/goodow/realtime/channel/rpc/RpcUtil.h"
#include "elemental/json/JsonArray.h"
#include "elemental/json/JsonObject.h"
#include "java/lang/Throwable.h"
#include "java/util/HashMap.h"
#include "java/util/Map.h"
#include "java/util/logging/Logger.h"

@implementation ComGoodowRealtimeChannelRpcDeltaService

static JavaUtilLoggingLogger * ComGoodowRealtimeChannelRpcDeltaService_log_;

+ (JavaUtilLoggingLogger *)log {
  return ComGoodowRealtimeChannelRpcDeltaService_log_;
}

- (id)initWithComGoodowRealtimeChannelRpcRpc:(id<ComGoodowRealtimeChannelRpcRpc>)rpc {
  if (self = [super init]) {
    self->rpc_ = rpc;
  }
  return self;
}

- (void)fetchHistoryWithNSString:(NSString *)key
                         withInt:(int)startRev
withComGoodowRealtimeChannelRpcDeltaService_Callback:(id<ComGoodowRealtimeChannelRpcDeltaService_Callback>)callback {
  id<JavaUtilMap> params = [[JavaUtilHashMap alloc] init];
  (void) [params putWithId:[ComGoodowRealtimeChannelConstantConstants_Params ID] withId:key];
  (void) [params putWithId:[ComGoodowRealtimeChannelConstantConstants_Params ACCESS_TOKEN] withId:[((ComGoodowRealtimeChannelChannelDemuxer *) nil_chk([ComGoodowRealtimeChannelChannelDemuxer get])) getAccessToken]];
  (void) [params putWithId:[ComGoodowRealtimeChannelConstantConstants_Params START_REVISION] withId:[NSString stringWithFormat:@"%d", startRev]];
  (void) [((id<ComGoodowRealtimeChannelRpcRpc>) nil_chk(rpc_)) getWithNSString:[ComGoodowRealtimeChannelConstantConstants_Services DELTA] withJavaUtilMap:params withComGoodowRealtimeChannelRpcRpc_RpcCallback:[[ComGoodowRealtimeChannelRpcDeltaService_$1 alloc] initWithComGoodowRealtimeChannelRpcDeltaService_Callback:callback]];
}

+ (void)initialize {
  if (self == [ComGoodowRealtimeChannelRpcDeltaService class]) {
    ComGoodowRealtimeChannelRpcDeltaService_log_ = [JavaUtilLoggingLogger getLoggerWithNSString:[[IOSClass classWithClass:[ComGoodowRealtimeChannelRpcDeltaService class]] getName]];
  }
}

- (void)copyAllFieldsTo:(ComGoodowRealtimeChannelRpcDeltaService *)other {
  [super copyAllFieldsTo:other];
  other->rpc_ = rpc_;
}

@end
@implementation ComGoodowRealtimeChannelRpcDeltaService_$1

- (void)onConnectionErrorWithJavaLangThrowable:(JavaLangThrowable *)e {
  [((id<ComGoodowRealtimeChannelRpcDeltaService_Callback>) nil_chk(val$callback_)) onConnectionErrorWithJavaLangThrowable:e];
}

- (void)onFatalErrorWithJavaLangThrowable:(JavaLangThrowable *)e {
  [((id<ComGoodowRealtimeChannelRpcDeltaService_Callback>) nil_chk(val$callback_)) onFatalErrorWithJavaLangThrowable:e];
}

- (void)onSuccessWithNSString:(NSString *)data {
  id<GDJsonObject> msg = [ComGoodowRealtimeChannelRpcRpcUtil evalPrefixedWithNSString:data];
  NSAssert([((id<GDJsonArray>) nil_chk([((id<GDJsonObject>) nil_chk(msg)) getArray:[ComGoodowRealtimeChannelConstantConstants_Params DELTAS]])) length] > 0, @"/Users/retechretech/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/channel/rpc/DeltaService.java:64 condition failed: assert msg.getArray(Params.DELTAS).length() > 0;");
  [((id<ComGoodowRealtimeChannelRpcDeltaService_Callback>) nil_chk(val$callback_)) onMessageWithGDJsonObject:msg];
}

- (id)initWithComGoodowRealtimeChannelRpcDeltaService_Callback:(id<ComGoodowRealtimeChannelRpcDeltaService_Callback>)capture$0 {
  val$callback_ = capture$0;
  return [super init];
}

@end
