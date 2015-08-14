# Libmarkov - Javascript

This implementation runs in the browser and in node.

### Install

will update later


### Browser

Use a commonjs transpiler like [babeljs](https://babeljs.io)

```js
const Markov = require('libmarkov');
let text = 'This is my sample text.';
let generator = new Markov(text);

alert(generator.generate(5));
```


### Node

```js
const Markov = require('libmarkov');
let text = 'This is my sample text.';
let generator = new Markov(text);

console.log(generator.generate(5));
```


### Commandline

```shell
$ libmarkov -s 10 < text.txt
```
