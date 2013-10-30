//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#include "IOSClass.h"
#include "IOSObjectArray.h"
#include "com/goodow/realtime/CollaborativeList.h"
#include "com/goodow/realtime/CollaborativeObject.h"
#include "com/goodow/realtime/EventHandler.h"
#include "com/goodow/realtime/EventType.h"
#include "com/goodow/realtime/IndexReference.h"
#include "com/goodow/realtime/Model.h"
#include "com/goodow/realtime/ValuesAddedEvent.h"
#include "com/goodow/realtime/ValuesRemovedEvent.h"
#include "com/goodow/realtime/ValuesSetEvent.h"
#include "com/goodow/realtime/model/util/JsonSerializer.h"
#include "com/goodow/realtime/model/util/ModelFactory.h"
#include "com/goodow/realtime/operation/Operation.h"
#include "com/goodow/realtime/operation/create/CreateOperation.h"
#include "com/goodow/realtime/operation/list/json/JsonDeleteOperation.h"
#include "com/goodow/realtime/operation/list/json/JsonInsertOperation.h"
#include "com/goodow/realtime/operation/list/json/JsonReplaceOperation.h"
#include "com/goodow/realtime/operation/util/JsonUtility.h"
#include "elemental/json/Json.h"
#include "elemental/json/JsonArray.h"
#include "elemental/json/JsonValue.h"
#include "java/lang/ArrayIndexOutOfBoundsException.h"
#include "java/lang/ClassCastException.h"
#include "java/lang/StringBuilder.h"
#include "java/lang/UnsupportedOperationException.h"
#include "java/util/Comparator.h"
#include "java/util/Map.h"
#include "java/util/Set.h"
#include "org/timepedia/exporter/client/Export.h"
#include "org/timepedia/exporter/client/ExportAfterCreateMethod.h"
#include "org/timepedia/exporter/client/ExportPackage.h"
#include "org/timepedia/exporter/client/NoExport.h"

@implementation GDRCollaborativeList

- (id)initWithGDRModel:(GDRModel *)model {
  if (self = [super initWithGDRModel:model]) {
    snapshot_ = [GDJson createArray];
  }
  return self;
}

- (void)addValuesAddedListener:(GDRValuesAddedBlock)handler {
  [self addEventListenerWithGDREventTypeEnum:[GDREventTypeEnum VALUES_ADDED] withGDREventHandler:handler withBoolean:NO];
}

- (void)addValuesRemovedListener:(GDRValuesRemovedBlock)handler {
  [self addEventListenerWithGDREventTypeEnum:[GDREventTypeEnum VALUES_REMOVED] withGDREventHandler:handler withBoolean:NO];
}

- (void)addValuesSetListener:(GDRValuesSetBlock)handler {
  [self addEventListenerWithGDREventTypeEnum:[GDREventTypeEnum VALUES_SET] withGDREventHandler:handler withBoolean:NO];
}

- (IOSObjectArray *)__asArray {
  int length = [self length];
  IOSObjectArray *objects = [IOSObjectArray arrayWithLength:length type:[IOSClass classWithClass:[NSObject class]]];
  for (int i = 0; i < length; i++) {
    (void) IOSObjectArray_Set(objects, i, [self get:i]);
  }
  return (IOSObjectArray *) check_class_cast(objects, [IOSObjectArray class]);
}

- (void)clear {
  int length = [self length];
  if (length == 0) {
    return;
  }
  [self removeRange:0 endIndex:length];
}

- (id)get:(int)index {
  [self checkIndexWithInt:index withBoolean:NO];
  return (id) [ComGoodowRealtimeModelUtilJsonSerializer deserializeObjectWithGDJsonValue:[((id<GDJsonArray>) nil_chk(snapshot_)) get:index] withJavaUtilMap:((GDRModel *) nil_chk(model_))->objects_];
}

- (int)indexOf:(id)value opt_comparator:(NSComparator)opt_comparator {
  if (opt_comparator == nil) {
    id<GDJsonArray> serializedValue;
    @try {
      serializedValue = [ComGoodowRealtimeModelUtilJsonSerializer serializeObjectWithId:value];
    }
    @catch (JavaLangClassCastException *e) {
      return -1;
    }
    for (int i = 0, len = [self length]; i < len; i++) {
      if ([ComGoodowRealtimeOperationUtilJsonUtility jsonEqualWithGDJsonValue:serializedValue withGDJsonValue:[((id<GDJsonArray>) nil_chk(snapshot_)) get:i]]) {
        return i;
      }
    }
  }
  else {
    for (int i = 0, len = [self length]; i < len; i++) {
      if ([self compareWithJavaUtilComparator:opt_comparator withId:value withId:[self get:i]] == 0) {
        return i;
      }
    }
  }
  return -1;
}

