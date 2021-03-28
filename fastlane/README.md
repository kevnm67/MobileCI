fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
## iOS
### ios test_mac
```
fastlane ios test_mac
```
Run tests for mac
### ios test_tv_os
```
fastlane ios test_tv_os
```
Run tests for tvOS
### ios run_tests_for_device
```
fastlane ios run_tests_for_device
```


Run tests generating code coverage


### ios run_rome_update
```
fastlane ios run_rome_update
```
If running in CI environment returns the build number; Else, get_build_number.to_s.

Runs carthage update followed by Rome upload (iOS) to update the S3 cache.

Options:

cache_prefix - optional.  Default is project_base_name.


### ios test_iphone_x
```
fastlane ios test_iphone_x
```
Run tests using iphone X sim
### ios test_iphone_pro
```
fastlane ios test_iphone_pro
```
Run tests using iPhone Pro
### ios do_cart_update
```
fastlane ios do_cart_update
```
Runs carthage update followed by Rome upload (iOS) to update the S3 cache.


### ios carthage_bootstrap
```
fastlane ios carthage_bootstrap
```
Runs carthage bootstrap followed by Rome download (iOS) from our S3 cache


### ios carthage_ci
```
fastlane ios carthage_ci
```
Download carthage dependencies cached in S3



----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
