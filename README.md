objection-kiwi
==============

Simple helpers for using Objection framework with Kiwi tests.

# Installing
To install using Cocoapods, include objection-kiwi in your Podfile, but only for your test targets:

```
target :'myTests', :exclusive => true do
  pod 'OKSpecHelper'
end
```

Set up Objection how you normally would for your targets. 
