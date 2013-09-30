//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#include "elemental/json/JsonArray.h"
#include "elemental/json/JsonObject.h"
#include "elemental/json/JsonValue.h"
#include "elemental/json/impl/JreJsonValue.h"
#include "elemental/json/impl/JsonContext.h"
#include "elemental/json/impl/JsonVisitor.h"
#include "java/lang/UnsupportedOperationException.h"

@implementation ElementalJsonImplJsonVisitor

- (void)acceptWithGDRJsonValue:(id<GDRJsonValue>)node {
  [self acceptWithGDRJsonValue:node withElementalJsonImplJsonContext:[[ElementalJsonImplJsonVisitor_ImmutableJsonContext alloc] initWithElementalJsonImplJsonVisitor:self withGDRJsonValue:node]];
}

- (void)acceptWithGDRJsonValue:(id<GDRJsonValue>)node
withElementalJsonImplJsonContext:(ElementalJsonImplJsonContext *)ctx {
  if (node == nil) {
    return;
  }
  [((ElementalJsonImplJreJsonValue *) nil_chk(node)) traverseWithElementalJsonImplJsonVisitor:self withElementalJsonImplJsonContext:ctx];
}

- (void)endVisitWithGDRJsonArray:(id<GDRJsonArray>)array
withElementalJsonImplJsonContext:(ElementalJsonImplJsonContext *)ctx {
}

- (void)endVisitWithGDRJsonObject:(id<GDRJsonObject>)object
 withElementalJsonImplJsonContext:(ElementalJsonImplJsonContext *)ctx {
}

- (void)visitWithDouble:(double)number
withElementalJsonImplJsonContext:(ElementalJsonImplJsonContext *)ctx {
}

- (void)visitWithNSString:(NSString *)string
withElementalJsonImplJsonContext:(ElementalJsonImplJsonContext *)ctx {
}

- (void)visitWithBoolean:(BOOL)bool_
withElementalJsonImplJsonContext:(ElementalJsonImplJsonContext *)ctx {
}

- (BOOL)visitWithGDRJsonArray:(id<GDRJsonArray>)array
withElementalJsonImplJsonContext:(ElementalJsonImplJsonContext *)ctx {
  return YES;
}

- (BOOL)visitWithGDRJsonObject:(id<GDRJsonObject>)object
withElementalJsonImplJsonContext:(ElementalJsonImplJsonContext *)ctx {
  return YES;
}

- (BOOL)visitIndexWithInt:(int)index
withElementalJsonImplJsonContext:(ElementalJsonImplJsonContext *)ctx {
  return YES;
}

- (BOOL)visitKeyWithNSString:(NSString *)key
withElementalJsonImplJsonContext:(ElementalJsonImplJsonContext *)ctx {
  return YES;
}

- (void)visitNullWithElementalJsonImplJsonContext:(ElementalJsonImplJsonContext *)ctx {
}

- (id)init {
  return [super init];
}

@end
@implementation ElementalJsonImplJsonVisitor_ImmutableJsonContext

- (id)initWithElementalJsonImplJsonVisitor:(ElementalJsonImplJsonVisitor *)outer$
                          withGDRJsonValue:(id<GDRJsonValue>)node {
  return [super initWithGDRJsonValue:node];
}

- (void)removeMe {
  [self immutableError];
}

- (void)replaceMeWithDouble:(double)d {
  [self immutableError];
}

- (void)replaceMeWithNSString:(NSString *)d {
  [self immutableError];
}

- (void)replaceMeWithBoolean:(BOOL)d {
  [self immutableError];
}

- (void)replaceMeWithGDRJsonValue:(id<GDRJsonValue>)value {
  [self immutableError];
}

- (void)immutableError {
  @throw [[JavaLangUnsupportedOperationException alloc] initWithNSString:@"Immutable context"];
}

@end
