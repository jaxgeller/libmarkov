text = File.read('test/lorem.txt')

class Markov
  def initialize(text)
    @dict = {}
    @maxLength = 30
  end

  def parse(text)
    f = text.scan(/\S+\s*/).each do |match, x, y|
    end
  end
end


m = Markov.new(text)

m.parse(text)
