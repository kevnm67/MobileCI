RUBY := $(shell command -v ruby 2>/dev/null)
HOMEBREW := $(shell command -v brew 2>/dev/null)
BUNDLER := $(shell command -v bundle 2>/dev/null)
JAZZY := $(shell command -v jazzy)

VERSION = v0.0.8

default: setup

version:
	Scripts/update_makefile.sh
	Scripts/update_changelog.sh

setup: \
	pre_setup \
	check_for_ruby \
	check_for_homebrew \
	install_gems \
	install_ios_dependencies

pre_setup:
	$(info ------------------------------)
	$(info iOS project setup ...)
	$(info ------------------------------)

check_for_ruby:
	$(info Checking for Ruby ...)

ifeq ($(RUBY),)
	$(error Ruby is not installed)
endif

check_for_homebrew:
	$(info Checking for Homebrew ...)

ifeq ($(HOMEBREW),)
	$(error Homebrew is not installed)
endif

install_bundler:
	$(info )$(info Checking and install bundler ...)

ifeq ($(BUNDLER),)
	gem install bundler -v '~> 2.0'
else
	gem update bundler '~> 2.0'
endif

install_gems:
	$(info Install Ruby Gems ...)

ifeq ($(CIRCLECI),)
	$(info Not running on circle CI...)
	$(MAKE) install_bundler
endif

	bundle install --without=documentation

install_ios_dependencies:
	$(info Install iOS dependencies ...)

	brew install blender/homebrew-tap/rome
	bundle exec fastlane carthage_ci

update:
	$(info Install iOS dependencies ...)

	bundle exec fastlane do_cart_update

test:
	bundle exec fastlane test_iphone_pro

lint:
	bundle exec pod lib lint

docs:
	$(info Generating docs...)

ifdef JAZZY
	$(JAZZY) \
	  --clean \
	  --author 'Kevin Morton' \
	  --author_url https://github.com/kevnm67 \
	  --github_url https://github.com/kevnm67/MobileCI \
	  --output docs/ \
else
	@echo Jazzy is missing... failed to install docs
	@exit 1
endif
