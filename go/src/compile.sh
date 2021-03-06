#!/bin/bash
rm -r ../bin

for GOOS in darwin linux windows; do
  for GOARCH in 386 amd64; do
    export GOOS=$GOOS
    export GOARCH=$GOARCH
    gb build all
  done
done

rm ../bin/libmarkov.go
