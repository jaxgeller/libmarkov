class Generator
  def initialize(text)
    @text = text
    @dict = self.assembleDict
    @max = @dict.length
  end

  def assembleDict()
    dict = {}
    prefix = []
    @text.scan(/\S+/).each do |word|
      if prefix.length != 0 and prefix[0] != nil
        key = prefix.join(' ')
        dict[key] ||= []
        dict[key] << word
      end

      prefix[0] = prefix[1]
      prefix[1] = word
    end

    return dict
  end

  def generate(count=10)
    sentences = []
    while count > 0 do
      sentences << self.generateSentence()
      count -= 1
    end

    return sentences
  end

  def generateSentence()
    max = @max
    sentence = [].concat(self.get_init_key.split(' '))

    while max > 0 do
      search = sentence.last(2).join(' ')
      val = @dict[search].sample
      sentence << val

      if has_punctuation(val)
        break
      end

      max -= 1
    end

    return sentence.join(' ')
  end

  def is_capital(key)
    key[0] == key[0].upcase
  end

  def has_punctuation(key)
    key.include? '.' or key.include? '!' or key.include? '?'
  end

  def get_random_key
    @dict.to_a.sample(1).to_h.keys.first
  end

  def get_init_key
    key = self.get_random_key
    until is_capital(key) do
      key = self.get_random_key
    end

    return key
  end
end
