# Libmarkov - Javascript

[![npm version](https://badge.fury.io/js/libmarkov.svg)](http://badge.fury.io/js/libmarkov)

This implementation runs in the browser and in node.

## Install

```shell
$ npm install libmarkov [-g]
```

### Use
Create a new instance, with the constructor params being a string of the training text.
Then call `.generate` with the number of sentences you'd like to generate.

The constructor always takes in a string, making it more accesible for both the browser and node. See examples below for clarification.

### Browser

Using an ES6 and CommonJS transpiler, like [Babel](https://babeljs.io):

```js
import Markov from 'libmarkov'

let text = document.getElementById('myinput').value;
let generator = new Markov(text);

document.getElementById('myresults').textContent = generator.generate(10)
```

### Node

```js
const Markov = require('libmarkov');

let text = require('fs').readFileSync('text.txt').toString() || "My test string here";
let generator = new Markov(text);

console.log(generator.generate(10));
```

### Command Line

```shell
$ libmarkov 10 < text.txt
$ echo 'This is my training text.' | libmarkov 10
```
