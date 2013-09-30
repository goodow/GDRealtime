//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#include "IOSClass.h"
#include "IOSObjectArray.h"
#include "elemental/json/JsonArray.h"
#include "elemental/json/JsonBoolean.h"
#include "elemental/json/JsonFactory.h"
#include "elemental/json/JsonNull.h"
#include "elemental/json/JsonNumber.h"
#include "elemental/json/JsonObject.h"
#include "elemental/json/JsonString.h"
#include "elemental/json/JsonType.h"
#include "elemental/json/JsonValue.h"
#include "elemental/json/impl/JreJsonObject.h"
#include "elemental/json/impl/JreJsonValue.h"
#include "elemental/json/impl/JsonContext.h"
#include "elemental/json/impl/JsonObjectContext.h"
#include "elemental/json/impl/JsonUtil.h"
#include "elemental/json/impl/JsonVisitor.h"
#include "java/lang/Double.h"
#include "java/util/ArrayList.h"
#include "java/util/Collections.h"
#include "java/util/HashMap.h"
#include "java/util/LinkedHashMap.h"
#include "java/util/List.h"
#include "java/util/Map.h"
#include "java/util/Set.h"

@implementation ElementalJsonImplJreJsonObject

+ (id<JavaUtilList>)stringifyOrderWithNSStringArray:(IOSObjectArray *)keys {
  id<JavaUtilList> toReturn = [[JavaUtilArrayList alloc] init];
  id<JavaUtilList> nonNumeric = [[JavaUtilArrayList alloc] init];
  {
    IOSObjectArray *a__ = keys;
    id const *b__ = ((IOSObjectArray *) nil_chk(a__))->buffer_;
    id const *e__ = b__ + a__->size_;
    while (b__ < e__) {
      NSString *key = (*b__++);
      if ([((NSString *) nil_chk(key)) matches:@"\\d+"]) {
        [toReturn addWithId:key];
      }
      else {
        [nonNumeric addWithId:key];
      }
    }
  }
  [JavaUtilCollections sortWithJavaUtilList:toReturn];
  [toReturn addAllWithJavaUtilCollection:nonNumeric];
  return toReturn;
}

- (id)initWithGDRJsonFactory:(id<GDRJsonFactory>)factory {
  if (self = [super init]) {
    map_ = [[JavaUtilLinkedHashMap alloc] init];
    self->factory_ = factory;
  }
  return self;
}

- (BOOL)asBoolean {
  return YES;
}

- (double)asNumber {
  return JavaLangDouble_NaN;
}

- (NSString *)asString {
  return @"[object Object]";
}

- (id<GDRJsonValue>)getWithNSString:(NSString *)key {
  return [((id<JavaUtilMap>) nil_chk(map_)) getWithId:key];
}

- (id<GDRJsonArray>)getArrayWithNSString:(NSString *)key {
  return (id<GDRJsonArray>) check_protocol_cast([self getWithNSString:key], @protocol(GDRJsonArray));
}

- (BOOL)getBooleanWithNSString:(NSString *)key {
  return [((id<GDRJsonBoolean>) nil_chk([self getWithNSString:key])) getBoolean];
}

- (double)getNumberWithNSString:(NSString *)key {
  return [((id<GDRJsonNumber>) nil_chk([self getWithNSString:key])) getNumber];
}

- (id<GDRJsonObject>)getObjectWithNSString:(NSString *)key {
  return (id<GDRJsonObject>) check_protocol_cast([self getWithNSString:key], @protocol(GDRJsonObject));
}

- (id)getObject {
  id<JavaUtilMap> obj = [[JavaUtilHashMap alloc] init];
  for (id<JavaUtilMap_Entry> __strong e in [((id<JavaUtilMap>) nil_chk(map_)) entrySet]) {
    (void) [obj putWithId:[((id<JavaUtilMap_Entry>) nil_chk(e)) getKey] withId:[((ElementalJsonImplJreJsonValue *) nil_chk([e getValue])) getObject]];
  }
  return obj;
}

