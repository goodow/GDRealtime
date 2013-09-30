//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#ifndef _GDRCollaboratorLeftEvent_H_
#define _GDRCollaboratorLeftEvent_H_

@class GDRCollaborator;
@class GDRDocument;

#import "JreEmulation.h"
#include "com/goodow/realtime/Disposable.h"

@interface GDRCollaboratorLeftEvent : NSObject < GDRDisposable > {
 @public
  GDRCollaborator *collaborator_;
}

- (id)initWithGDRDocument:(GDRDocument *)document
      withGDRCollaborator:(GDRCollaborator *)collaborator;
- (GDRCollaboratorLeftEvent *)deserializeWithGDRDocument:(GDRDocument *)source
                                                  withId:(id)serialized;
- (GDRCollaborator *)getCollaborator;
- (void)copyAllFieldsTo:(GDRCollaboratorLeftEvent *)other;
@end

J2OBJC_FIELD_SETTER(GDRCollaboratorLeftEvent, collaborator_, GDRCollaborator *)

typedef GDRCollaboratorLeftEvent ComGoodowRealtimeCollaboratorLeftEvent;

#endif // _GDRCollaboratorLeftEvent_H_
