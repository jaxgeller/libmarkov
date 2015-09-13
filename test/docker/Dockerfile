FROM debian:jessie

ENV NODE_VER=v4.0.0
ENV RUBY_VER=2.2.3
ENV GO_VER=1.5.1
ENV TEXT="http://loripsum.net/api/100/plaintext"

RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
    git curl make binutils bison gcc build-essential \
    libssl-dev libgdbm-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3

# Install node
RUN \
  curl -sSLO "https://nodejs.org/download/release/$NODE_VER/node-$NODE_VER-linux-x64.tar.gz" && \
  tar -xzf "node-$NODE_VER-linux-x64.tar.gz" -C /usr/local --strip-components=1

# Install ruby
RUN \
  mkdir -p /usr/src/ruby && \
  curl -sSLO "https://cache.ruby-lang.org/pub/ruby/ruby-$RUBY_VER.tar.gz" && \
  tar -xzf "ruby-$RUBY_VER.tar.gz" -C /usr/src/ruby --strip-components=1 && \
  cd /usr/src/ruby && \
  ./configure --disable-install-doc && make install && \
  echo 'install: --no-document\nupdate: --no-document' >> ~/.gemrc && \
  gem update --system && \
  rm -rf /usr/src/ruby

# Install go
RUN \
  curl -sSLO "https://golang.org/dl/go$GO_VER.linux-amd64.tar.gz" && \
  tar -xzf "go$GO_VER.linux-amd64.tar.gz" -C /usr/local --strip-components=1
# need to set goroot

# Set up tests
RUN \
  mkdir -p /tests && \
  cd /tests && \
  curl -sSL "$TEXT" -o lorem.txt && \
  npm install libmarkov.js && \
  gem install libmarkov.rb && \
  go get -u https://github.com/jaxgeller/libmarkov/go/cmd/libmarkov.go
