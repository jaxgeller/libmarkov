require 'spec_helper'

describe Libmarkov do

  it 'has a version number' do
    expect(Libmarkov::VERSION).not_to be nil
  end

  text = File.open("spec/lorem.txt", "r").read
  g = Libmarkov::Generator.new(text)

  it 'inits properly' do
    expect(g).not_to be nil
  end

  it 'assembles dictionary properly' do
    expect(g.dict).not_to be nil
    expect(g.dict.is_a?(Hash)).not_to be nil
    expect(g.dict).to eq(SpecHelper.test_hash)
  end

  it 'creates a sentence correclty' do
    sentence = g.generate_sentence

    expect(sentence).not_to be nil
    expect(sentence.split.length).to be > 1
    expect(sentence.split.first).to eq(sentence.split.first.capitalize)
    expect(sentence.split.last).to match(/\.|\?|\!/)
  end

  it 'generates sentences correctly' do
    sentences = g.generate(1)
    expect(sentences.split(/\.|\?|\!/).length).to eq(1)

    sentences = g.generate(10)
    expect(sentences.split(/\.|\?|\!/).length).to eq(10)

    sentences = g.generate(100)
    expect(sentences.split(/\.|\?|\!/).length).to eq(100)

    sentences = g.generate(1000)
    expect(sentences.split(/\.|\?|\!/).length).to eq(1000)

    sentences = g.generate(10000)
    expect(sentences.split(/\.|\?|\!/).length).to eq(10000)

    sentences = g.generate(100000)
    expect(sentences.split(/\.|\?|\!/).length).to eq(100000)
  end

  # helpers
  it 'is capital should work' do
    expect(g.is_capital('Hello')).to eq(true)
    expect(g.is_capital('hello')).to eq(false)
  end

  it 'is_punctuated should work' do
    expect(g.is_punctuated('Hello there.')).to eq(true)
    expect(g.is_punctuated('Hello there!')).to eq(true)
    expect(g.is_punctuated('Hello there?')).to eq(true)
    expect(g.is_punctuated('Hello there,')).to eq(false)
    expect(g.is_punctuated('Hello there')).to eq(false)
  end

  it 'get_init_key should work' do
    init_key = g.get_init_key()
    expect(init_key).not_to be nil
    expect(init_key.split.length).to eq(2)
    expect(init_key.split[0]).to eq(init_key.split[0].capitalize)
  end

end
