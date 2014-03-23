#import "OKSpecHelpers.h"

void UseTestModuleForInjection(JSObjectionModule *testModule) {
    JSObjectionInjector *injector = [JSObjection createInjector:testModule];
    [JSObjection setDefaultInjector:injector];
}
