//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#include "IOSClass.h"
#include "IOSObjectArray.h"
#include "java/lang/annotation/ElementType.h"
#include "java/lang/annotation/Retention.h"
#include "java/lang/annotation/RetentionPolicy.h"
#include "java/lang/annotation/Target.h"
#include "org/timepedia/exporter/client/NoExport.h"

@implementation OrgTimepediaExporterClientNoExportImpl
- (IOSClass *)annotationType {
  return [IOSClass classWithProtocol:@protocol(OrgTimepediaExporterClientNoExport)];
}

+ (IOSObjectArray *)__annotations {
  return [IOSObjectArray arrayWithObjects:(id[]) { [[JavaLangAnnotationTargetImpl alloc] initWithValue:[IOSObjectArray arrayWithObjects:(id[]) { [JavaLangAnnotationElementTypeEnum METHOD], [JavaLangAnnotationElementTypeEnum FIELD], [JavaLangAnnotationElementTypeEnum CONSTRUCTOR] } count:3 type:[NSObject getClass]]], [[JavaLangAnnotationRetentionImpl alloc] initWithValue:[JavaLangAnnotationRetentionPolicyEnum RUNTIME]] } count:2 type:[IOSClass classWithProtocol:@protocol(JavaLangAnnotationAnnotation)]];
}

@end

