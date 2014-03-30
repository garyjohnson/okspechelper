#import "Kiwi.h"

id UseTestModuleForInjection(id testModule);

#define SPEC_BEGIN_WITH_INJECTION(name, objectionTestModule) \
    SPEC_BEGIN(name) \
    \
    __block id injector; \
    \
    __block id (^getDependency)(id) = ^id(id classOrProtocol) { \
      return [injector performSelector:@selector(getObject:) withObject:classOrProtocol]; \
    }; \
    \
    beforeEach(^{ \
        injector = UseTestModuleForInjection([[objectionTestModule alloc] init]); \
    }); \
    \

