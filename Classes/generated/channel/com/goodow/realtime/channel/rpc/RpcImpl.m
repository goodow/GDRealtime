//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#include "IOSClass.h"
#include "com/goodow/realtime/channel/http/HttpRequest.h"
#include "com/goodow/realtime/channel/http/HttpResponse.h"
#include "com/goodow/realtime/channel/http/HttpTransport.h"
#include "com/goodow/realtime/channel/rpc/Rpc.h"
#include "com/goodow/realtime/channel/rpc/RpcImpl.h"
#include "com/goodow/realtime/channel/util/ChannelFactory.h"
#include "com/goodow/realtime/channel/util/ChannelNative.h"
#include "elemental/json/JsonException.h"
#include "elemental/util/ArrayOfInt.h"
#include "elemental/util/ArrayOfString.h"
#include "elemental/util/Collections.h"
#include "elemental/util/MapFromIntTo.h"
#include "elemental/util/MapFromStringToString.h"
#include "java/lang/AssertionError.h"
#include "java/lang/Exception.h"
#include "java/lang/IllegalArgumentException.h"
#include "java/lang/StringBuilder.h"
#include "java/lang/Throwable.h"
#include "java/util/logging/Level.h"
#include "java/util/logging/Logger.h"

@implementation ComGoodowRealtimeChannelRpcRpcImpl

static JavaUtilLoggingLogger * ComGoodowRealtimeChannelRpcRpcImpl_log_;
static int ComGoodowRealtimeChannelRpcRpcImpl_nextRequestId_;
static id<ElementalUtilMapFromIntTo> ComGoodowRealtimeChannelRpcRpcImpl_handles_;

+ (JavaUtilLoggingLogger *)log {
  return ComGoodowRealtimeChannelRpcRpcImpl_log_;
}

+ (int)nextRequestId {
  return ComGoodowRealtimeChannelRpcRpcImpl_nextRequestId_;
}

+ (int *)nextRequestIdRef {
  return &ComGoodowRealtimeChannelRpcRpcImpl_nextRequestId_;
}

+ (id<ElementalUtilMapFromIntTo>)handles {
  return ComGoodowRealtimeChannelRpcRpcImpl_handles_;
}

+ (void)setHandles:(id<ElementalUtilMapFromIntTo>)handles {
  ComGoodowRealtimeChannelRpcRpcImpl_handles_ = handles;
}

+ (void)dropRequestWithComGoodowRealtimeChannelRpcRpcImpl_Handle:(ComGoodowRealtimeChannelRpcRpcImpl_Handle *)handle {
  [((id<ElementalUtilMapFromIntTo>) nil_chk(ComGoodowRealtimeChannelRpcRpcImpl_handles_)) removeWithInt:[((ComGoodowRealtimeChannelRpcRpcImpl_Handle *) nil_chk(handle)) getId]];
}

+ (void)dropAll {
  id<ElementalUtilArrayOfInt> keys = [((id<ElementalUtilMapFromIntTo>) nil_chk(ComGoodowRealtimeChannelRpcRpcImpl_handles_)) keys];
  for (int i = 0, len = [((id<ElementalUtilArrayOfInt>) nil_chk(keys)) length]; i < len; i++) {
    [ComGoodowRealtimeChannelRpcRpcImpl_handles_ removeWithInt:[keys getWithInt:i]];
  }
}

- (id)initWithNSString:(NSString *)rpcRoot
withComGoodowRealtimeChannelRpcRpc_ConnectionStateListener:(id<ComGoodowRealtimeChannelRpcRpc_ConnectionStateListener>)listener {
  if (self = [super init]) {
    connectionState_ = [ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum CONNECTED];
    consecutiveFailures_ = 0;
    self->rpcRoot_ = rpcRoot;
    self->listener_ = listener;
  }
  return self;
}

