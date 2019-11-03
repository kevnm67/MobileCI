RUBY := $(shell command -v ruby 2>/dev/null)
HOMEBREW := $(shell command -v brew 2>/dev/null)
BUNDLER := $(shell command -v bundle 2>/dev/null)
JAZZY := $(shell command -v jazzy)

default: setup

setup: \
	pre_setup \
	check_for_ruby \
	check_for_homebrew \
	install_bundler \
	install_gems \
	install_ios_dependencies

pre_setup:
	$(info ------------------------------)
	$(info iOS project setup ...)
	$(info ------------------------------)

ifeq ($(TRAVIS),true)
	$(info Running in CI environment)
endif

check_for_ruby:
	$(info )
	$(info Checking for Ruby ...)

ifeq ($(RUBY),)
	$(error Ruby is not installed)
endif

check_for_homebrew:
	$(info )
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
	$(info )
	$(info Install Ruby Gems ...)

	bundle install --without=documentation

install_ios_dependencies:
	$(info )
	$(info Install iOS dependencies ...)

	bundle exec fastlane carthage_ci

update_ios_dependencies:
		$(info )
		$(info Install iOS dependencies ...)

		bundle exec fastlane do_cart_update

danger:
	bundle exec danger

test:
	bundle exec fastlane test_iphone_pro

lint:
	bundle exec pod lib lint

generate_docs:
	$(info )
	$(info Generating docs...)

ifdef JAZZY
	$(JAZZY) \
	  --clean \
	  --author 'Kevin Morton' \
	  --author_url https://github.com/kevnm67 \
	  --github_url https://github.com/kevnm67/CircleCI \
	  --output docs/ \
else
	@echo Jazzy is missing... failed to install docs
	@exit 1
endif