- (NSString *)getStringWithNSString:(NSString *)key {
  return [((id<GDRJsonString>) nil_chk([self getWithNSString:key])) getString];
}

- (GDRJsonTypeEnum *)getType {
  return [GDRJsonTypeEnum OBJECT];
}

- (BOOL)hasKeyWithNSString:(NSString *)key {
  return [((id<JavaUtilMap>) nil_chk(map_)) containsKeyWithId:key];
}

- (BOOL)jsEqualsWithGDRJsonValue:(id<GDRJsonValue>)value {
  return [nil_chk([self getObject]) isEqual:[((ElementalJsonImplJreJsonValue *) nil_chk(value)) getObject]];
}

- (IOSObjectArray *)keys {
  return [((id<JavaUtilSet>) nil_chk([((id<JavaUtilMap>) nil_chk(map_)) keySet])) toArrayWithNSObjectArray:[IOSObjectArray arrayWithLength:[map_ size] type:[IOSClass classWithClass:[NSString class]]]];
}

- (void)putWithNSString:(NSString *)key
       withGDRJsonValue:(id<GDRJsonValue>)value {
  if (value == nil) {
    value = [((id<GDRJsonFactory>) nil_chk(factory_)) createNull];
  }
  (void) [((id<JavaUtilMap>) nil_chk(map_)) putWithId:key withId:value];
}

- (void)putWithNSString:(NSString *)key
           withNSString:(NSString *)value {
  [self putWithNSString:key withGDRJsonValue:[((id<GDRJsonFactory>) nil_chk(factory_)) createWithNSString:value]];
}

- (void)putWithNSString:(NSString *)key
             withDouble:(double)value {
  [self putWithNSString:key withGDRJsonValue:[((id<GDRJsonFactory>) nil_chk(factory_)) createWithDouble:value]];
}

- (void)putWithNSString:(NSString *)key
            withBoolean:(BOOL)bool_ {
  [self putWithNSString:key withGDRJsonValue:[((id<GDRJsonFactory>) nil_chk(factory_)) createWithBoolean:bool_]];
}

- (void)removeWithNSString:(NSString *)key {
  (void) [((id<JavaUtilMap>) nil_chk(map_)) removeWithId:key];
}

- (void)setWithNSString:(NSString *)key
       withGDRJsonValue:(id<GDRJsonValue>)value {
  [self putWithNSString:key withGDRJsonValue:value];
}

- (NSString *)toJson {
  return [ElementalJsonImplJsonUtil stringifyWithGDRJsonValue:self];
}

- (NSString *)description {
  return [self toJson];
}

- (void)traverseWithElementalJsonImplJsonVisitor:(ElementalJsonImplJsonVisitor *)visitor
                withElementalJsonImplJsonContext:(ElementalJsonImplJsonContext *)ctx {
  if ([((ElementalJsonImplJsonVisitor *) nil_chk(visitor)) visitWithGDRJsonObject:self withElementalJsonImplJsonContext:ctx]) {
    ElementalJsonImplJsonObjectContext *objCtx = [[ElementalJsonImplJsonObjectContext alloc] initWithGDRJsonObject:self];
    for (NSString * __strong key in [ElementalJsonImplJreJsonObject stringifyOrderWithNSStringArray:[self keys]]) {
      [objCtx setCurrentKeyWithNSString:key];
      if ([visitor visitKeyWithNSString:[objCtx getCurrentKey] withElementalJsonImplJsonContext:objCtx]) {
        [visitor acceptWithGDRJsonValue:[self getWithNSString:key] withElementalJsonImplJsonContext:objCtx];
        [objCtx setFirstWithBoolean:NO];
      }
    }
  }
  [visitor endVisitWithGDRJsonObject:self withElementalJsonImplJsonContext:ctx];
}

- (void)copyAllFieldsTo:(ElementalJsonImplJreJsonObject *)other {
  [super copyAllFieldsTo:other];
  other->factory_ = factory_;
  other->map_ = map_;
}

@end
