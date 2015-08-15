'use strict';

class Markov {
  constructor(text) {
    this.dict = this.parseText(text);
    this.keys = Object.keys(this.dict);

    this.keys.length < 30
      ? this.maxLength = this.keys.length + 10
      : this.maxLength = 30;

    this.punct = /\.|\?|\!/;
  }

  parseText(text) {
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

  getRandomKey() {
    return this.keys[Math.floor(Math.random() * this.keys.length)];
  }

  getRandomValue(key) {
    let search;
    this.dict[key]
      ? search = key
      : search = this.getRandomKey();

    return this.dict[search][Math.floor(Math.random() * this.dict[search].length)];
  }

  getCapitalizedKey() {
    let tries = this.maxLength;
    let key;

    while (tries--) {
      key = this.getRandomKey();

      if (/[A-Z]/.test(key.charAt(0)) && !this.punct.test(key))
        break;
    }

    return key.replace(this.punct, '');
  }

  generateSentence() {
    let maxLength = this.maxLength;
    let sentence = [].concat(this.getCapitalizedKey().split(' '));

    while (maxLength--) {
      let search = sentence.slice(-2).join(' ');
      let found = this.getRandomValue(search);
      sentence.push(found);

      if (this.punct.test(sentence.slice(-1))) break;
      if(maxLength === 0) sentence[sentence.length-1] += '.';
    }

    return sentence.join(' ');
  }

  generate(sentenceCount) {
    let sentences = [];

    while (sentenceCount--) {
      sentences.push(this.generateSentence());
    }

    return sentences.join(' ');
  }
}

module.exports = Markov;
