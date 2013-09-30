//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#ifndef _GDRErrorType_H_
#define _GDRErrorType_H_

#import "JreEmulation.h"
#include "java/lang/Enum.h"
#include "org/timepedia/exporter/client/Exportable.h"

typedef enum {
  GDRErrorType_CLIENT_ERROR = 0,
  GDRErrorType_CONCURRENT_CREATION = 1,
  GDRErrorType_FORBIDDEN = 2,
  GDRErrorType_INVALID_COMPOUND_OPERATION = 3,
  GDRErrorType_NOT_FOUND = 4,
  GDRErrorType_SERVER_ERROR = 5,
  GDRErrorType_TOKEN_REFRESH_REQUIRED = 6,
} GDRErrorType;

@interface GDRErrorTypeEnum : JavaLangEnum < NSCopying, OrgTimepediaExporterClientExportable > {
}
+ (GDRErrorTypeEnum *)CLIENT_ERROR;
+ (GDRErrorTypeEnum *)CONCURRENT_CREATION;
+ (GDRErrorTypeEnum *)FORBIDDEN;
+ (GDRErrorTypeEnum *)INVALID_COMPOUND_OPERATION;
+ (GDRErrorTypeEnum *)NOT_FOUND;
+ (GDRErrorTypeEnum *)SERVER_ERROR;
+ (GDRErrorTypeEnum *)TOKEN_REFRESH_REQUIRED;
+ (IOSObjectArray *)values;
+ (GDRErrorTypeEnum *)valueOfWithNSString:(NSString *)name;
- (id)copyWithZone:(NSZone *)zone;
- (id)initWithNSString:(NSString *)__name withInt:(int)__ordinal;
@end

#endif // _GDRErrorType_H_
