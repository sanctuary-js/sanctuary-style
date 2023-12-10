# sanctuary-style

Code should be correct, obviously, but it should also be *stylish*.

This project exports an [ESLint][1] configuration file.

## Usage

```json
"devDependencies": {
  "eslint": "<version>",
  "sanctuary-style": "<version>"
}
```

```make
ESLINT = node_modules/.bin/eslint
ESLINT_OPTS = --config node_modules/sanctuary-style/eslint.json --env node
LIB = $(shell find lib -name '*.js' | sort)

.PHONY: lint
lint:
	$(ESLINT) $(ESLINT_OPTS) -- $(LIB)
```


[1]: https://eslint.org/
