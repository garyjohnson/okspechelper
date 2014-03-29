#import "Kiwi.h"

NSObject* UseTestModuleForInjection(NSObject *testModule);

#define SPEC_BEGIN_WITH_INJECTION(name, objectionTestModule) \
    SPEC_BEGIN(name) \
    \
    __block NSObject *injector; \
    \
    beforeEach(^{ \
        injector = UseTestModuleForInjection([[objectionTestModule alloc] init]); \
    }); \
    \

