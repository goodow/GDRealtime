//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#ifndef _GDRTextInsertedEvent_H_
#define _GDRTextInsertedEvent_H_

@class GDRCollaborativeString;

#import "JreEmulation.h"
#include "com/goodow/realtime/BaseModelEvent.h"

@interface GDRTextInsertedEvent : GDRBaseModelEvent {
 @public
  int index_;
  NSString *text_;
}

- (id)initWithGDRCollaborativeString:(GDRCollaborativeString *)target
                        withNSString:(NSString *)sessionId
                        withNSString:(NSString *)userId
                             withInt:(int)index
                        withNSString:(NSString *)text;
- (int)getIndex;
- (NSString *)getText;
- (void)copyAllFieldsTo:(GDRTextInsertedEvent *)other;
@end

J2OBJC_FIELD_SETTER(GDRTextInsertedEvent, text_, NSString *)

typedef GDRTextInsertedEvent ComGoodowRealtimeTextInsertedEvent;

#endif // _GDRTextInsertedEvent_H_
