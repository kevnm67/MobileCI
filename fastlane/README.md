fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios test_mac

```sh
[bundle exec] fastlane ios test_mac
```

Run tests for mac

### ios test_tv_os

```sh
[bundle exec] fastlane ios test_tv_os
```

Run tests for tvOS

### ios run_tests_for_device

```sh
[bundle exec] fastlane ios run_tests_for_device
```



Run tests generating code coverage



### ios run_rome_update

```sh
[bundle exec] fastlane ios run_rome_update
```

If running in CI environment returns the build number; Else, get_build_number.to_s.

Runs carthage update followed by Rome upload (iOS) to update the S3 cache.

Options:

cache_prefix - optional.  Default is project_base_name.



### ios test_iphone_x

```sh
[bundle exec] fastlane ios test_iphone_x
```

Run tests using iphone X sim

### ios test_iphone_pro

```sh
[bundle exec] fastlane ios test_iphone_pro
```

Run tests using iPhone Pro

### ios do_cart_update

```sh
[bundle exec] fastlane ios do_cart_update
```

Runs carthage update followed by Rome upload (iOS) to update the S3 cache.



### ios carthage_bootstrap

```sh
[bundle exec] fastlane ios carthage_bootstrap
```

Runs carthage bootstrap followed by Rome download (iOS) from our S3 cache



### ios carthage_ci

```sh
[bundle exec] fastlane ios carthage_ci
```

Download carthage dependencies cached in S3



----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
