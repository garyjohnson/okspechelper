#import "NSObject+OKInjection.h"

@implementation NSObject (OKInjection)

- (void)injectDependencies {
    NSObject *objection = NSClassFromString(@"JSObjection");
    NSObject *injector = [objection performSelector:@selector(defaultInjector)];
    [injector performSelector:@selector(injectDependencies) withObject:self];
}

@end
