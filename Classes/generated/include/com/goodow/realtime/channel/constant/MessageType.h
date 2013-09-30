//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#ifndef _ComGoodowRealtimeChannelConstantMessageType_H_
#define _ComGoodowRealtimeChannelConstantMessageType_H_

#import "JreEmulation.h"
#include "java/lang/Enum.h"

typedef enum {
  ComGoodowRealtimeChannelConstantMessageType_REALTIME = 0,
  ComGoodowRealtimeChannelConstantMessageType_DOWNLOAD = 1,
} ComGoodowRealtimeChannelConstantMessageType;

@interface ComGoodowRealtimeChannelConstantMessageTypeEnum : JavaLangEnum < NSCopying > {
 @public
  NSString *key__;
}
+ (ComGoodowRealtimeChannelConstantMessageTypeEnum *)REALTIME;
+ (ComGoodowRealtimeChannelConstantMessageTypeEnum *)DOWNLOAD;
+ (IOSObjectArray *)values;
+ (ComGoodowRealtimeChannelConstantMessageTypeEnum *)valueOfWithNSString:(NSString *)name;
- (id)copyWithZone:(NSZone *)zone;
- (id)initWithNSString:(NSString *)key
          withNSString:(NSString *)__name
               withInt:(int)__ordinal;
- (NSString *)key;
@end

J2OBJC_FIELD_SETTER(ComGoodowRealtimeChannelConstantMessageTypeEnum, key__, NSString *)

#endif // _ComGoodowRealtimeChannelConstantMessageType_H_
