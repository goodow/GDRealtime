//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#include "IOSClass.h"
#include "com/goodow/realtime/channel/ChannelDemuxer.h"
#include "com/goodow/realtime/channel/constant/Constants.h"
#include "com/goodow/realtime/channel/operation/GenericOperationChannel.h"
#include "com/goodow/realtime/channel/operation/ReceiveOpChannelImpl.h"
#include "com/goodow/realtime/channel/rpc/DeltaService.h"
#include "com/goodow/realtime/channel/rpc/Rpc.h"
#include "com/goodow/realtime/channel/util/ChannelFactory.h"
#include "com/goodow/realtime/channel/util/ChannelNative.h"
#include "com/goodow/realtime/operation/Transformer.h"
#include "com/goodow/realtime/operation/util/Pair.h"
#include "elemental/json/JsonArray.h"
#include "elemental/json/JsonException.h"
#include "elemental/json/JsonObject.h"
#include "elemental/json/JsonValue.h"
#include "elemental/util/Collections.h"
#include "elemental/util/MapFromIntTo.h"
#include "java/lang/Exception.h"
#include "java/lang/Math.h"
#include "java/lang/Runnable.h"
#include "java/lang/RuntimeException.h"
#include "java/lang/Throwable.h"
#include "java/util/logging/Level.h"
#include "java/util/logging/Logger.h"

@implementation ComGoodowRealtimeChannelOperationReceiveOpChannelImpl

static JavaUtilLoggingLogger * ComGoodowRealtimeChannelOperationReceiveOpChannelImpl_log_;

+ (JavaUtilLoggingLogger *)log {
  return ComGoodowRealtimeChannelOperationReceiveOpChannelImpl_log_;
}

- (id)initWithNSString:(NSString *)id_
withComGoodowRealtimeChannelRpcRpc:(id<ComGoodowRealtimeChannelRpcRpc>)rpc
withComGoodowRealtimeOperationTransformer:(id<ComGoodowRealtimeOperationTransformer>)transformer {
  if (self = [super init]) {
    catchupTask_ = [[ComGoodowRealtimeChannelOperationReceiveOpChannelImpl_$1 alloc] initWithComGoodowRealtimeChannelOperationReceiveOpChannelImpl:self];
    callback_ = [[ComGoodowRealtimeChannelOperationReceiveOpChannelImpl_$2 alloc] initWithComGoodowRealtimeChannelOperationReceiveOpChannelImpl:self];
    demuxer_ = [ComGoodowRealtimeChannelChannelDemuxer get];
    pending_ = [ElementalUtilCollections mapFromIntTo];
    currentRevision_ = 0;
    knownHeadRevision_ = 0;
    catchupRevision_ = 0;
    corruptedByException_ = NO;
    receiving_ = NO;
    self->id__ = id_;
    self->transformer_ = transformer;
    self->service_ = [[ComGoodowRealtimeChannelRpcDeltaService alloc] initWithComGoodowRealtimeChannelRpcRpc:rpc];
  }
  return self;
}

- (void)connectWithInt:(int)revision
withComGoodowRealtimeChannelOperationGenericOperationChannel_ReceiveOpChannel_Listener:(id<ComGoodowRealtimeChannelOperationGenericOperationChannel_ReceiveOpChannel_Listener>)listener {
  NSAssert(self->listener_ == nil, @"/Users/retechretech/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/channel/operation/ReceiveOpChannelImpl.java:99 condition failed: assert this.listener == null;");
  self->listener_ = listener;
  self->currentRevision_ = self->knownHeadRevision_ = revision;
  [((JavaUtilLoggingLogger *) nil_chk(ComGoodowRealtimeChannelOperationReceiveOpChannelImpl_log_)) logWithJavaUtilLoggingLevel:[JavaUtilLoggingLevel FINE] withNSString:[NSString stringWithFormat:@"connect, rev=%d", revision]];
}

- (void)disconnect {
  [((ComGoodowRealtimeChannelChannelDemuxer *) nil_chk(demuxer_)) closeWithNSString:id__];
}

