#import "NSObject+OKInjection.h"

@implementation NSObject (OKInjection)

- (void)injectDependencies {
    id objection = NSClassFromString(@"JSObjection");
    id injector = [objection performSelector:@selector(defaultInjector)];
    [injector performSelector:@selector(injectDependencies:) withObject:self];
}

@end
