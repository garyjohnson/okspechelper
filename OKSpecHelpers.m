#import "OKSpecHelpers.h"

id UseTestModuleForInjection(id testModule) {
    
    id objection = NSClassFromString(@"JSObjection");
    NSObject *injector = [objection performSelector:@selector(createInjector:) withObject:testModule];
    [objection performSelector:@selector(setDefaultInjector:) withObject:injector];
    return injector;
}
