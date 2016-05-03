ESLINT = node_modules/.bin/eslint
NPM = npm
XYZ = node_modules/.bin/xyz --repo git@github.com:sanctuary-js/sanctuary-style.git

JSON = $(shell find . -name '*.json' -not -path './node_modules/*' | sort)
SCRIPTS = $(shell find scripts -type f | sort)
FILES = eslint-es3.json eslint-es6.json


.PHONY: all
all: $(FILES)

eslint-%.json: eslint-%-only.json eslint-common.json scripts/eslint-combine
	scripts/eslint-combine eslint-common.json '$<' >'$@'


.PHONY: clean
clean: $(FILES)
	rm -f -- $^


.PHONY: lint
lint:
	printf 'require(\\"%s\\")\n' $(JSON) | xargs node --eval
	$(ESLINT) --config eslint-es6.json --env es6 --env node -- $(SCRIPTS)
	make clean
	make
	git diff --exit-code


.PHONY: release-major release-minor release-patch
release-major release-minor release-patch:
	@$(XYZ) --increment $(@:release-%=%)


.PHONY: setup
setup:
	$(NPM) install
