'use strict';

class Markov {

  constructor(text) {
    this.dict = this._parseText(text);
    this.keys = Object.keys(this.dict);

    this.keys.length < 30
      ? this.maxLength = this.keys.length + 10
      : this.maxLength = 30;
  }

  getRandomKey() {
    return this.keys[Math.floor(Math.random() * this.keys.length)];
  }

  getRandomValue(key) {
    return this.dict[key][Math.floor(Math.random() * this.dict[key].length)];
  }

  getCapitalizedKey() {
    let tries = this.maxLength;
    let key;

    while (tries--) {
      key = this.getRandomKey();

      if (/[A-Z]/.test(key.charAt(0)))
        break;
    }

    return key;
  }

  generate(sentenceCount) {
    let sentences = [];

    while (sentenceCount--) {
      this.maxLength = 30;

      let sentence = [];
      let initKey = this.getCapitalizedKey();
      sentence = sentence.concat(initKey.split(' '));

      while (this.maxLength) {
        let search = sentence.slice(-2).join(' ');
        let found = this.getRandomValue(search);
        sentence.push(found);

        if (/\.|\?|\!/.test(sentence.slice(-1))) break;
        this.maxLength = this.maxLength - 1;
      }
      sentences.push(sentence.join(' '));
    }

    return sentences.join(' ')
  }

// private

  _parseText(text) {
    let dict = {};
    text
      .match(/\S+\s*/g)
      .map(function(item) {
        return item.trim();
      })
      .forEach(function(item, index, arr) {
        if (index < arr.length - 2) {
          let key = [item, arr[index + 1]].join(' ');
          dict[key] = dict[key] || [];
          dict[key].push(arr[index + 2]);
        }
      });

    return dict;
  }

  _random() {
    return this.words[key]
      ? this._getRandomElement(this.words[key])
      : this._getRandomElement(this.words[this._getRandomKey()]);
  }

  _last(arr) {
    return arr[arr.length - 1];
  }
} // end class

module.exports = Markov;
