OKSpecHelper
==============

Simple helpers for using [Objection](https://github.com/atomicobject/objection) to inject mocks for [Kiwi](https://github.com/allending/Kiwi) tests. Tries to stay out of the way of normal Objection and Kiwi syntax and usage.
Currently targets iOS 7 with XCTest.

# Installing
To install using Cocoapods, include OKSpecHelper in your Podfile, but only for your test targets:

```
target :'myTests', :exclusive => true do
  pod 'OKSpecHelper'
end
```

# Usage
Set up Objection how you normally would for your targets. 

Create an JSObjectionModule for binding your classes to mocks. Include any dependency that would normally be injected by Objection that you are going to need to mock during test.

```
@interface TestInjectionModule : JSObjectionModule
@end

@implementation TestInjectionModule

- (void)configure {
      [self bind:[NSNotificationCenter nullMock] toClass:[NSNotificationCenter class]];
      [...]
}

@end
```

In each spec, instead of using ```SPEC_BEGIN```, use ```SPEC_BEGIN_WITH_INJECTION```, like so. Note the second parameter, which is the name of the mock injection module.

```
SPEC_BEGIN_WITH_INJECTION(GBGameSpec, TestInjectionModule)
```

Set up the thing you're testing and be sure to call injectDependencies on it, since Objection won't be creating it for you:

```
SPEC_BEGIN_WITH_INJECTION(GBGameSpec, TestInjectionModule)

        describe(@"GBGame", ^{
            __block GBGame *game;

            beforeEach(^{
                game = [[GBGame alloc] init];
                [game injectDependencies];
            });

            [...]

        });

 SPEC_END
```

Finally, you can get ahold of your mocks by using ```injector``` (```[JSObjection defaultInjector]``` also works fine). I usually retrieve and store them in the beforeEach, like so:

```
#import "Kiwi.h"
#import "JSObjection.h"
#import "GBGame.h"
#import "OKSpecHelpers.h"
#import "TestInjectionModule.h"
#import "NSObject+OKInjection.h"

SPEC_BEGIN_WITH_INJECTION(GBGameSpec, TestInjectionModule)

        describe(@"GBGame", ^{
            __block GBGame *game;
            __block NSNotificationCenter *notificationCenterMock;

            beforeEach(^{
                notificationCenterMock = [injector getObject:[NSNotificationCenter class]];

                game = [[GBGame alloc] init];
                [game injectDependencies];
            });

            context(@"when foo", ^{

                it(@"should bar", ^{
                    [game arrange];

                    [[notificationCenterMock should] receive:@selector(assert)];

                    [game act];
                });
            });
        });

 SPEC_END
```

Note that your injection module (and your mocks) will get rebuilt for each test and not reused, so you should be able to use your mocks with async tests (shouldEventually, etc) without any issue.
