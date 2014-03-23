#import "NSObject+OKInjection.h"
#import "JSObjection.h"

@implementation NSObject (OKInjection)

- (void)injectDependencies {
    JSObjectionInjector *injector = [JSObjection defaultInjector];
    [injector injectDependencies:self];
}

@end