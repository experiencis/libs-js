prefix ?= experiencis
bucket_prefix ?= $(prefix)-libs-js
env ?= dev

AWS_PROFILE ?= $(prefix)-$(env)
bucket ?= $(env)-$(bucket_prefix)-storybook
cloudfront ?= $(AWS_CLOUDFRONT_DISTRIBUTION_ID_STORYBOOK)

all: install

install: install-root install-packages build

install-root:
	@yarn --silent install

install-packages:
	@yarn --silent lerna bootstrap

build:
	@yarn --silent lerna run build --stream

test: build test-only

test-only:
	@yarn --silent test --runInBand --coverage

test-local:
	@yarn --silent test --coverage

package-install:
	@yarn --silent lerna bootstrap --scope @experiencis/$(p)

package-build:
	@cd packages/$(p) && yarn --silent build

package-test: package-build
	@cd packages/$(p) && yarn --silent test --coverage --detectOpenHandles

package-clear-test:
	@cd packages/$(p) && yarn --silent jest --clearCache

package-storybook:
	@cd packages/$(p) && yarn --silent story

package-generate-svg-components:
	@cd packages/$(p) && yarn --silent generate-svg-components

package-build-storybook:
	@cd packages/$(p) && yarn --silent build-storybook

publish:
	@yarn --silent lerna publish

changed:
	@yarn --silent lerna changed

deploy: deploy-storybooks invalidate-cache

deploy-storybooks:
	@yarn deploy-storybooks

invalidate-cache:
	@AWS_PROFILE=$(AWS_PROFILE) aws cloudfront create-invalidation --distribution-id $(cloudfront) --paths '/*'

clean: clean-lib clean-modules clean-coverage clean-buildinfo

clean-modules:
	@rm -rf node_modules/
	@find packages/ -name node_modules -type d -exec rm -rf {} +

clean-lib:
	@find packages/ -name lib -type d -exec rm -rf {} +

clean-coverage:
	@rm -rf coverage/
	@find packages/ -name coverage -type d -exec rm -rf {} +

clean-buildinfo:
	@find packages/ -name tsconfig.tsbuildinfo -exec rm -rf {} +

new:
	@yarn --silent yo ./packages/generator-package 2>/dev/null

.PHONY: all \
		install install-root install-packages \
		test \
		build \
		publish \
		new \
		clean-buildinfo clean-modules clean-lib clean-coverage clean \
		package-build package-install package-storybook package-test \
		package-clear-test \
		deploy deploy-storybooks