- (void)onKnownHeadRevisionWithInt:(int)headVersion {
  [((JavaUtilLoggingLogger *) nil_chk(ComGoodowRealtimeChannelOperationReceiveOpChannelImpl_log_)) logWithJavaUtilLoggingLevel:[JavaUtilLoggingLevel FINE] withNSString:[NSString stringWithFormat:@"onKnownHeadRevision(%d), old known=%d, current=%d", headVersion, knownHeadRevision_, currentRevision_]];
  knownHeadRevision_ = [JavaLangMath maxWithInt:knownHeadRevision_ withInt:headVersion];
  if (knownHeadRevision_ > currentRevision_) {
    [self scheduleCatchup];
  }
  NSAssert(knownHeadRevision_ == currentRevision_ || isCatchupTaskScheduled_, @"/Users/retechretech/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/channel/operation/ReceiveOpChannelImpl.java:121 condition failed: assert knownHeadRevision == currentRevision || isCatchupTaskScheduled;");
}

- (void)onMessageWithInt:(int)resultingRevision
            withNSString:(NSString *)sid
                  withId:(id)mutation {
  [self receiveUnorderedDataWithInt:resultingRevision withNSString:sid withId:mutation];
}

- (void)onMessageWithGDRJsonObject:(id<GDRJsonObject>)msg {
  id<GDRJsonArray> deltas = [((id<GDRJsonObject>) nil_chk(msg)) getArrayWithNSString:[ComGoodowRealtimeChannelConstantConstants_Params DELTAS]];
  for (int i = 0, len = [((id<GDRJsonArray>) nil_chk(deltas)) length]; i < len; i++) {
    id<GDRJsonArray> delta = [deltas getArrayWithInt:i];
    id op;
    NSString *sessionId = [((id<GDRJsonArray>) nil_chk(delta)) getStringWithInt:2];
    @try {
      NSString *userId = [delta getStringWithInt:1];
      op = [((id<ComGoodowRealtimeOperationTransformer>) nil_chk(transformer_)) createOperationWithNSString:userId withNSString:sessionId withGDRJsonValue:[delta getWithInt:3]];
    }
    @catch (GDRJsonException *e) {
      [((id<ComGoodowRealtimeChannelOperationGenericOperationChannel_ReceiveOpChannel_Listener>) nil_chk(listener_)) onErrorWithJavaLangThrowable:e];
      return;
    }
    [self receiveUnorderedDataWithInt:(int) [delta getNumberWithInt:0] withNSString:sessionId withId:op];
  }
  if ([msg hasKeyWithNSString:[ComGoodowRealtimeChannelConstantConstants_Params REVISION]]) {
    [self onKnownHeadRevisionWithInt:(int) [msg getNumberWithNSString:[ComGoodowRealtimeChannelConstantConstants_Params REVISION]]];
  }
  if ([msg hasKeyWithNSString:[ComGoodowRealtimeChannelConstantConstants_Params HAS_MORE]]) {
    [((JavaUtilLoggingLogger *) nil_chk(ComGoodowRealtimeChannelOperationReceiveOpChannelImpl_log_)) logWithJavaUtilLoggingLevel:[JavaUtilLoggingLevel INFO] withNSString:@"fetch history returned incomplete result, retrying for the rest"];
    [((ComGoodowRealtimeChannelRpcDeltaService *) nil_chk(service_)) fetchHistoryWithNSString:id__ withInt:currentRevision_ + 1 withComGoodowRealtimeChannelRpcDeltaService_Callback:callback_];
  }
}

- (int)revision {
  return currentRevision_;
}

- (void)maybeCatchup {
  if (knownHeadRevision_ > currentRevision_ && knownHeadRevision_ > catchupRevision_) {
    [((JavaUtilLoggingLogger *) nil_chk(ComGoodowRealtimeChannelOperationReceiveOpChannelImpl_log_)) logWithJavaUtilLoggingLevel:[JavaUtilLoggingLevel FINE] withNSString:[NSString stringWithFormat:@"Catching up to %d", knownHeadRevision_]];
    catchupRevision_ = knownHeadRevision_;
    [((ComGoodowRealtimeChannelRpcDeltaService *) nil_chk(service_)) fetchHistoryWithNSString:id__ withInt:currentRevision_ + 1 withComGoodowRealtimeChannelRpcDeltaService_Callback:callback_];
  }
  else {
    [((JavaUtilLoggingLogger *) nil_chk(ComGoodowRealtimeChannelOperationReceiveOpChannelImpl_log_)) logWithJavaUtilLoggingLevel:[JavaUtilLoggingLevel FINE] withNSString:@"No need to catchup"];
  }
}

