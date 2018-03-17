'use strict';

/* eslint-env node */

function sum(xs) { return xs.length === 0 ? 0 : xs[0] + sum(xs.slice(1)); }

const foo = x => y => z => [x, y, z];

if (parseInt("foo 'bar' baz", 10) > 0) {
  console.log(1);
} else if (foo.bar == null) {
  console.log(2);
} else {
  console.log(3);
}

const epoch = new Date('1970-01-01T00:00:00.000Z');
if ((foo.bar = {baz: 'baz'})) console.log(epoch);
else console.log(sum(foo(123)(456)(789)));

foo
.bar
.baz
.toUpperCase()
.replace(/^/, '[')
.concat(']');

foo
  .bar
  .baz
  .toUpperCase()
  .replace(/^/, '[')
  .concat(']');

let baz = foo.bar.baz;

baz =
  baz === 'foo' ? 1 :
  baz === 'bar' ? 2 :
  /* otherwise */ 3;

baz -= 1;
baz += 1;

baz = (baz => {
  switch (baz) {
    case 1: return 'foo';
    case 2: return 'bar';
    case 3: return 'baz';
  }
})(baz);

console.log(
  baz === 'baz' ?
    /x/.test(baz) ?
      Math.sin :
    // else
      Math.cos :
  // else
    Math.abs
);

console.log(['foo',
             'bar',
             'baz']);

console.log({foo: 1,
             bar: 2,
             baz: 3});

console.log({
  abc: 0,
  var: 0,
  ['XYZ'.toLowerCase()]: 0,
});

const rules = {
  semi: [
    'error',
    'always',
    {omitLastInOneLineBlock: false},
  ],
  'semi-spacing': [
    'error',
    {before: false, after: true},
  ],
  'semi-style': [
    'error',
    'last',
  ],
};

console.log(rules.semi);
console.log(rules['semi-spacing']);
console.log(rules['semi-style']);
