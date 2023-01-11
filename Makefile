# Verify env variable is defined.
define is_null
$(if $(strip $($1)),,$(warning "$1" ENV variable is null! "$2"))
endef

# Exits if var isn't defined.
define assert_env_variable
$(if $(strip $($1)),,$(error "$1" ENV variable is required! "$2"))
endef

RUBY := $(shell command -v ruby 2>/dev/null)
HOMEBREW := $(shell command -v brew 2>/dev/null)
BUNDLER := $(shell command -v bundle 2>/dev/null)
JAZZY := $(shell command -v jazzy)

VERSION = v0.0.8
PROJECT_NAME = MobileCI

.PHONY: help
help:
	@echo "Please use \`make <command>' where <command> is one of"
	@echo "  setup              to setup the project and install missing dependencies, if needed."
	@echo "  update             to update dependencies."
	@echo "  test               to run tests."
	@echo "  lint_format        to run swift lint and format."


default: setup

version:
	Scripts/update_makefile.sh
	Scripts/update_changelog.sh

.PHONY: setup
setup:
	$(MAKE) verify_system
	$(MAKE) install_gems
	$(MAKE) install_ios_dependencies

verify_system:
	$(eval $(call assert_env_variable,RUBY))
	$(eval $(call assert_env_variable,BUNDLER))
	$(eval $(call assert_env_variable,HOMEBREW))

install_gems:
	bundle check || bundle install --without=documentation

install_ios_dependencies:
	brew install blender/homebrew-tap/rome
	bundle exec fastlane carthage_ci

update:
	bundle exec fastlane do_cart_update

test:
	bundle exec fastlane test_iphone_pro

lint:
	bundle exec pod lib lint
	
lint_format: format swiftlint

.PHONY: format
format:
	@swiftformat ./Sources/$(PROJECT_NAME) ./Tests --config .swiftformat

.PHONY: swiftlint
swiftlint:
# file_header
	@swiftlint swiftlint --fix Sources/$(PROJECT_NAME)/**/**

.PHONY: docs
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