- (void)receiveUnorderedDataWithInt:(int)resultingRevision
                       withNSString:(NSString *)sessionId
                             withId:(id)op {
  NSAssert(!corruptedByException_, @"receiveUnorderedData called while corrupted");
  NSAssert(!receiving_, @"receiveUnorderedData called re-entrantly");
  receiving_ = YES;
  @try {
    [self unguardedReceiveUnorderedDataWithInt:resultingRevision withNSString:sessionId withId:op];
  }
  @catch (JavaLangRuntimeException *e) {
    corruptedByException_ = YES;
    [((JavaUtilLoggingLogger *) nil_chk(ComGoodowRealtimeChannelOperationReceiveOpChannelImpl_log_)) logWithJavaUtilLoggingLevel:[JavaUtilLoggingLevel WARNING] withNSString:@"Op channel is now corrupted" withJavaLangThrowable:e];
    [((id<ComGoodowRealtimeChannelOperationGenericOperationChannel_ReceiveOpChannel_Listener>) nil_chk(listener_)) onErrorWithJavaLangThrowable:e];
    @throw e;
  }
  receiving_ = NO;
}

- (void)scheduleCatchup {
  if (!isCatchupTaskScheduled_) {
    [((JavaUtilLoggingLogger *) nil_chk(ComGoodowRealtimeChannelOperationReceiveOpChannelImpl_log_)) logWithJavaUtilLoggingLevel:[JavaUtilLoggingLevel FINE] withNSString:@"scheduleCatchup()"];
    isCatchupTaskScheduled_ = YES;
    [((id<ComGoodowRealtimeChannelUtilChannelFactory>) nil_chk([ComGoodowRealtimeChannelUtilChannelNative get])) scheduleFixedDelayWithJavaLangRunnable:catchupTask_ withInt:ComGoodowRealtimeChannelOperationReceiveOpChannelImpl_CATCHUP_DELAY_MILLIS];
  }
}

- (void)unguardedReceiveUnorderedDataWithInt:(int)resultingRevision
                                withNSString:(NSString *)sessionId
                                      withId:(id)op {
  knownHeadRevision_ = [JavaLangMath maxWithInt:knownHeadRevision_ withInt:resultingRevision];
  if (resultingRevision <= currentRevision_) {
    [((JavaUtilLoggingLogger *) nil_chk(ComGoodowRealtimeChannelOperationReceiveOpChannelImpl_log_)) logWithJavaUtilLoggingLevel:[JavaUtilLoggingLevel FINE] withNSString:[NSString stringWithFormat:@"Old dup at revision %d, current is now %d", resultingRevision, currentRevision_]];
    return;
  }
  ComGoodowRealtimeOperationUtilPair *existing = [((id<ElementalUtilMapFromIntTo>) nil_chk(pending_)) getWithInt:resultingRevision];
  if (existing != nil) {
    NSAssert(resultingRevision > currentRevision_ + 1, @"should not have pending data");
    if (![((NSString *) nil_chk(existing->first_)) isEqual:sessionId]) {
      [((id<ComGoodowRealtimeChannelOperationGenericOperationChannel_ReceiveOpChannel_Listener>) nil_chk(listener_)) onErrorWithJavaLangThrowable:[[JavaLangException alloc] initWithNSString:[NSString stringWithFormat:@"Duplicates did not match at resultingRevision %d: %@ vs %@", resultingRevision, existing, op]]];
    }
    [((JavaUtilLoggingLogger *) nil_chk(ComGoodowRealtimeChannelOperationReceiveOpChannelImpl_log_)) logWithJavaUtilLoggingLevel:[JavaUtilLoggingLevel FINE] withNSString:[NSString stringWithFormat:@"Dup message: %@", op]];
    return;
  }
  if (resultingRevision > currentRevision_ + 1) {
    [pending_ putWithInt:resultingRevision withId:[ComGoodowRealtimeOperationUtilPair ofWithId:sessionId withId:op]];
    [((JavaUtilLoggingLogger *) nil_chk(ComGoodowRealtimeChannelOperationReceiveOpChannelImpl_log_)) logWithJavaUtilLoggingLevel:[JavaUtilLoggingLevel FINE] withNSString:[NSString stringWithFormat:@"Missed message, currentRevision=%d message revision=%d", currentRevision_, resultingRevision]];
    [self scheduleCatchup];
    return;
  }
  NSAssert(resultingRevision == currentRevision_ + 1, @"other cases should have been caught");
  [((JavaUtilLoggingLogger *) nil_chk(ComGoodowRealtimeChannelOperationReceiveOpChannelImpl_log_)) logWithJavaUtilLoggingLevel:[JavaUtilLoggingLevel FINE] withNSString:[NSString stringWithFormat:@"Ordered op @%d", resultingRevision]];
  while (YES) {
    [((id<ComGoodowRealtimeChannelOperationGenericOperationChannel_ReceiveOpChannel_Listener>) nil_chk(listener_)) onMessageWithInt:currentRevision_ + 1 withNSString:sessionId withId:op];
    currentRevision_++;
    int next = currentRevision_ + 1;
    ComGoodowRealtimeOperationUtilPair *pair = [pending_ getWithInt:next];
    if (pair != nil) {
      sessionId = pair->first_;
      op = pair->second_;
      [pending_ removeWithInt:next];
    }
    else {
      break;
    }
  }
  NSAssert(![pending_ hasKeyWithInt:currentRevision_ + 1], @"/Users/retechretech/dev/workspace/realtime/realtime-channel/src/main/java/com/goodow/realtime/channel/operation/ReceiveOpChannelImpl.java:247 condition failed: assert !pending.hasKey(currentRevision + 1);");
}

