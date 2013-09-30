//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#ifndef _ElementalJsonImplJreJsonFactory_H_
#define _ElementalJsonImplJreJsonFactory_H_

@protocol GDRJsonArray;
@protocol GDRJsonBoolean;
@protocol GDRJsonNull;
@protocol GDRJsonNumber;
@protocol GDRJsonObject;
@protocol GDRJsonString;
@protocol GDRJsonValue;

#import "JreEmulation.h"
#include "elemental/json/JsonFactory.h"

@interface ElementalJsonImplJreJsonFactory : NSObject < GDRJsonFactory > {
}

- (id<GDRJsonString>)createWithNSString:(NSString *)string;
- (id<GDRJsonNumber>)createWithDouble:(double)number;
- (id<GDRJsonBoolean>)createWithBoolean:(BOOL)bool_;
- (id<GDRJsonArray>)createArray;
- (id<GDRJsonNull>)createNull;
- (id<GDRJsonObject>)createObject;
- (id)parseWithNSString:(NSString *)jsonString;
- (id)init;
@end

#endif // _ElementalJsonImplJreJsonFactory_H_
