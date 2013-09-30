//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#ifndef _GDRError_H_
#define _GDRError_H_

@class GDRErrorTypeEnum;

#import "JreEmulation.h"
#include "org/timepedia/exporter/client/Exportable.h"

@interface GDRError : NSObject < OrgTimepediaExporterClientExportable > {
 @public
  BOOL isFatal__;
  NSString *message_;
  GDRErrorTypeEnum *type_;
}

- (id)initWithGDRErrorTypeEnum:(GDRErrorTypeEnum *)type
                  withNSString:(NSString *)message
                   withBoolean:(BOOL)isFatal;
- (NSString *)getMessage;
- (GDRErrorTypeEnum *)getType;
- (BOOL)isFatal;
- (void)copyAllFieldsTo:(GDRError *)other;
@end

J2OBJC_FIELD_SETTER(GDRError, message_, NSString *)
J2OBJC_FIELD_SETTER(GDRError, type_, GDRErrorTypeEnum *)

typedef GDRError ComGoodowRealtimeError;

#endif // _GDRError_H_
