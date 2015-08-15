'use strict';

const fs = require('fs');
const assert = require('chai').should();
const Markov = require('../markov');

describe('#constructor', function() {

  describe('Can set prop variables correctly', function() {
    let g = new Markov('This is my sample text.');

    it('#dict', function() {
      JSON.stringify(g.dict).should.equal('{"This is":["my"],"is my":["sample"],"my sample":["text."]}');
    });

    it('#keys', function() {
      JSON.stringify(g.keys).should.equal('["This is","is my","my sample"]');
    });

    it('#maxLength', function() {
      g.maxLength.should.equal(13);
    });
  });
});

describe('#parseText', function() {
  let g = new Markov('This is my sample text.');

  it('should be able to parse text correctly into dict', function() {
    JSON.stringify(g.parseText('This is my sample text.'))
      .should.equal('{"This is":["my"],"is my":["sample"],"my sample":["text."]}');
  });
});

describe('#getRandomKey', function() {
  let g = new Markov(fs.readFileSync(`${__dirname}/lorem.txt`).toString());
  let key = g.getRandomKey();

  it('should return a random string', function() {
    key.should.be.a.string;
  });

  it('should exist in the dict', function() {
    g.dict[key].should.exist;
  });

  it('should have a dict value', function() {
    g.dict[key].should.be.a.string;
  });
});

describe('#getRandomValue', function() {
  let g = new Markov(fs.readFileSync(`${__dirname}/lorem.txt`).toString());
  let key = g.getRandomKey();
  let value = g.getRandomValue(key);

  it('should return a random string', function() {
    value.should.be.a.string;
  });

  it('should exist in the key provided', function() {
    g.dict[key].should.contain(value);
  });
});

describe('#getCapitalizedKey', function() {
  let g = new Markov(fs.readFileSync(`${__dirname}/lorem.txt`).toString());
  let capital = g.getCapitalizedKey();

  it('should return a random string', function() {
    capital.should.be.a.string;
  });

  it('should return a capitalized key', function() {
    capital.charAt(0).should.match(/[A-Z]/);
  });
});

describe('#generate', function() {
  let g = new Markov(fs.readFileSync(`${__dirname}/lorem.txt`).toString());

  it('should return 1 sentence', function() {
    g.generate(1)
      .match(/\.|\?|\!/g).length.should.be.equal(1)
  });

  it('should return 10 sentences', function() {
    g.generate(10)
      .match(/\.|\?|\!/g).length.should.be.equal(10);
  });

  it('should return 100 sentences', function() {
    g.generate(100)
      .match(/\.|\?|\!/g).length.should.be.equal(100)
  });

  it('should return 1000 sentences', function() {
    g.generate(1000)
      .match(/\.|\?|\!/g).length.should.be.equal(1000)
  });

  it('should return 10,000 sentences', function() {
    g.generate(10000)
      .match(/\.|\?|\!/g).length.should.be.equal(10000)
  });

  it('should return 100,000 sentences', function() {
    this.timeout(2000 * 5);

    g.generate(100000)
      .match(/\.|\?|\!/g).length.should.be.equal(100000)
  });

  it('should return 1,000,000 sentences', function() {
    this.timeout(1000 * 60);

    g.generate(1000000)
      .match(/\.|\?|\!/g).length.should.be.equal(1000000)
  });
});
