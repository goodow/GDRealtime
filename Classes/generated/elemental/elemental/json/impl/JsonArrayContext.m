//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#include "elemental/json/JsonArray.h"
#include "elemental/json/JsonValue.h"
#include "elemental/json/impl/JsonArrayContext.h"
#include "elemental/json/impl/JsonContext.h"

@implementation ElementalJsonImplJsonArrayContext

- (id)initWithGDRJsonArray:(id<GDRJsonArray>)array {
  if (self = [super initWithGDRJsonValue:array]) {
    currentIndex_ = 0;
  }
  return self;
}

- (id<GDRJsonArray>)array {
  return (id<GDRJsonArray>) check_protocol_cast([self getValue], @protocol(GDRJsonArray));
}

- (int)getCurrentIndex {
  return currentIndex_;
}

- (void)removeMe {
  [((id<GDRJsonArray>) nil_chk([self array])) removeWithInt:[self getCurrentIndex]];
}

- (void)replaceMeWithDouble:(double)d {
  [((id<GDRJsonArray>) nil_chk([self array])) setWithInt:[self getCurrentIndex] withDouble:d];
}

- (void)replaceMeWithNSString:(NSString *)d {
  [((id<GDRJsonArray>) nil_chk([self array])) setWithInt:[self getCurrentIndex] withNSString:d];
}

- (void)replaceMeWithBoolean:(BOOL)d {
  [((id<GDRJsonArray>) nil_chk([self array])) setWithInt:[self getCurrentIndex] withBoolean:d];
}

- (void)replaceMeWithGDRJsonValue:(id<GDRJsonValue>)value {
  [((id<GDRJsonArray>) nil_chk([self array])) setWithInt:[self getCurrentIndex] withGDRJsonValue:value];
}

- (void)setCurrentIndexWithInt:(int)currentIndex {
  self->currentIndex_ = currentIndex;
}

- (void)copyAllFieldsTo:(ElementalJsonImplJsonArrayContext *)other {
  [super copyAllFieldsTo:other];
  other->currentIndex_ = currentIndex_;
}

@end
