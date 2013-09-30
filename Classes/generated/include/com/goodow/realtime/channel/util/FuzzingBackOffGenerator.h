//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#ifndef _ComGoodowRealtimeChannelUtilFuzzingBackOffGenerator_H_
#define _ComGoodowRealtimeChannelUtilFuzzingBackOffGenerator_H_

@class ComGoodowRealtimeChannelUtilFuzzingBackOffGenerator_BackOffParameters;

#import "JreEmulation.h"

@interface ComGoodowRealtimeChannelUtilFuzzingBackOffGenerator : NSObject {
 @public
  double randomisationFactor_;
  int initialBackOff_;
  int maxBackOff_;
  int nextBackOffTime_;
  int backOffTime_;
}

- (id)initWithInt:(int)initialBackOff
          withInt:(int)maxBackOff
       withDouble:(double)randomisationFactor;
- (ComGoodowRealtimeChannelUtilFuzzingBackOffGenerator_BackOffParameters *)next;
- (void)reset;
- (void)copyAllFieldsTo:(ComGoodowRealtimeChannelUtilFuzzingBackOffGenerator *)other;
@end

@interface ComGoodowRealtimeChannelUtilFuzzingBackOffGenerator_BackOffParameters : NSObject {
 @public
  int targetDelay_;
  int minimumDelay_;
}

- (id)initWithInt:(int)targetDelay
          withInt:(int)minimumDelay;
- (void)copyAllFieldsTo:(ComGoodowRealtimeChannelUtilFuzzingBackOffGenerator_BackOffParameters *)other;
@end

#endif // _ComGoodowRealtimeChannelUtilFuzzingBackOffGenerator_H_
