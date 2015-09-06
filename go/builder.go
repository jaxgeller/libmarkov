package libmarkov

import (
	"fmt"
	"strings"
)

func canBuildDict(p []string) bool {
	if len(p[0]) != 0 && len(p[1]) != 0 {
		return true
	}
	return false
}

func (g *Generator) setMax() int {
	l := len(g.dict)
	if l < 30 {
		return l + 5
	}
	return 30
}

// BuildDict builds the dictionary for the generator
func (g *Generator) BuildDict() {
	var word string
	var key string
	prefix := make(prefix, 2)

	for {
		if _, err := fmt.Fscan(g.text, &word); err != nil {
			break
		}
		if canBuildDict(prefix) {
			key = strings.Join(prefix, " ")
			g.dict[key] = append(g.dict[key], word)
		}

		prefix[0] = prefix[1]
		prefix[1] = word
	}
}
