//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#include "IOSClass.h"
#include "com/goodow/realtime/channel/ChannelDemuxer.h"
#include "com/goodow/realtime/channel/PollChannel.h"
#include "com/goodow/realtime/channel/rpc/PollService.h"
#include "com/goodow/realtime/channel/util/ChannelFactory.h"
#include "com/goodow/realtime/channel/util/ChannelNative.h"
#include "elemental/json/Json.h"
#include "elemental/json/JsonArray.h"
#include "elemental/util/ArrayOfString.h"
#include "java/lang/Runnable.h"
#include "java/util/logging/Logger.h"

@implementation ComGoodowRealtimeChannelPollChannel

static JavaUtilLoggingLogger * ComGoodowRealtimeChannelPollChannel_log_;
static ComGoodowRealtimeChannelPollChannel * ComGoodowRealtimeChannelPollChannel_INSTANCE_;

+ (JavaUtilLoggingLogger *)log {
  return ComGoodowRealtimeChannelPollChannel_log_;
}

+ (ComGoodowRealtimeChannelPollChannel *)INSTANCE {
  return ComGoodowRealtimeChannelPollChannel_INSTANCE_;
}

+ (ComGoodowRealtimeChannelPollChannel *)get {
  return ComGoodowRealtimeChannelPollChannel_INSTANCE_;
}

- (id)init {
  if (self = [super init]) {
    demuxer_ = [ComGoodowRealtimeChannelChannelDemuxer get];
    isHeartbeatTaskCanceled_ = YES;
    heartbeatTask_ = [[ComGoodowRealtimeChannelPollChannel_$1 alloc] initWithComGoodowRealtimeChannelPollChannel:self];
    self->service_ = [[ComGoodowRealtimeChannelRpcPollService alloc] init];
  }
  return self;
}

- (void)close {
  isHeartbeatTaskCanceled_ = YES;
}

- (void)connect {
  if (!isHeartbeatTaskCanceled_) {
    return;
  }
  isHeartbeatTaskCanceled_ = NO;
  [((id<JavaLangRunnable>) nil_chk(heartbeatTask_)) run];
}

- (void)runImpl {
  id<ElementalUtilArrayOfString> ids = [((ComGoodowRealtimeChannelChannelDemuxer *) nil_chk(demuxer_)) getIds];
  id<GDRJsonArray> array = [GDRJson createArray];
  if ([((id<ElementalUtilArrayOfString>) nil_chk(ids)) length] != 0) {
    for (int i = 0, len = [ids length]; i < len; i++) {
      id<GDRJsonArray> req = [GDRJson createArray];
      NSString *id_ = [ids getWithInt:i];
      [((id<GDRJsonArray>) nil_chk(req)) setWithInt:0 withNSString:id_];
      [req setWithInt:1 withDouble:[demuxer_ getRevisionWithNSString:id_] + 1];
      [((id<GDRJsonArray>) nil_chk(array)) setWithInt:i withGDRJsonValue:req];
    }
  }
  [((ComGoodowRealtimeChannelRpcPollService *) nil_chk(service_)) pollWithGDRJsonArray:array withNSString:[ComGoodowRealtimeChannelChannelDemuxer getSessionId]];
}

+ (void)initialize {
  if (self == [ComGoodowRealtimeChannelPollChannel class]) {
    ComGoodowRealtimeChannelPollChannel_log_ = [JavaUtilLoggingLogger getLoggerWithNSString:[[IOSClass classWithClass:[ComGoodowRealtimeChannelPollChannel class]] getName]];
    ComGoodowRealtimeChannelPollChannel_INSTANCE_ = [[ComGoodowRealtimeChannelPollChannel alloc] init];
  }
}

- (void)copyAllFieldsTo:(ComGoodowRealtimeChannelPollChannel *)other {
  [super copyAllFieldsTo:other];
  other->demuxer_ = demuxer_;
  other->heartbeatTask_ = heartbeatTask_;
  other->isHeartbeatTaskCanceled_ = isHeartbeatTaskCanceled_;
  other->service_ = service_;
}

@end
@implementation ComGoodowRealtimeChannelPollChannel_$1

- (void)run {
  if (this$0_->isHeartbeatTaskCanceled_) {
    return;
  }
  [this$0_ runImpl];
  [((id<ComGoodowRealtimeChannelUtilChannelFactory>) nil_chk([ComGoodowRealtimeChannelUtilChannelNative get])) scheduleFixedDelayWithJavaLangRunnable:this$0_->heartbeatTask_ withInt:ComGoodowRealtimeChannelPollChannel_HEARTBEAT_INTERVAL_MILLIS];
}

- (id)initWithComGoodowRealtimeChannelPollChannel:(ComGoodowRealtimeChannelPollChannel *)outer$ {
  this$0_ = outer$;
  return [super init];
}

@end
