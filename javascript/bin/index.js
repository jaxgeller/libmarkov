#!/usr/bin/env node

'use strict';

const Markov = require('../markov');
const count = process.argv[2] || 5;

let data = '';

process.stdin.on('data', function(buf) {
  data += buf.toString();
});

process.stdin.on('end', function() {
  let g = new Markov(data);
  process.stdout.write(g.generate(count) + '\n');
});
