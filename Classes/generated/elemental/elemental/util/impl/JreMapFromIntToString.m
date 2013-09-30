//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#include "elemental/util/ArrayOf.h"
#include "elemental/util/ArrayOfInt.h"
#include "elemental/util/ArrayOfString.h"
#include "elemental/util/impl/JreArrayOfString.h"
#include "elemental/util/impl/JreMapFromIntTo.h"
#include "elemental/util/impl/JreMapFromIntToString.h"

@implementation ElementalUtilImplJreMapFromIntToString

- (id)init {
  if (self = [super init]) {
    map_ = [[ElementalUtilImplJreMapFromIntTo alloc] init];
  }
  return self;
}

- (NSString *)getWithInt:(int)key {
  return [((ElementalUtilImplJreMapFromIntTo *) nil_chk(map_)) getWithInt:key];
}

- (BOOL)hasKeyWithInt:(int)key {
  return [((ElementalUtilImplJreMapFromIntTo *) nil_chk(map_)) hasKeyWithInt:key];
}

- (id<ElementalUtilArrayOfInt>)keys {
  return [((ElementalUtilImplJreMapFromIntTo *) nil_chk(map_)) keys];
}

- (void)putWithInt:(int)key
      withNSString:(NSString *)value {
  [((ElementalUtilImplJreMapFromIntTo *) nil_chk(map_)) putWithInt:key withId:value];
}

- (void)removeWithInt:(int)key {
  [((ElementalUtilImplJreMapFromIntTo *) nil_chk(map_)) removeWithInt:key];
}

- (void)setWithInt:(int)key
      withNSString:(NSString *)value {
  [self putWithInt:key withNSString:value];
}

- (id<ElementalUtilArrayOfString>)values {
  return [[ElementalUtilImplJreArrayOfString alloc] initWithElementalUtilArrayOf:[((ElementalUtilImplJreMapFromIntTo *) nil_chk(map_)) values]];
}

- (void)copyAllFieldsTo:(ElementalUtilImplJreMapFromIntToString *)other {
  [super copyAllFieldsTo:other];
  other->map_ = map_;
}

@end