- (id<ComGoodowRealtimeChannelRpcRpc_RpcHandle>)getWithNSString:(NSString *)serviceName
                         withElementalUtilMapFromStringToString:(id<ElementalUtilMapFromStringToString>)params
                 withComGoodowRealtimeChannelRpcRpc_RpcCallback:(id<ComGoodowRealtimeChannelRpcRpc_RpcCallback>)rpcCallback {
  return [self makeRequestWithComGoodowRealtimeChannelRpcRpc_MethodEnum:[ComGoodowRealtimeChannelRpcRpc_MethodEnum GET] withNSString:serviceName withElementalUtilMapFromStringToString:params withNSString:nil withComGoodowRealtimeChannelRpcRpc_RpcCallback:rpcCallback];
}

- (void)maybeSetConnectionStateWithComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum:(ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum *)newState {
  if (newState != connectionState_ && [((ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum *) nil_chk(connectionState_)) canTransitionToWithComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum:newState]) {
    connectionState_ = newState;
    if (listener_ != nil) {
      [listener_ connectionStateChangedWithComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum:connectionState_];
    }
  }
}

- (id<ComGoodowRealtimeChannelRpcRpc_RpcHandle>)postWithNSString:(NSString *)serviceName
                          withElementalUtilMapFromStringToString:(id<ElementalUtilMapFromStringToString>)params
                                                    withNSString:(NSString *)formData
                  withComGoodowRealtimeChannelRpcRpc_RpcCallback:(id<ComGoodowRealtimeChannelRpcRpc_RpcCallback>)rpcCallback {
  return [self makeRequestWithComGoodowRealtimeChannelRpcRpc_MethodEnum:[ComGoodowRealtimeChannelRpcRpc_MethodEnum POST] withNSString:serviceName withElementalUtilMapFromStringToString:params withNSString:formData withComGoodowRealtimeChannelRpcRpc_RpcCallback:rpcCallback];
}

- (JavaLangStringBuilder *)addParamsWithJavaLangStringBuilder:(JavaLangStringBuilder *)b
                       withElementalUtilMapFromStringToString:(id<ElementalUtilMapFromStringToString>)params {
  id<ElementalUtilArrayOfString> keys = [((id<ElementalUtilMapFromStringToString>) nil_chk(params)) keys];
  for (int i = 0, len = [((id<ElementalUtilArrayOfString>) nil_chk(keys)) length]; i < len; i++) {
    NSString *key = [keys getWithInt:i];
    NSString *value = [params getWithNSString:key];
    if (value != nil) {
      (void) [((JavaLangStringBuilder *) nil_chk(b)) appendWithNSString:[NSString stringWithFormat:@"%@=%@&", key, [((id<ComGoodowRealtimeChannelUtilChannelFactory>) nil_chk([ComGoodowRealtimeChannelUtilChannelNative get])) escapeUriQueryWithNSString:value]]];
    }
  }
  return b;
}

- (id<ComGoodowRealtimeChannelRpcRpc_RpcHandle>)makeRequestWithComGoodowRealtimeChannelRpcRpc_MethodEnum:(ComGoodowRealtimeChannelRpcRpc_MethodEnum *)method
                                                                                            withNSString:(NSString *)serviceName
                                                                  withElementalUtilMapFromStringToString:(id<ElementalUtilMapFromStringToString>)params
                                                                                            withNSString:(NSString *)requestData
                                                          withComGoodowRealtimeChannelRpcRpc_RpcCallback:(id<ComGoodowRealtimeChannelRpcRpc_RpcCallback>)rpcCallback {
  int requestId = ComGoodowRealtimeChannelRpcRpcImpl_nextRequestId_;
  ComGoodowRealtimeChannelRpcRpcImpl_nextRequestId_++;
  if (connectionState_ == [ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum HARD_RELOAD]) {
    return [[ComGoodowRealtimeChannelRpcRpcImpl_Handle alloc] initWithComGoodowRealtimeChannelRpcRpcImpl:self withInt:requestId];
  }
  JavaLangStringBuilder *urlBuilder = [[JavaLangStringBuilder alloc] initWithNSString:[NSString stringWithFormat:@"%@/%@?", rpcRoot_, serviceName]];
  (void) [self addParamsWithJavaLangStringBuilder:urlBuilder withElementalUtilMapFromStringToString:params];
  NSString *url = [urlBuilder description];
  id<ComGoodowRealtimeChannelHttpHttpRequest> r = [((ComGoodowRealtimeChannelHttpHttpTransport *) nil_chk([((id<ComGoodowRealtimeChannelUtilChannelFactory>) nil_chk([ComGoodowRealtimeChannelUtilChannelNative get])) getHttpTransport])) buildRequestWithNSString:[((ComGoodowRealtimeChannelRpcRpc_MethodEnum *) nil_chk(method)) name] withNSString:url];
  ComGoodowRealtimeChannelRpcRpcImpl_makeRequest_RpcRequestCallback *innerCallback = [[ComGoodowRealtimeChannelRpcRpcImpl_makeRequest_RpcRequestCallback alloc] initWithComGoodowRealtimeChannelRpcRpcImpl:self withInt:requestId withComGoodowRealtimeChannelRpcRpc_RpcCallback:rpcCallback withNSString:url];
  ComGoodowRealtimeChannelRpcRpcImpl_Handle *handle = [[ComGoodowRealtimeChannelRpcRpcImpl_Handle alloc] initWithComGoodowRealtimeChannelRpcRpcImpl:self withInt:requestId];
  [((id<ElementalUtilMapFromIntTo>) nil_chk(ComGoodowRealtimeChannelRpcRpcImpl_handles_)) putWithInt:[handle getId] withId:handle];
  [((id<ComGoodowRealtimeChannelHttpHttpRequest>) nil_chk(r)) executeAsyncWithComGoodowRealtimeChannelHttpHttpRequestCallback:innerCallback withNSString:requestData];
  return handle;
}

