package main

import (
	"bufio"
	"os"
)

type Chain struct {
	chain map[string]string
}

func main() {
	file, err := os.Open("test/lorem.txt")
	if err != nil {
		panic(err)
	}

	buff := bufio.NewScanner(file)
	buff.Split(bufio.ScanWords)

	var words []string

	dict := make(map[string][]string)

	for buff.Scan() {
		words = append(words, buff.Text())
	}

	for i := 0; i < len(words); i++ {
		if i < len(words)-2 {
			key := words[i] + " " + words[i+1]
			val := words[i+2]

			dict[key] = append(dict[key], val)
		}
	}
}
