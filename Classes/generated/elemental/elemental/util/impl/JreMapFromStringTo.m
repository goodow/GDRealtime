//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#include "elemental/util/ArrayOf.h"
#include "elemental/util/ArrayOfString.h"
#include "elemental/util/impl/JreArrayOf.h"
#include "elemental/util/impl/JreArrayOfString.h"
#include "elemental/util/impl/JreMapFromStringTo.h"
#include "java/util/ArrayList.h"
#include "java/util/Collection.h"
#include "java/util/HashMap.h"
#include "java/util/Set.h"

@implementation ElementalUtilImplJreMapFromStringTo

- (id)init {
  if (self = [super init]) {
    map_ = [[JavaUtilHashMap alloc] init];
  }
  return self;
}

- (id)initWithJavaUtilHashMap:(JavaUtilHashMap *)map {
  if (self = [super init]) {
    self->map_ = map;
  }
  return self;
}

- (id)getWithNSString:(NSString *)key {
  return [((JavaUtilHashMap *) nil_chk(map_)) getWithId:key];
}

- (BOOL)hasKeyWithNSString:(NSString *)key {
  return [((JavaUtilHashMap *) nil_chk(map_)) containsKeyWithId:key];
}

- (id<ElementalUtilArrayOfString>)keys {
  return [[ElementalUtilImplJreArrayOfString alloc] initWithJavaUtilArrayList:[[JavaUtilArrayList alloc] initWithJavaUtilCollection:[((JavaUtilHashMap *) nil_chk(map_)) keySet]]];
}

- (void)putWithNSString:(NSString *)key
                 withId:(id)value {
  (void) [((JavaUtilHashMap *) nil_chk(map_)) putWithId:key withId:value];
}

- (void)removeWithNSString:(NSString *)key {
  (void) [((JavaUtilHashMap *) nil_chk(map_)) removeWithId:key];
}

- (id<ElementalUtilArrayOf>)values {
  return [[ElementalUtilImplJreArrayOf alloc] initWithJavaUtilArrayList:[[JavaUtilArrayList alloc] initWithJavaUtilCollection:[((JavaUtilHashMap *) nil_chk(map_)) values]]];
}

- (void)copyAllFieldsTo:(ElementalUtilImplJreMapFromStringTo *)other {
  [super copyAllFieldsTo:other];
  other->map_ = map_;
}

@end