+ (void)initialize {
  if (self == [ComGoodowRealtimeChannelRpcRpcImpl class]) {
    ComGoodowRealtimeChannelRpcRpcImpl_log_ = [JavaUtilLoggingLogger getLoggerWithNSString:[[IOSClass classWithClass:[ComGoodowRealtimeChannelRpcRpcImpl class]] getName]];
    ComGoodowRealtimeChannelRpcRpcImpl_handles_ = [ElementalUtilCollections mapFromIntTo];
  }
}

- (void)copyAllFieldsTo:(ComGoodowRealtimeChannelRpcRpcImpl *)other {
  [super copyAllFieldsTo:other];
  other->connectionState_ = connectionState_;
  other->consecutiveFailures_ = consecutiveFailures_;
  other->listener_ = listener_;
  other->rpcRoot_ = rpcRoot_;
}

@end
@implementation ComGoodowRealtimeChannelRpcRpcImpl_Handle

- (id)initWithComGoodowRealtimeChannelRpcRpcImpl:(ComGoodowRealtimeChannelRpcRpcImpl *)outer$
                                         withInt:(int)id_ {
  if (self = [super init]) {
    self->id__ = id_;
  }
  return self;
}

- (void)drop {
  [ComGoodowRealtimeChannelRpcRpcImpl dropRequestWithComGoodowRealtimeChannelRpcRpcImpl_Handle:self];
}

- (BOOL)isEqual:(id)other {
  if ([other isKindOfClass:[ComGoodowRealtimeChannelRpcRpcImpl_Handle class]]) {
    return id__ == ((ComGoodowRealtimeChannelRpcRpcImpl_Handle *) nil_chk(other))->id__;
  }
  return NO;
}

- (int)getId {
  return id__;
}

- (NSUInteger)hash {
  return id__ * 43;
}

- (BOOL)isPending {
  return [((id<ElementalUtilMapFromIntTo>) nil_chk([ComGoodowRealtimeChannelRpcRpcImpl handles])) hasKeyWithInt:id__];
}

- (void)copyAllFieldsTo:(ComGoodowRealtimeChannelRpcRpcImpl_Handle *)other {
  [super copyAllFieldsTo:other];
  other->id__ = id__;
}

@end

static ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum *ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum_OK;
static ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum *ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum_PERMANENT_FAILURE;
static ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum *ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum_RETRYABLE_FAILURE;
IOSObjectArray *ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum_values;

@implementation ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum

+ (ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum *)OK {
  return ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum_OK;
}
+ (ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum *)PERMANENT_FAILURE {
  return ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum_PERMANENT_FAILURE;
}
+ (ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum *)RETRYABLE_FAILURE {
  return ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum_RETRYABLE_FAILURE;
}