- (void)insert:(int)index value:(id)value {
  [self insertAllWithInt:index withNSObjectArray:[IOSObjectArray arrayWithObjects:(id[]){ value } count:1 type:[IOSClass classWithClass:[NSObject class]]]];
}

- (void)insertAllWithInt:(int)index
       withNSObjectArray:(IOSObjectArray *)values {
  NSAssert(values != nil, @"/Users/retechretech/dev/workspace/realtime/realtime-api/src/main/java/com/goodow/realtime/CollaborativeList.java:257 condition failed: assert values != null;");
  [self checkIndexWithInt:index withBoolean:YES];
  if ((int) [((IOSObjectArray *) nil_chk(values)) count] == 0) {
    return;
  }
  else {
    IOSObjectArray *array = [ComGoodowRealtimeModelUtilJsonSerializer serializeObjectsWithNSObjectArray:values];
    ComGoodowRealtimeOperationListJsonJsonInsertOperation *op = [[ComGoodowRealtimeOperationListJsonJsonInsertOperation alloc] initWithNSString:id__ withInt:index withId:array];
    [self consumeAndSubmitWithComGoodowRealtimeOperationOperation:op];
  }
}

- (int)lastIndexOf:(id)value opt_comparator:(NSComparator)opt_comparator {
  if (opt_comparator == nil) {
    id<GDJsonArray> serializedValue;
    @try {
      serializedValue = [ComGoodowRealtimeModelUtilJsonSerializer serializeObjectWithId:value];
    }
    @catch (JavaLangClassCastException *e) {
      return -1;
    }
    for (int i = [self length] - 1; i >= 0; i--) {
      if ([ComGoodowRealtimeOperationUtilJsonUtility jsonEqualWithGDJsonValue:serializedValue withGDJsonValue:[((id<GDJsonArray>) nil_chk(snapshot_)) get:i]]) {
        return i;
      }
    }
  }
  else {
    for (int i = [self length] - 1; i >= 0; i--) {
      if ([self compareWithJavaUtilComparator:opt_comparator withId:value withId:[self get:i]] == 0) {
        return i;
      }
    }
  }
  return -1;
}

- (int)length {
  return [((id<GDJsonArray>) nil_chk(snapshot_)) length];
}

- (int)push:(id)value {
  [self insert:[self length] value:value];
  return [self length];
}

- (void)pushAllWithNSObjectArray:(IOSObjectArray *)values {
  [self insertAllWithInt:[self length] withNSObjectArray:values];
}

- (GDRIndexReference *)registerReference:(int)index canBeDeleted:(BOOL)canBeDeleted {
  [self checkIndexWithInt:index withBoolean:YES];
  return [((GDRModel *) nil_chk(model_)) createIndexReferenceWithNSString:id__ withInt:index withBoolean:canBeDeleted];
}

- (void)remove:(int)index {
  [self removeRange:index endIndex:index + 1];
}

- (void)removeListListener:(GDREventBlock)handler {
  [self removeEventListenerWithGDREventTypeEnum:[GDREventTypeEnum VALUES_ADDED] withGDREventHandler:handler withBoolean:NO];
  [self removeEventListenerWithGDREventTypeEnum:[GDREventTypeEnum VALUES_REMOVED] withGDREventHandler:handler withBoolean:NO];
  [self removeEventListenerWithGDREventTypeEnum:[GDREventTypeEnum VALUES_SET] withGDREventHandler:handler withBoolean:NO];
}

- (void)removeRange:(int)startIndex endIndex:(int)endIndex {
  if (startIndex < 0 || startIndex >= endIndex || endIndex > [self length]) {
    @throw [[JavaLangArrayIndexOutOfBoundsException alloc] initWithNSString:[NSString stringWithFormat:@"StartIndex: %d, EndIndex: %d, Size: %d", startIndex, endIndex, [self length]]];
  }
  IOSObjectArray *values = [self subValuesWithInt:startIndex withInt:endIndex - startIndex];
  ComGoodowRealtimeOperationListJsonJsonDeleteOperation *op = [[ComGoodowRealtimeOperationListJsonJsonDeleteOperation alloc] initWithNSString:id__ withInt:startIndex withId:values];
  [self consumeAndSubmitWithComGoodowRealtimeOperationOperation:op];
}

