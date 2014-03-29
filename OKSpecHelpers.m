#import "OKSpecHelpers.h"

NSObject* UseTestModuleForInjection(NSObject *testModule) {
    
    NSObject *objection = NSClassFromString(@"JSObjection");
    NSObject *injector = [objection performSelector:@selector(createInjector:) withObject:testModule];
    [objection performSelector:@selector(setDefaultInjector:) withObject:injector];
    return injector;
}