- (id)copyWithZone:(NSZone *)zone {
  return self;
}

- (id)initWithNSString:(NSString *)__name withInt:(int)__ordinal {
  return [super initWithNSString:__name withInt:__ordinal];
}

+ (void)initialize {
  if (self == [ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum class]) {
    ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum_OK = [[ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum alloc] initWithNSString:@"OK" withInt:0];
    ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum_PERMANENT_FAILURE = [[ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum alloc] initWithNSString:@"PERMANENT_FAILURE" withInt:1];
    ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum_RETRYABLE_FAILURE = [[ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum alloc] initWithNSString:@"RETRYABLE_FAILURE" withInt:2];
    ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum_values = [[IOSObjectArray alloc] initWithObjects:(id[]){ ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum_OK, ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum_PERMANENT_FAILURE, ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum_RETRYABLE_FAILURE, nil } count:3 type:[IOSClass classWithClass:[ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum class]]];
  }
}

+ (IOSObjectArray *)values {
  return [IOSObjectArray arrayWithArray:ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum_values];
}

+ (ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum *)valueOfWithNSString:(NSString *)name {
  for (int i = 0; i < [ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum_values count]; i++) {
    ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum *e = ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum_values->buffer_[i];
    if ([name isEqual:[e name]]) {
      return e;
    }
  }
  @throw [[JavaLangIllegalArgumentException alloc] initWithNSString:name];
  return nil;
}

@end
@implementation ComGoodowRealtimeChannelRpcRpcImpl_makeRequest_RpcRequestCallback

- (id)initWithComGoodowRealtimeChannelRpcRpcImpl:(ComGoodowRealtimeChannelRpcRpcImpl *)outer$
                                         withInt:(int)id_
  withComGoodowRealtimeChannelRpcRpc_RpcCallback:(id<ComGoodowRealtimeChannelRpcRpc_RpcCallback>)callback
                                    withNSString:(NSString *)url_ {
  this$0_ = outer$;
  if (self = [super init]) {
    self->id__ = id_;
    self->callback_ = callback;
    self->url__ = url_;
  }
  return self;
}

- (void)onFailureWithJavaLangThrowable:(JavaLangThrowable *)exception {
  if (![((id<ElementalUtilMapFromIntTo>) nil_chk([ComGoodowRealtimeChannelRpcRpcImpl handles])) hasKeyWithInt:id__]) {
    [((JavaUtilLoggingLogger *) nil_chk([ComGoodowRealtimeChannelRpcRpcImpl log])) logWithJavaUtilLoggingLevel:[JavaUtilLoggingLevel INFO] withNSString:[NSString stringWithFormat:@"RPC FailureDrop, id=%d %@", id__, [((JavaLangThrowable *) nil_chk(exception)) getMessage]]];
    return;
  }
  [self removeHandle];
  [self errorWithJavaLangThrowable:exception];
}

