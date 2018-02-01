#import "RCTPlaid.h"
#import <LinkKit/LinkKit.h>

@implementation RCTPlaid

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(connect)
{
  NSLog(@"Native Module was called.");
  [[NSNotificationCenter defaultCenter]
   postNotificationName:@"OpenPlaidNotification"
   object:self];
}
@end
