//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#include "IOSClass.h"
#include "com/goodow/realtime/channel/rpc/Rpc.h"
#include "java/lang/IllegalArgumentException.h"
#include "java/lang/Throwable.h"
#include "java/util/Map.h"


static ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum *ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum_CONNECTED;
static ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum *ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum_OFFLINE;
static ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum *ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum_LOGGED_OUT;
static ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum *ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum_SOFT_RELOAD;
static ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum *ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum_HARD_RELOAD;
IOSObjectArray *ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum_values;

@implementation ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum

+ (ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum *)CONNECTED {
  return ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum_CONNECTED;
}
+ (ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum *)OFFLINE {
  return ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum_OFFLINE;
}
+ (ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum *)LOGGED_OUT {
  return ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum_LOGGED_OUT;
}
+ (ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum *)SOFT_RELOAD {
  return ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum_SOFT_RELOAD;
}
+ (ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum *)HARD_RELOAD {
  return ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum_HARD_RELOAD;
}

- (id)copyWithZone:(NSZone *)zone {
  return self;
}

- (BOOL)canTransitionToWithComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum:(ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum *)newState {
  NSAssert(newState != nil, @"Null newState");
  BOOL onlyMonotonic = [self ordinal] >= [((ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum *) nil_chk(ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum_SOFT_RELOAD)) ordinal];
  return !onlyMonotonic || [((ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum *) nil_chk(newState)) ordinal] > [self ordinal];
}

- (id)initWithNSString:(NSString *)__name withInt:(int)__ordinal {
  return [super initWithNSString:__name withInt:__ordinal];
}

+ (void)initialize {
  if (self == [ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum class]) {
    ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum_CONNECTED = [[ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum alloc] initWithNSString:@"CONNECTED" withInt:0];
    ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum_OFFLINE = [[ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum alloc] initWithNSString:@"OFFLINE" withInt:1];
    ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum_LOGGED_OUT = [[ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum alloc] initWithNSString:@"LOGGED_OUT" withInt:2];
    ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum_SOFT_RELOAD = [[ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum alloc] initWithNSString:@"SOFT_RELOAD" withInt:3];
    ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum_HARD_RELOAD = [[ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum alloc] initWithNSString:@"HARD_RELOAD" withInt:4];
    ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum_values = [[IOSObjectArray alloc] initWithObjects:(id[]){ ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum_CONNECTED, ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum_OFFLINE, ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum_LOGGED_OUT, ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum_SOFT_RELOAD, ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum_HARD_RELOAD, nil } count:5 type:[IOSClass classWithClass:[ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum class]]];
  }
}

+ (IOSObjectArray *)values {
  return [IOSObjectArray arrayWithArray:ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum_values];
}

+ (ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum *)valueOfWithNSString:(NSString *)name {
  for (int i = 0; i < [ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum_values count]; i++) {
    ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum *e = ComGoodowRealtimeChannelRpcRpc_ConnectionStateEnum_values->buffer_[i];
    if ([name isEqual:[e name]]) {
      return e;
    }
  }
  @throw [[JavaLangIllegalArgumentException alloc] initWithNSString:name];
  return nil;
}

@end

static ComGoodowRealtimeChannelRpcRpc_MethodEnum *ComGoodowRealtimeChannelRpcRpc_MethodEnum_GET;
static ComGoodowRealtimeChannelRpcRpc_MethodEnum *ComGoodowRealtimeChannelRpcRpc_MethodEnum_POST;
IOSObjectArray *ComGoodowRealtimeChannelRpcRpc_MethodEnum_values;

@implementation ComGoodowRealtimeChannelRpcRpc_MethodEnum

+ (ComGoodowRealtimeChannelRpcRpc_MethodEnum *)GET {
  return ComGoodowRealtimeChannelRpcRpc_MethodEnum_GET;
}
+ (ComGoodowRealtimeChannelRpcRpc_MethodEnum *)POST {
  return ComGoodowRealtimeChannelRpcRpc_MethodEnum_POST;
}

- (id)copyWithZone:(NSZone *)zone {
  return self;
}

- (id)initWithNSString:(NSString *)__name withInt:(int)__ordinal {
  return [super initWithNSString:__name withInt:__ordinal];
}

+ (void)initialize {
  if (self == [ComGoodowRealtimeChannelRpcRpc_MethodEnum class]) {
    ComGoodowRealtimeChannelRpcRpc_MethodEnum_GET = [[ComGoodowRealtimeChannelRpcRpc_MethodEnum alloc] initWithNSString:@"GET" withInt:0];
    ComGoodowRealtimeChannelRpcRpc_MethodEnum_POST = [[ComGoodowRealtimeChannelRpcRpc_MethodEnum alloc] initWithNSString:@"POST" withInt:1];
    ComGoodowRealtimeChannelRpcRpc_MethodEnum_values = [[IOSObjectArray alloc] initWithObjects:(id[]){ ComGoodowRealtimeChannelRpcRpc_MethodEnum_GET, ComGoodowRealtimeChannelRpcRpc_MethodEnum_POST, nil } count:2 type:[IOSClass classWithClass:[ComGoodowRealtimeChannelRpcRpc_MethodEnum class]]];
  }
}

+ (IOSObjectArray *)values {
  return [IOSObjectArray arrayWithArray:ComGoodowRealtimeChannelRpcRpc_MethodEnum_values];
}

+ (ComGoodowRealtimeChannelRpcRpc_MethodEnum *)valueOfWithNSString:(NSString *)name {
  for (int i = 0; i < [ComGoodowRealtimeChannelRpcRpc_MethodEnum_values count]; i++) {
    ComGoodowRealtimeChannelRpcRpc_MethodEnum *e = ComGoodowRealtimeChannelRpcRpc_MethodEnum_values->buffer_[i];
    if ([name isEqual:[e name]]) {
      return e;
    }
  }
  @throw [[JavaLangIllegalArgumentException alloc] initWithNSString:name];
  return nil;
}

@end
