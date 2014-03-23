#import "JSObjection.h"
#import "Kiwi.h"

void UseTestModuleForInjection(JSObjectionModule *testModule);

#define SPEC_BEGIN_WITH_INJECTION(name, objectionTestModule) \
    SPEC_BEGIN(name) \
    \
    __block JSObjectionInjector *injector; \
    \
    beforeEach(^{ \
        UseTestModuleForInjection([[objectionTestModule alloc] init]); \
        injector = [JSObjection defaultInjector]; \
    }); \
    \

