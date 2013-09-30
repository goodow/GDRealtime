//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#ifndef _GDRValuesAddedEvent_H_
#define _GDRValuesAddedEvent_H_

@class GDRCollaborativeList;
@class IOSObjectArray;

#import "JreEmulation.h"
#include "com/goodow/realtime/BaseModelEvent.h"

@interface GDRValuesAddedEvent : GDRBaseModelEvent {
 @public
  int index_;
  IOSObjectArray *values_;
}

- (id)initWithGDRCollaborativeList:(GDRCollaborativeList *)target
                      withNSString:(NSString *)sessionId
                      withNSString:(NSString *)userId
                           withInt:(int)index
                 withNSObjectArray:(IOSObjectArray *)values;
- (int)getIndex;
- (IOSObjectArray *)getValues;
- (void)copyAllFieldsTo:(GDRValuesAddedEvent *)other;
@end

J2OBJC_FIELD_SETTER(GDRValuesAddedEvent, values_, IOSObjectArray *)

typedef GDRValuesAddedEvent ComGoodowRealtimeValuesAddedEvent;

@interface GDRValuesAddedEvent (NativeMethods)
+ (void)__jsniRunAfter__;
@end

#endif // _GDRValuesAddedEvent_H_
