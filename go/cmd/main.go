package main

import (
	"bufio"
	"os"
	"strconv"

	"github.com/jaxgeller/libmarkov"
)

func main() {

	count, err := strconv.Atoi(os.Args[1])
	if err != nil {
		os.Exit(1)
	}

	g := libmarkov.NewGenerator(bufio.NewReader(os.Stdin))

	_, err = os.Stdout.WriteString(g.Generate(count))
	if err != nil {
		os.Exit(1)
	}
}