- (void)onResponseWithComGoodowRealtimeChannelHttpHttpResponse:(id<ComGoodowRealtimeChannelHttpHttpResponse>)response {
  id<ComGoodowRealtimeChannelRpcRpc_RpcHandle> handle = [((id<ElementalUtilMapFromIntTo>) nil_chk([ComGoodowRealtimeChannelRpcRpcImpl handles])) getWithInt:id__];
  if (handle == nil) {
    [((JavaUtilLoggingLogger *) nil_chk([ComGoodowRealtimeChannelRpcRpcImpl log])) logWithJavaUtilLoggingLevel:[JavaUtilLoggingLevel INFO] withNSString:[NSString stringWithFormat:@"RPC SuccessDrop, id=%d", id__]];
    return;
  }
  [self removeHandle];
  int statusCode = [((id<ComGoodowRealtimeChannelHttpHttpResponse>) nil_chk(response)) getStatusCode];
  NSString *data = [response getContent];
  ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum *result;
  if (statusCode < 100) {
    result = [ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum RETRYABLE_FAILURE];
    [this$0_ maybeSetConnectionStateWithComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum:[ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum OFFLINE]];
  }
  else if (statusCode == 200) {
    result = [ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum OK];
    [this$0_ maybeSetConnectionStateWithComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum:[ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum CONNECTED]];
    this$0_->consecutiveFailures_ = 0;
  }
  else if (statusCode >= 500) {
    result = [ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum RETRYABLE_FAILURE];
    this$0_->consecutiveFailures_++;
    if (this$0_->consecutiveFailures_ > ComGoodowRealtimeChannelRpcRpcImpl_MAX_CONSECUTIVE_FAILURES) {
      [this$0_ maybeSetConnectionStateWithComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum:[ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum OFFLINE]];
    }
    else {
      [this$0_ maybeSetConnectionStateWithComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum:[ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum CONNECTED]];
    }
  }
  else {
    result = [ComGoodowRealtimeChannelRpcRpcImpl_ResultEnum PERMANENT_FAILURE];
    [this$0_ maybeSetConnectionStateWithComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum:[ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum SOFT_RELOAD]];
  }
  switch ([result ordinal]) {
    case ComGoodowRealtimeChannelRpcRpcImpl_Result_OK:
    @try {
      [((id<ComGoodowRealtimeChannelRpcRpc_RpcCallback>) nil_chk(callback_)) onSuccessWithNSString:data];
    }
    @catch (GDRJsonException *e) {
      [this$0_ maybeSetConnectionStateWithComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum:[ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum LOGGED_OUT]];
      [self errorWithJavaLangThrowable:[[JavaLangException alloc] initWithNSString:[NSString stringWithFormat:@"%@%d, data: %@", @"RPC failed due to message exception, treating as auth failure, status code: ", statusCode, data]]];
    }
    break;
    case ComGoodowRealtimeChannelRpcRpcImpl_Result_RETRYABLE_FAILURE:
    [self errorWithJavaLangThrowable:[[JavaLangException alloc] initWithNSString:[NSString stringWithFormat:@"RPC failed, status code: %d, data: %@", statusCode, data]]];
    break;
    case ComGoodowRealtimeChannelRpcRpcImpl_Result_PERMANENT_FAILURE:
    [self fatalWithJavaLangThrowable:[[JavaLangException alloc] initWithNSString:[NSString stringWithFormat:@"RPC bad request, status code: %d, data: %@", statusCode, data]]];
    break;
    default:
    @throw [[JavaLangAssertionError alloc] initWithId:[NSString stringWithFormat:@"Unknown result %@", result]];
  }
}

- (void)errorWithJavaLangThrowable:(JavaLangThrowable *)e {
  [((JavaUtilLoggingLogger *) nil_chk([ComGoodowRealtimeChannelRpcRpcImpl log])) logWithJavaUtilLoggingLevel:[JavaUtilLoggingLevel WARNING] withNSString:[NSString stringWithFormat:@"RPC Failure, id=%d %@ Request url:%@", id__, [((JavaLangThrowable *) nil_chk(e)) getMessage], url__] withJavaLangThrowable:e];
  [((id<ComGoodowRealtimeChannelRpcRpc_RpcCallback>) nil_chk(callback_)) onConnectionErrorWithJavaLangThrowable:e];
}

- (void)fatalWithJavaLangThrowable:(JavaLangThrowable *)e {
  [((JavaUtilLoggingLogger *) nil_chk([ComGoodowRealtimeChannelRpcRpcImpl log])) logWithJavaUtilLoggingLevel:[JavaUtilLoggingLevel WARNING] withNSString:[NSString stringWithFormat:@"RPC Bad Request, id=%d %@ Request url:%@", id__, [((JavaLangThrowable *) nil_chk(e)) getMessage], url__] withJavaLangThrowable:e];
  [((id<ComGoodowRealtimeChannelRpcRpc_RpcCallback>) nil_chk(callback_)) onFatalErrorWithJavaLangThrowable:e];
}

- (void)removeHandle {
  [((id<ElementalUtilMapFromIntTo>) nil_chk([ComGoodowRealtimeChannelRpcRpcImpl handles])) removeWithInt:id__];
}

- (void)copyAllFieldsTo:(ComGoodowRealtimeChannelRpcRpcImpl_makeRequest_RpcRequestCallback *)other {
  [super copyAllFieldsTo:other];
  other->callback_ = callback_;
  other->id__ = id__;
  other->url__ = url__;
}

@end
