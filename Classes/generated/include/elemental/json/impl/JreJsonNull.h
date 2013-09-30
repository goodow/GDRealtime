//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#ifndef _ElementalJsonImplJreJsonNull_H_
#define _ElementalJsonImplJreJsonNull_H_

@class ElementalJsonImplJsonContext;
@class ElementalJsonImplJsonVisitor;
@class GDRJsonTypeEnum;
@protocol GDRJsonValue;

#import "JreEmulation.h"
#include "elemental/json/JsonNull.h"
#include "elemental/json/impl/JreJsonValue.h"

@interface ElementalJsonImplJreJsonNull : ElementalJsonImplJreJsonValue < GDRJsonNull > {
}

+ (id<GDRJsonNull>)NULL_INSTANCE;
- (double)asNumber;
- (BOOL)asBoolean;
- (NSString *)asString;
- (id)getObject;
- (GDRJsonTypeEnum *)getType;
- (BOOL)jsEqualsWithGDRJsonValue:(id<GDRJsonValue>)value;
- (void)traverseWithElementalJsonImplJsonVisitor:(ElementalJsonImplJsonVisitor *)visitor
                withElementalJsonImplJsonContext:(ElementalJsonImplJsonContext *)ctx;
- (NSString *)toJson;
- (id)init;
@end

#endif // _ElementalJsonImplJreJsonNull_H_
