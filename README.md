# sanctuary-style

Code should be correct, obviously, but it should also be *stylish*.

This project exports [ESLint][1] configuration files targeting ES3 and ES6.

## Usage

```json
"devDependencies": {
  "eslint": "<version>",
  "sanctuary-style": "<version>"
}
```

```make
ESLINT = node_modules/.bin/eslint
ESLINT_OPTS = --config node_modules/sanctuary-style/eslint-es6.json --env es6 --env node
LIB = $(shell find lib -name '*.js' | sort)

.PHONY: lint
lint:
	$(ESLINT) $(ESLINT_OPTS) -- $(LIB)
```


[1]: http://eslint.org/