- (BOOL)removeValue:(id)value {
  int index = [self indexOf:value opt_comparator:nil];
  if (index == -1) {
    return NO;
  }
  [self remove:index];
  return YES;
}

- (void)replaceRangeWithInt:(int)index
          withNSObjectArray:(IOSObjectArray *)values {
  NSAssert(values != nil, @"/Users/retechretech/dev/workspace/realtime/realtime-api/src/main/java/com/goodow/realtime/CollaborativeList.java:402 condition failed: assert values != null;");
  if ((int) [((IOSObjectArray *) nil_chk(values)) count] == 0) {
    @throw [[JavaLangUnsupportedOperationException alloc] initWithNSString:@"At least one value must be specified for a set mutation."];
  }
  [self checkIndexWithInt:index + (int) [values count] withBoolean:YES];
  ComGoodowRealtimeOperationListJsonJsonReplaceOperation *op = [[ComGoodowRealtimeOperationListJsonJsonReplaceOperation alloc] initWithNSString:id__ withInt:index withId:[self subValuesWithInt:index withInt:(int) [values count]] withId:[ComGoodowRealtimeModelUtilJsonSerializer serializeObjectsWithNSObjectArray:values]];
  [self consumeAndSubmitWithComGoodowRealtimeOperationOperation:op];
}

- (void)set:(int)index value:(id)value {
  [self replaceRangeWithInt:index withNSObjectArray:[IOSObjectArray arrayWithObjects:(id[]){ value } count:1 type:[IOSClass classWithClass:[NSObject class]]]];
}

- (void)setLength:(int)length {
  [self checkIndexWithInt:length withBoolean:YES];
  int total = [self length];
  if (length == total) {
    return;
  }
  [self removeRange:length endIndex:total];
}

- (void)consumeWithNSString:(NSString *)userId
               withNSString:(NSString *)sessionId
withComGoodowRealtimeOperationOperation:(id<ComGoodowRealtimeOperationOperation>)operation {
  [((id<ComGoodowRealtimeOperationOperation>) nil_chk(operation)) applyWithId:[[GDRCollaborativeList_$1 alloc] initWithGDRCollaborativeList:self withNSString:sessionId withNSString:userId]];
}

- (IOSObjectArray *)toInitialization {
  int length = [self length];
  IOSObjectArray *toRtn = [IOSObjectArray arrayWithLength:1 + (length == 0 ? 0 : 1) type:[IOSClass classWithProtocol:@protocol(ComGoodowRealtimeOperationOperation)]];
  (void) IOSObjectArray_Set(toRtn, 0, [[ComGoodowRealtimeOperationCreateCreateOperation alloc] initWithNSString:id__ withInt:ComGoodowRealtimeOperationCreateCreateOperation_LIST]);
  if (length != 0) {
    (void) IOSObjectArray_Set(toRtn, 1, [[ComGoodowRealtimeOperationListJsonJsonInsertOperation alloc] initWithNSString:id__ withInt:0 withId:[self subValuesWithInt:0 withInt:length]]);
  }
  return toRtn;
}

- (void)toStringWithJavaUtilSet:(id<JavaUtilSet>)seen
      withJavaLangStringBuilder:(JavaLangStringBuilder *)sb {
  if ([((id<JavaUtilSet>) nil_chk(seen)) containsWithId:id__]) {
    (void) [((JavaLangStringBuilder *) nil_chk([((JavaLangStringBuilder *) nil_chk([((JavaLangStringBuilder *) nil_chk(sb)) appendWithNSString:@"<List: "])) appendWithNSString:id__])) appendWithNSString:@">"];
    return;
  }
  [seen addWithId:id__];
  (void) [((JavaLangStringBuilder *) nil_chk(sb)) appendWithNSString:@"["];
  BOOL isFirst = YES;
  for (int i = 0, len = [self length]; i < len; i++) {
    if (!isFirst) {
      (void) [sb appendWithNSString:@", "];
    }
    else {
      isFirst = NO;
    }
    id value = [self get:i];
    if (value == nil) {
      (void) [sb appendWithNSString:(NSString *) check_class_cast(nil, [NSString class])];
    }
    else if ([value isKindOfClass:[GDRCollaborativeObject class]]) {
      GDRCollaborativeObject *obj = (GDRCollaborativeObject *) check_class_cast(value, [GDRCollaborativeObject class]);
      [obj toStringWithJavaUtilSet:seen withJavaLangStringBuilder:sb];
    }
    else {
      (void) [sb appendWithNSString:[NSString stringWithFormat:@"[JsonValue %@]", [((id<GDJsonValue>) nil_chk([((id<GDJsonArray>) nil_chk([((id<GDJsonArray>) nil_chk(snapshot_)) getArray:i])) get:1])) toJson]]];
    }
  }
  (void) [sb appendWithNSString:@"]"];
}

