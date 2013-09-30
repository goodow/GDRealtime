//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#include "IOSClass.h"
#include "com/goodow/realtime/DocumentBridge.h"
#include "com/goodow/realtime/DocumentLoadedHandler.h"
#include "com/goodow/realtime/ErrorHandler.h"
#include "com/goodow/realtime/ModelInitializerHandler.h"
#include "com/goodow/realtime/Realtime.h"
#include "com/goodow/realtime/channel/ChannelDemuxer.h"
#include "com/goodow/realtime/channel/http/HttpTransport.h"
#include "com/goodow/realtime/channel/operation/OperationSucker.h"
#include "com/goodow/realtime/model/util/ModelFactory.h"
#include "com/goodow/realtime/operation/OperationSink.h"
#include "elemental/json/JsonValue.h"
#include "org/timepedia/exporter/client/Export.h"
#include "org/timepedia/exporter/client/ExportPackage.h"

@implementation GDRRealtime

static ComGoodowRealtimeChannelChannelDemuxer * GDRRealtime_demuxer_;
static NSString * GDRRealtime_USERID_;

+ (ComGoodowRealtimeChannelChannelDemuxer *)demuxer {
  return GDRRealtime_demuxer_;
}

+ (NSString *)USERID {
  return GDRRealtime_USERID_;
}

+ (void)setUSERID:(NSString *)USERID {
  GDRRealtime_USERID_ = USERID;
}

+ (void)authorize:(NSString *)userId token:(NSString *)token {
  GDRRealtime_USERID_ = userId;
  [((ComGoodowRealtimeChannelChannelDemuxer *) nil_chk(GDRRealtime_demuxer_)) setAccessTokenWithNSString:token];
}

+ (NSString *)getToken {
  return [((ComGoodowRealtimeChannelChannelDemuxer *) nil_chk(GDRRealtime_demuxer_)) getAccessToken];
}

+ (void)load__WithNSString:(NSString *)docId
withGDRDocumentLoadedHandler:(id<GDRDocumentLoadedHandler>)onLoaded
withGDRModelInitializerHandler:(id<GDRModelInitializerHandler>)opt_initializer
       withGDRErrorHandler:(id<GDRErrorHandler>)opt_error {
  GDRDocumentBridge *snapshot = (GDRDocumentBridge *) check_class_cast([((ComGoodowRealtimeChannelChannelDemuxer *) nil_chk(GDRRealtime_demuxer_)) getSnapshotWithNSString:docId], [GDRDocumentBridge class]);
  if (snapshot != nil) {
    [snapshot addErrorHandlerWithGDRErrorHandler:opt_error];
    [snapshot loadDoucumentWithGDRDocumentLoadedHandler:onLoaded];
    return;
  }
  ComGoodowRealtimeChannelOperationOperationSucker *operationSucker = [[ComGoodowRealtimeChannelOperationOperationSucker alloc] initWithNSString:docId];
  GDRDocumentBridge *bridge = [[GDRDocumentBridge alloc] init];
  [bridge setUndoEnabledWithBoolean:YES];
  [operationSucker load__WithComGoodowRealtimeChannelOperationOperationSucker_Listener:bridge withComGoodowRealtimeChannelRpcSnapshotService_Callback:[[GDRRealtime_$1 alloc] initWithGDRDocumentBridge:bridge withComGoodowRealtimeChannelOperationOperationSucker:operationSucker withGDRErrorHandler:opt_error withGDRModelInitializerHandler:opt_initializer withGDRDocumentLoadedHandler:onLoaded]];
}

+ (void)setServerAddress:(NSString *)serverAddress {
  (void) [ComGoodowRealtimeChannelHttpHttpTransport setCHANNEL:serverAddress];
}

- (id)init {
  return [super init];
}

+ (void)initialize {
  if (self == [GDRRealtime class]) {
    GDRRealtime_demuxer_ = [ComGoodowRealtimeChannelChannelDemuxer get];
  }
}

+ (IOSObjectArray *)__annotations {
  return [IOSObjectArray arrayWithObjects:(id[]) { [[OrgTimepediaExporterClientExportPackageImpl alloc] initWithValue:@""], [[OrgTimepediaExporterClientExportImpl alloc] initWithAll:false withValue:@"good.realtime"] } count:2 type:[IOSClass classWithProtocol:@protocol(JavaLangAnnotationAnnotation)]];
}

@end
@implementation GDRRealtime_$1

- (void)onSuccessWithGDRJsonValue:(id<GDRJsonValue>)snapshot
                     withNSString:(NSString *)sessionId
                          withInt:(int)revision {
  ((GDRDocumentBridge *) nil_chk(val$bridge_))->sessionId_ = sessionId;
  [val$bridge_ setOutputSinkWithComGoodowRealtimeChannelOperationOperationSucker_OutputSink:[((ComGoodowRealtimeChannelOperationOperationSucker *) nil_chk(val$operationSucker_)) getOutputSink]];
  [val$bridge_ addErrorHandlerWithGDRErrorHandler:val$opt_error_];
  [val$bridge_ createSnapshotWithGDRJsonValue:snapshot];
  if (revision == 0) {
    if (val$opt_initializer_ != nil) {
      [val$bridge_ initializeModelWithGDRModelInitializerHandler:val$opt_initializer_];
    }
  }
  [val$bridge_ loadDoucumentWithGDRDocumentLoadedHandler:val$onLoaded_];
}

- (id)initWithGDRDocumentBridge:(GDRDocumentBridge *)capture$0
withComGoodowRealtimeChannelOperationOperationSucker:(ComGoodowRealtimeChannelOperationOperationSucker *)capture$1
            withGDRErrorHandler:(id<GDRErrorHandler>)capture$2
 withGDRModelInitializerHandler:(id<GDRModelInitializerHandler>)capture$3
   withGDRDocumentLoadedHandler:(id<GDRDocumentLoadedHandler>)capture$4 {
  val$bridge_ = capture$0;
  val$operationSucker_ = capture$1;
  val$opt_error_ = capture$2;
  val$opt_initializer_ = capture$3;
  val$onLoaded_ = capture$4;
  return [super init];
}

@end
