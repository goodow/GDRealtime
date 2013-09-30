#import "GDRCollaborativeMap+OCNI.h"
#import "GDR.h"

@implementation GDRCollaborativeMap (OCNI)

-(NSArray *)items {
  NSMutableArray * toRtn = [NSMutableArray array];
  IOSObjectArray * array = [self __keys];
  for(int i=0,len= self.size; i<len; i++){
    NSString * key = [array objectAtIndex:i];
    [toRtn addObject: @[key, [self get:key]]];
  }
  return toRtn;
}

-(NSArray *)keys {
  IOSObjectArray * array = [self __keys];
  return [GDRCollaborativeMap arrayWithIOSArray:array];
}

-(NSArray *)values {
  NSMutableArray * toRtn = [NSMutableArray array];
  IOSObjectArray * array = [self __keys];
  for(int i=0,len=self.size; i<len; i++){
    [toRtn addObject:[self get:[array objectAtIndex:i]]];
  }
  return toRtn;
}

+ (NSArray *)arrayWithIOSArray:(IOSObjectArray *)array {
  NSMutableArray * toRtn = [NSMutableArray array];
  for(int i=0,len=[array count]; i<len; i++){
    [toRtn addObject:[array objectAtIndex:i]];
  }
  return toRtn;
}

@end