- (int)__ocniCompare__WithId:(id)comparator
                      withId:(id)object1
                      withId:(id)object2 {
  NSComparator block = (NSComparator)comparator;
  return block(object1, object2);
}

- (void)checkIndexWithInt:(int)index
              withBoolean:(BOOL)endBoundIsValid {
  int length = [self length];
  if (index < 0 || (endBoundIsValid ? index > length : index >= length)) {
    @throw [[JavaLangArrayIndexOutOfBoundsException alloc] initWithNSString:[NSString stringWithFormat:@"Index: %d, Size: %d", index, length]];
  }
}

- (int)compareWithJavaUtilComparator:(id<JavaUtilComparator>)comparator
                              withId:(id)object1
                              withId:(id)object2 {
  if ([(id) comparator conformsToProtocol: @protocol(JavaUtilComparator)]) {
    return [((id<JavaUtilComparator>) nil_chk(comparator)) compareWithId:object1 withId:object2];
  }
  else {
    return [self __ocniCompare__WithId:comparator withId:object1 withId:object2];
  }
}

- (void)insertAndFireEventWithInt:(int)index
             withGDJsonValueArray:(IOSObjectArray *)values
                     withNSString:(NSString *)sessionId
                     withNSString:(NSString *)userId {
  NSAssert(index <= [self length], @"/Users/retechretech/dev/workspace/realtime/realtime-api/src/main/java/com/goodow/realtime/CollaborativeList.java:526 condition failed: assert index <= length();");
  IOSObjectArray *objects = [IOSObjectArray arrayWithLength:(int) [((IOSObjectArray *) nil_chk(values)) count] type:[IOSClass classWithClass:[NSObject class]]];
  int i = 0;
  {
    IOSObjectArray *a__ = values;
    id const *b__ = a__->buffer_;
    id const *e__ = b__ + a__->size_;
    while (b__ < e__) {
      id<GDJsonValue> value = (*b__++);
      (void) IOSObjectArray_Set(objects, i, [ComGoodowRealtimeModelUtilJsonSerializer deserializeObjectWithGDJsonValue:value withJavaUtilMap:((GDRModel *) nil_chk(model_))->objects_]);
      [((id<GDJsonArray>) nil_chk(snapshot_)) insert:index + i++ value:value];
      [model_ addOrRemoveParentWithGDJsonValue:value withNSString:id__ withBoolean:YES];
      model_->bytesUsed_ += [(value == nil ? @"null" : [value toJson]) length];
    }
  }
  GDRValuesAddedEvent *event = [[GDRValuesAddedEvent alloc] initWithGDRCollaborativeList:self withNSString:sessionId withNSString:userId withInt:index withNSObjectArray:objects];
  [self fireEventWithGDRBaseModelEvent:event];
  [((GDRModel *) nil_chk(model_)) setIndexReferenceIndexWithNSString:id__ withBoolean:YES withInt:index withInt:(int) [values count] withNSString:sessionId withNSString:userId];
}