+ (void)initialize {
  if (self == [ComGoodowRealtimeChannelOperationReceiveOpChannelImpl class]) {
    ComGoodowRealtimeChannelOperationReceiveOpChannelImpl_log_ = [JavaUtilLoggingLogger getLoggerWithNSString:[[IOSClass classWithClass:[ComGoodowRealtimeChannelOperationReceiveOpChannelImpl class]] getName]];
  }
}

- (void)copyAllFieldsTo:(ComGoodowRealtimeChannelOperationReceiveOpChannelImpl *)other {
  [super copyAllFieldsTo:other];
  other->callback_ = callback_;
  other->catchupRevision_ = catchupRevision_;
  other->catchupTask_ = catchupTask_;
  other->corruptedByException_ = corruptedByException_;
  other->currentRevision_ = currentRevision_;
  other->demuxer_ = demuxer_;
  other->id__ = id__;
  other->isCatchupTaskScheduled_ = isCatchupTaskScheduled_;
  other->knownHeadRevision_ = knownHeadRevision_;
  other->listener_ = listener_;
  other->pending_ = pending_;
  other->receiving_ = receiving_;
  other->service_ = service_;
  other->transformer_ = transformer_;
}

@end
@implementation ComGoodowRealtimeChannelOperationReceiveOpChannelImpl_$1

- (void)run {
  this$0_->isCatchupTaskScheduled_ = NO;
  [this$0_ maybeCatchup];
}

- (id)initWithComGoodowRealtimeChannelOperationReceiveOpChannelImpl:(ComGoodowRealtimeChannelOperationReceiveOpChannelImpl *)outer$ {
  this$0_ = outer$;
  return [super init];
}

@end
@implementation ComGoodowRealtimeChannelOperationReceiveOpChannelImpl_$2

- (void)onConnectionErrorWithJavaLangThrowable:(JavaLangThrowable *)e {
  [((JavaUtilLoggingLogger *) nil_chk([ComGoodowRealtimeChannelOperationReceiveOpChannelImpl log])) logWithJavaUtilLoggingLevel:[JavaUtilLoggingLevel WARNING] withNSString:@"onConnectionError " withJavaLangThrowable:e];
}

- (void)onFatalErrorWithJavaLangThrowable:(JavaLangThrowable *)e {
  [((JavaUtilLoggingLogger *) nil_chk([ComGoodowRealtimeChannelOperationReceiveOpChannelImpl log])) logWithJavaUtilLoggingLevel:[JavaUtilLoggingLevel WARNING] withNSString:@"onFatalError " withJavaLangThrowable:e];
}

- (void)onMessageWithGDRJsonObject:(id<GDRJsonObject>)msg {
  [this$0_ onMessageWithGDRJsonObject:msg];
}

- (id)initWithComGoodowRealtimeChannelOperationReceiveOpChannelImpl:(ComGoodowRealtimeChannelOperationReceiveOpChannelImpl *)outer$ {
  this$0_ = outer$;
  return [super init];
}

@end
