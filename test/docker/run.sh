#!/bin/bash

npm install -g libmarkov
gem install libmarkov
go get -u github.com/jaxgeller/libmarkov/go/cmd

run_bench(impl) {
  echo $(time $imp 1000000 < lorem.txt > /dev/null) >> results.txt
}

run_bench(libmarkov.js)
run_bench(libmarkov.rb)
run_bench(libmarkov.go)