- (void)removeAndFireEventWithInt:(int)index
                          withInt:(int)length
                     withNSString:(NSString *)sessionId
                     withNSString:(NSString *)userId {
  NSAssert(index + length <= [self length], @"/Users/retechretech/dev/workspace/realtime/realtime-api/src/main/java/com/goodow/realtime/CollaborativeList.java:541 condition failed: assert index + length <= length();");
  IOSObjectArray *objects = [IOSObjectArray arrayWithLength:length type:[IOSClass classWithClass:[NSObject class]]];
  for (int i = 0; i < length; i++) {
    (void) IOSObjectArray_Set(objects, i, [self get:index]);
    id<GDJsonValue> value = [((id<GDJsonArray>) nil_chk(snapshot_)) get:index];
    [snapshot_ remove:index];
    [((GDRModel *) nil_chk(model_)) addOrRemoveParentWithGDJsonValue:value withNSString:id__ withBoolean:NO];
    model_->bytesUsed_ -= [((NSString *) nil_chk([((id<GDJsonValue>) nil_chk(value)) toJson])) length];
  }
  GDRValuesRemovedEvent *event = [[GDRValuesRemovedEvent alloc] initWithGDRCollaborativeList:self withNSString:sessionId withNSString:userId withInt:index withNSObjectArray:objects];
  [self fireEventWithGDRBaseModelEvent:event];
  [((GDRModel *) nil_chk(model_)) setIndexReferenceIndexWithNSString:id__ withBoolean:NO withInt:index withInt:length withNSString:sessionId withNSString:userId];
}

- (void)replaceAndFireEventWithInt:(int)index
              withGDJsonValueArray:(IOSObjectArray *)values
                      withNSString:(NSString *)sessionId
                      withNSString:(NSString *)userId {
  NSAssert(index + (int) [((IOSObjectArray *) nil_chk(values)) count] <= [self length], @"/Users/retechretech/dev/workspace/realtime/realtime-api/src/main/java/com/goodow/realtime/CollaborativeList.java:556 condition failed: assert index + values.length <= length();");
  IOSObjectArray *oldObjects = [IOSObjectArray arrayWithLength:(int) [values count] type:[IOSClass classWithClass:[NSObject class]]];
  IOSObjectArray *newObjects = [IOSObjectArray arrayWithLength:(int) [values count] type:[IOSClass classWithClass:[NSObject class]]];
  int i = 0;
  {
    IOSObjectArray *a__ = values;
    id const *b__ = a__->buffer_;
    id const *e__ = b__ + a__->size_;
    while (b__ < e__) {
      id<GDJsonValue> newValue = (*b__++);
      (void) IOSObjectArray_Set(oldObjects, i, [self get:index + i]);
      (void) IOSObjectArray_Set(newObjects, i, [ComGoodowRealtimeModelUtilJsonSerializer deserializeObjectWithGDJsonValue:newValue withJavaUtilMap:((GDRModel *) nil_chk(model_))->objects_]);
      id<GDJsonValue> oldValue = [((id<GDJsonArray>) nil_chk(snapshot_)) get:index + i];
      [snapshot_ set:index + i++ value:newValue];
      [model_ addOrRemoveParentWithGDJsonValue:oldValue withNSString:id__ withBoolean:NO];
      [model_ addOrRemoveParentWithGDJsonValue:newValue withNSString:id__ withBoolean:YES];
      model_->bytesUsed_ -= [((NSString *) nil_chk([((id<GDJsonValue>) nil_chk(oldValue)) toJson])) length];
      model_->bytesUsed_ += [((NSString *) nil_chk([((id<GDJsonValue>) nil_chk(newValue)) toJson])) length];
    }
  }
  GDRValuesSetEvent *event = [[GDRValuesSetEvent alloc] initWithGDRCollaborativeList:self withNSString:sessionId withNSString:userId withInt:index withNSObjectArray:oldObjects withNSObjectArray:newObjects];
  [self fireEventWithGDRBaseModelEvent:event];
}

- (IOSObjectArray *)subValuesWithInt:(int)startIndex
                             withInt:(int)length {
  IOSObjectArray *array = [IOSObjectArray arrayWithLength:length type:[IOSClass classWithProtocol:@protocol(GDJsonValue)]];
  for (int i = 0; i < length; i++) {
    (void) IOSObjectArray_Set(array, i, [((id<GDJsonArray>) nil_chk(snapshot_)) get:startIndex + i]);
  }
  return array;
}

- (void)copyAllFieldsTo:(GDRCollaborativeList *)other {
  [super copyAllFieldsTo:other];
  other->snapshot_ = snapshot_;
}

+ (IOSObjectArray *)__annotations {
  return [IOSObjectArray arrayWithObjects:(id[]) { [[OrgTimepediaExporterClientExportPackageImpl alloc] initWithValue:@"good.realtime"], [[OrgTimepediaExporterClientExportImpl alloc] initWithAll:true withValue:@""] } count:2 type:[IOSClass classWithProtocol:@protocol(JavaLangAnnotationAnnotation)]];
}

