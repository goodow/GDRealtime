//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#ifndef _GDRCollaboratorJoinedEvent_H_
#define _GDRCollaboratorJoinedEvent_H_

@class GDRCollaborator;
@class GDRDocument;

#import "JreEmulation.h"
#include "com/goodow/realtime/Disposable.h"

@interface GDRCollaboratorJoinedEvent : NSObject < GDRDisposable > {
 @public
  GDRCollaborator *collaborator_;
}

- (id)initWithGDRDocument:(GDRDocument *)document
      withGDRCollaborator:(GDRCollaborator *)collaborator;
- (GDRCollaboratorJoinedEvent *)deserializeWithGDRDocument:(GDRDocument *)source
                                                    withId:(id)serialized;
- (GDRCollaborator *)getCollaborator;
- (void)copyAllFieldsTo:(GDRCollaboratorJoinedEvent *)other;
@end

J2OBJC_FIELD_SETTER(GDRCollaboratorJoinedEvent, collaborator_, GDRCollaborator *)

typedef GDRCollaboratorJoinedEvent ComGoodowRealtimeCollaboratorJoinedEvent;

#endif // _GDRCollaboratorJoinedEvent_H_
