//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#include "IOSClass.h"
#include "java/lang/annotation/ElementType.h"
#include "java/lang/annotation/Retention.h"
#include "java/lang/annotation/RetentionPolicy.h"
#include "java/lang/annotation/Target.h"
#include "org/timepedia/exporter/client/ExportPackage.h"

@implementation OrgTimepediaExporterClientExportPackageImpl
@synthesize value;

- (id)initWithValue:(NSString *)value_ {
  if ((self = [super init])) {
    value = RETAIN(value_);
  }
  return self;
}

- (IOSClass *)annotationType {
  return [IOSClass classWithProtocol:@protocol(OrgTimepediaExporterClientExportPackage)];
}

+ (IOSObjectArray *)__annotations {
  return [IOSObjectArray arrayWithObjects:(id[]) { [[JavaLangAnnotationTargetImpl alloc] initWithValue:[IOSObjectArray arrayWithObjects:(id[]) { [JavaLangAnnotationElementTypeEnum TYPE] } count:1 type:[NSObject getClass]]], [[JavaLangAnnotationRetentionImpl alloc] initWithValue:[JavaLangAnnotationRetentionPolicyEnum RUNTIME]] } count:2 type:[IOSClass classWithProtocol:@protocol(JavaLangAnnotationAnnotation)]];
}

@end

