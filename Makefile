ESLINT = node_modules/.bin/eslint
NPM = npm
XYZ = node_modules/.bin/xyz --branch main --repo git@github.com:sanctuary-js/sanctuary-style.git --script scripts/prepublish

JSON = $(shell find . -name '*.json' -not -path './node_modules/*' | sort)


.PHONY: all
all: LICENSE

.PHONY: LICENSE
LICENSE:
	cp -- '$@' '$@.orig'
	sed 's/Copyright (c) .* Sanctuary/Copyright (c) $(shell git log --date=short --pretty=format:%ad | sort -r | head -n 1 | cut -d - -f 1) Sanctuary/' '$@.orig' >'$@'
	rm -- '$@.orig'


.PHONY: lint
lint:
	printf 'require(\\"%s\\")\n' $(JSON) | xargs node --eval
	$(ESLINT) --config eslint-es3.json -- example-es3.js
	$(ESLINT) --config eslint-es6.json -- example-es6.js


.PHONY: release-major release-minor release-patch
release-major release-minor release-patch:
	@$(XYZ) --increment $(@:release-%=%)


.PHONY: setup
setup:
	$(NPM) install
