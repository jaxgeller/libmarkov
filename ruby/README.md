# Libmarkov

Ruby implementation for libmarkov

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'libmarkov'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install libmarkov

## Usage

Libmarkov expects the training text to be delivered via a string. This makes it portable between systems.
All you need to do is read some kind of file, db entry, or string into memory and you're good to go.


This will print out 100 sentences based on the training text

```ruby
require "libmarkov"

text = File.open("your_file_here", "r").read
g = Libmarkov::Generator.new(text)

puts g.generate(100)
```
