test_string  = "This is my 'test' string! This is your favorite string."
dict = {}

words = test_string.scan(/\S+/)

words.each_index do |i|
  if words[i+2]
    key = "#{words[i]} #{words[i+1]}"

    (dict[key] ||= []) << words[i+2]
  end
end

# begin generating

first_key = dict.keys.sample
while !/[[:upper:]]/.match(first_key[0])
  first_key = dict.keys.sample
end

sentence = []

first_key = first_key.split
sentence << first_key[0]
sentence << first_key[1]



g = 10

while g > 0
  key = sentence.last(2).join(' ')
  sentence << dict[key]
  g = g -1
end

puts sentence
