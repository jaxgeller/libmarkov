require "libmarkov/version"

module Libmarkov
  class Generator
    attr_accessor :dict

    def initialize(text)
      @text = text
      @initKeys = []
      @dict = self.assembleDict
      # @keys = @dict.keys
      @max = 30
    end

    def assembleDict()
      dict = {}
      prefix = []

      @text.scan(/\S+/).each do |word|

        if prefix.length != 0 and prefix[0] != nil
          key = prefix.join(' ')
          dict[key] ||= []
          dict[key] << word

          if is_capital(key)
            @initKeys << key
          end
        end

        prefix[0] = prefix[1]
        prefix[1] = word
      end

      return dict
    end

    def is_capital(key)
      key[0] == key[0].upcase
    end

    def get_init_key()
      @initKeys.sample
    end

    def is_punctuated(key)
      key[/\.|\?|\!/] != nil
    end

    def generate_sentence()
      sentence = [].concat(get_init_key.split(' '))

      @max.times do
        search = sentence.last(2).join(' ')
        val = @dict[search].sample
        sentence << val
        break if is_punctuated(val)
      end

      sentence.join(' ')
    end

    def generate(count=10)
      sentences = []
      count.times do
        sentences << self.generate_sentence()
      end

      sentences.join(' ')
    end


  end
end
