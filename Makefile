ESLINT = node_modules/.bin/eslint
NPM = npm
XYZ = node_modules/.bin/xyz --repo git@github.com:sanctuary-js/sanctuary-style.git --script scripts/prepublish

JSON = $(shell find . -name '*.json' -not -path './node_modules/*' | sort)
SCRIPTS = $(shell find scripts -type f -not -name prepublish | sort)
FILES = eslint-es3.json eslint-es6.json


.PHONY: all
all: LICENSE $(FILES)

.PHONY: LICENSE
LICENSE:
	cp -- '$@' '$@.orig'
	sed 's/Copyright (c) .* Sanctuary/Copyright (c) $(shell git log --date=short --pretty=format:%ad | sort -r | head -n 1 | cut -d - -f 1) Sanctuary/' '$@.orig' >'$@'
	rm -- '$@.orig'

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
	git checkout -- LICENSE
	git diff --exit-code


.PHONY: release-major release-minor release-patch
release-major release-minor release-patch:
	@$(XYZ) --increment $(@:release-%=%)


.PHONY: setup
setup:
	$(NPM) install
