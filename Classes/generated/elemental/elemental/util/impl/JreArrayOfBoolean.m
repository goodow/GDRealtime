//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#include "elemental/util/ArrayOf.h"
#include "elemental/util/ArrayOfBoolean.h"
#include "elemental/util/Collections.h"
#include "elemental/util/impl/JreArrayOfBoolean.h"
#include "java/lang/Boolean.h"

@implementation ElementalUtilImplJreArrayOfBoolean

- (id<ElementalUtilArrayOfBoolean>)concatWithElementalUtilArrayOfBoolean:(id<ElementalUtilArrayOfBoolean>)values {
  return [[ElementalUtilImplJreArrayOfBoolean alloc] initWithElementalUtilArrayOf:[((id<ElementalUtilArrayOf>) nil_chk(array_)) concatWithElementalUtilArrayOf:((ElementalUtilImplJreArrayOfBoolean *) nil_chk(values))->array_]];
}

- (BOOL)containsWithBoolean:(BOOL)value {
  return [((id<ElementalUtilArrayOf>) nil_chk(array_)) containsWithId:[JavaLangBoolean valueOfWithBoolean:value]];
}

- (BOOL)getWithInt:(int)index {
  return [((JavaLangBoolean *) nil_chk([((id<ElementalUtilArrayOf>) nil_chk(array_)) getWithInt:index])) booleanValue];
}

- (int)indexOfWithBoolean:(BOOL)value {
  return [((id<ElementalUtilArrayOf>) nil_chk(array_)) indexOfWithId:[JavaLangBoolean valueOfWithBoolean:value]];
}

- (void)insertWithInt:(int)index
          withBoolean:(BOOL)value {
  [((id<ElementalUtilArrayOf>) nil_chk(array_)) insertWithInt:index withId:[JavaLangBoolean valueOfWithBoolean:value]];
}

- (BOOL)isEmpty {
  return [((id<ElementalUtilArrayOf>) nil_chk(array_)) isEmpty];
}

- (BOOL)isSetWithInt:(int)index {
  return [((id<ElementalUtilArrayOf>) nil_chk(array_)) getWithInt:index] != nil;
}

- (NSString *)join {
  return [((id<ElementalUtilArrayOf>) nil_chk(array_)) join];
}

- (NSString *)joinWithNSString:(NSString *)separator {
  return [((id<ElementalUtilArrayOf>) nil_chk(array_)) joinWithNSString:separator];
}

- (int)length {
  return [((id<ElementalUtilArrayOf>) nil_chk(array_)) length];
}

- (BOOL)peek {
  return [((JavaLangBoolean *) nil_chk([((id<ElementalUtilArrayOf>) nil_chk(array_)) peek])) booleanValue];
}

- (BOOL)pop {
  return [((JavaLangBoolean *) nil_chk([((id<ElementalUtilArrayOf>) nil_chk(array_)) pop])) booleanValue];
}

- (void)pushWithBoolean:(BOOL)value {
  [((id<ElementalUtilArrayOf>) nil_chk(array_)) pushWithId:[JavaLangBoolean valueOfWithBoolean:value]];
}

- (void)removeWithBoolean:(BOOL)value {
  [((id<ElementalUtilArrayOf>) nil_chk(array_)) removeWithId:[JavaLangBoolean valueOfWithBoolean:value]];
}

- (void)removeByIndexWithInt:(int)index {
  [((id<ElementalUtilArrayOf>) nil_chk(array_)) removeByIndexWithInt:index];
}

- (void)setWithInt:(int)index
       withBoolean:(BOOL)value {
  [((id<ElementalUtilArrayOf>) nil_chk(array_)) setWithInt:index withId:[JavaLangBoolean valueOfWithBoolean:value]];
}

- (void)setLengthWithInt:(int)length {
  [((id<ElementalUtilArrayOf>) nil_chk(array_)) setLengthWithInt:length];
}

- (BOOL)shift {
  return [((JavaLangBoolean *) nil_chk([((id<ElementalUtilArrayOf>) nil_chk(array_)) shift])) booleanValue];
}

- (id<ElementalUtilArrayOfBoolean>)spliceWithInt:(int)index
                                         withInt:(int)count {
  return [[ElementalUtilImplJreArrayOfBoolean alloc] initWithElementalUtilArrayOf:[((id<ElementalUtilArrayOf>) nil_chk(array_)) spliceWithInt:index withInt:count]];
}

- (void)unshiftWithBoolean:(BOOL)value {
  [((id<ElementalUtilArrayOf>) nil_chk(array_)) unshiftWithId:[JavaLangBoolean valueOfWithBoolean:value]];
}

- (id)init {
  if (self = [super init]) {
    array_ = [ElementalUtilCollections arrayOf];
  }
  return self;
}

- (id)initWithElementalUtilArrayOf:(id<ElementalUtilArrayOf>)array {
  if (self = [super init]) {
    self->array_ = array;
  }
  return self;
}

- (void)copyAllFieldsTo:(ElementalUtilImplJreArrayOfBoolean *)other {
  [super copyAllFieldsTo:other];
  other->array_ = array_;
}

@end
