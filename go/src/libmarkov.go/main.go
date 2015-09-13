package main

import (
	"bufio"
	"os"
	"strconv"

	"libmarkov"
)

func main() {
	var arg string
	if len(os.Args) > 1 {
		arg = os.Args[1]
	} else {
		arg = "10"
	}

	count, err := strconv.Atoi(arg)
	if err != nil {
		os.Exit(1)
	}

	g := libmarkov.NewGenerator(bufio.NewReader(os.Stdin))

	_, err = os.Stdout.WriteString(g.Generate(count))
	if err != nil {
		os.Exit(1)
	}
}
