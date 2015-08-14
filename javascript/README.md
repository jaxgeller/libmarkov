# Libmarkov - Javascript

This implementation runs in the browser and in node.

### Install

### Use

### Browser

Use a commonjs transpiler like [babeljs](https://babeljs.io)

```js
const Markov = require('libmarkov');
let text = 'This is my sample text.';
let generator = new Markov(text);

alert(generator.generate(10));
```


### Node

```js
const Markov = require('libmarkov');
let text = require('fs').readFileSync('text.txt').toString();
let generator = new Markov(text);

console.log(generator.generate(10));
```


### Commandline

```shell
$ libmarkov -s 10 < text.txt
```


### API