+ (IOSObjectArray *)__annotations___jsniRunAfter__ {
  return [IOSObjectArray arrayWithObjects:(id[]) { [[OrgTimepediaExporterClientExportAfterCreateMethodImpl alloc] init] } count:1 type:[IOSClass classWithProtocol:@protocol(JavaLangAnnotationAnnotation)]];
}

+ (IOSObjectArray *)__annotations___asArray {
  return [IOSObjectArray arrayWithObjects:(id[]) { [[OrgTimepediaExporterClientNoExportImpl alloc] init] } count:1 type:[IOSClass classWithProtocol:@protocol(JavaLangAnnotationAnnotation)]];
}

+ (IOSObjectArray *)__annotations_getWithInt_ {
  return [IOSObjectArray arrayWithObjects:(id[]) { [[OrgTimepediaExporterClientNoExportImpl alloc] init] } count:1 type:[IOSClass classWithProtocol:@protocol(JavaLangAnnotationAnnotation)]];
}

+ (IOSObjectArray *)__annotations_indexOfWithId_withJavaUtilComparator_ {
  return [IOSObjectArray arrayWithObjects:(id[]) { [[OrgTimepediaExporterClientNoExportImpl alloc] init] } count:1 type:[IOSClass classWithProtocol:@protocol(JavaLangAnnotationAnnotation)]];
}

+ (IOSObjectArray *)__annotations_insertWithInt_withId_ {
  return [IOSObjectArray arrayWithObjects:(id[]) { [[OrgTimepediaExporterClientNoExportImpl alloc] init] } count:1 type:[IOSClass classWithProtocol:@protocol(JavaLangAnnotationAnnotation)]];
}

+ (IOSObjectArray *)__annotations_lastIndexOfWithId_withJavaUtilComparator_ {
  return [IOSObjectArray arrayWithObjects:(id[]) { [[OrgTimepediaExporterClientNoExportImpl alloc] init] } count:1 type:[IOSClass classWithProtocol:@protocol(JavaLangAnnotationAnnotation)]];
}

+ (IOSObjectArray *)__annotations_pushWithId_ {
  return [IOSObjectArray arrayWithObjects:(id[]) { [[OrgTimepediaExporterClientNoExportImpl alloc] init] } count:1 type:[IOSClass classWithProtocol:@protocol(JavaLangAnnotationAnnotation)]];
}

+ (IOSObjectArray *)__annotations_removeValueWithId_ {
  return [IOSObjectArray arrayWithObjects:(id[]) { [[OrgTimepediaExporterClientNoExportImpl alloc] init] } count:1 type:[IOSClass classWithProtocol:@protocol(JavaLangAnnotationAnnotation)]];
}

+ (IOSObjectArray *)__annotations_setWithInt_withId_ {
  return [IOSObjectArray arrayWithObjects:(id[]) { [[OrgTimepediaExporterClientNoExportImpl alloc] init] } count:1 type:[IOSClass classWithProtocol:@protocol(JavaLangAnnotationAnnotation)]];
}

+ (IOSObjectArray *)__annotations_setLengthWithInt_ {
  return [IOSObjectArray arrayWithObjects:(id[]) { [[OrgTimepediaExporterClientNoExportImpl alloc] init] } count:1 type:[IOSClass classWithProtocol:@protocol(JavaLangAnnotationAnnotation)]];
}

@end
@implementation GDRCollaborativeList_$1

- (void)delete__WithInt:(int)startIndex
                withInt:(int)length {
  [this$0_ removeAndFireEventWithInt:startIndex withInt:length withNSString:val$sessionId_ withNSString:val$userId_];
}

- (void)insertWithInt:(int)startIndex
               withId:(IOSObjectArray *)values {
  [this$0_ insertAndFireEventWithInt:startIndex withGDJsonValueArray:values withNSString:val$sessionId_ withNSString:val$userId_];
}

- (void)replaceWithInt:(int)startIndex
                withId:(IOSObjectArray *)values {
  [this$0_ replaceAndFireEventWithInt:startIndex withGDJsonValueArray:values withNSString:val$sessionId_ withNSString:val$userId_];
}

- (id)initWithGDRCollaborativeList:(GDRCollaborativeList *)outer$
                      withNSString:(NSString *)capture$0
                      withNSString:(NSString *)capture$1 {
  this$0_ = outer$;
  val$sessionId_ = capture$0;
  val$userId_ = capture$1;
  return [super init];
}

@end
