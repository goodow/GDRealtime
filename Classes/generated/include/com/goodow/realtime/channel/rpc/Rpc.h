//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#ifndef _ComGoodowRealtimeChannelRpcRpc_H_
#define _ComGoodowRealtimeChannelRpcRpc_H_

@class ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum;
@class JavaLangThrowable;
@protocol ComGoodowRealtimeChannelRpcRpc_RpcCallback;
@protocol ComGoodowRealtimeChannelRpcRpc_RpcHandle;
@protocol JavaUtilMap;

#import "JreEmulation.h"
#include "java/lang/Enum.h"

@protocol ComGoodowRealtimeChannelRpcRpc < NSObject, JavaObject >
- (id<ComGoodowRealtimeChannelRpcRpc_RpcHandle>)getWithNSString:(NSString *)serviceName
                                                withJavaUtilMap:(id<JavaUtilMap>)params
                 withComGoodowRealtimeChannelRpcRpc_RpcCallback:(id<ComGoodowRealtimeChannelRpcRpc_RpcCallback>)rpcCallback;
- (void)maybeSetConnectionStateWithComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum:(ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum *)state;
- (id<ComGoodowRealtimeChannelRpcRpc_RpcHandle>)postWithNSString:(NSString *)serviceName
                                                 withJavaUtilMap:(id<JavaUtilMap>)params
                                                    withNSString:(NSString *)formData
                  withComGoodowRealtimeChannelRpcRpc_RpcCallback:(id<ComGoodowRealtimeChannelRpcRpc_RpcCallback>)rpcCallback;
@end

typedef enum {
  ComGoodowRealtimeChannelRpcRpc_ConnectionState_CONNECTED = 0,
  ComGoodowRealtimeChannelRpcRpc_ConnectionState_OFFLINE = 1,
  ComGoodowRealtimeChannelRpcRpc_ConnectionState_LOGGED_OUT = 2,
  ComGoodowRealtimeChannelRpcRpc_ConnectionState_SOFT_RELOAD = 3,
  ComGoodowRealtimeChannelRpcRpc_ConnectionState_HARD_RELOAD = 4,
} ComGoodowRealtimeChannelRpcRpc_ConnectionState;

@interface ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum : JavaLangEnum < NSCopying > {
}
+ (ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum *)CONNECTED;
+ (ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum *)OFFLINE;
+ (ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum *)LOGGED_OUT;
+ (ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum *)SOFT_RELOAD;
+ (ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum *)HARD_RELOAD;
+ (IOSObjectArray *)values;
+ (ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum *)valueOfWithNSString:(NSString *)name;
- (id)copyWithZone:(NSZone *)zone;
- (BOOL)canTransitionToWithComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum:(ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum *)newState;
- (id)initWithNSString:(NSString *)__name withInt:(int)__ordinal;
@end

@protocol ComGoodowRealtimeChannelRpcRpc_ConnectionStateListener < NSObject, JavaObject >
- (void)connectionStateChangedWithComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum:(ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum *)newConnectionState;
@end

typedef enum {
  ComGoodowRealtimeChannelRpcRpc_Method_GET = 0,
  ComGoodowRealtimeChannelRpcRpc_Method_POST = 1,
} ComGoodowRealtimeChannelRpcRpc_Method;

@interface ComGoodowRealtimeChannelRpcRpc_MethodEnum : JavaLangEnum < NSCopying > {
}
+ (ComGoodowRealtimeChannelRpcRpc_MethodEnum *)GET;
+ (ComGoodowRealtimeChannelRpcRpc_MethodEnum *)POST;
+ (IOSObjectArray *)values;
+ (ComGoodowRealtimeChannelRpcRpc_MethodEnum *)valueOfWithNSString:(NSString *)name;
- (id)copyWithZone:(NSZone *)zone;
- (id)initWithNSString:(NSString *)__name withInt:(int)__ordinal;
@end

@protocol ComGoodowRealtimeChannelRpcRpc_RpcCallback < NSObject, JavaObject >
- (void)onConnectionErrorWithJavaLangThrowable:(JavaLangThrowable *)e;
- (void)onFatalErrorWithJavaLangThrowable:(JavaLangThrowable *)e;
- (void)onSuccessWithNSString:(NSString *)data;
@end

@protocol ComGoodowRealtimeChannelRpcRpc_RpcHandle < NSObject, JavaObject >
- (void)drop;
- (BOOL)isPending;
@end

#endif // _ComGoodowRealtimeChannelRpcRpc_H_
