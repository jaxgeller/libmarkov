package libmarkov

import (
	"math/rand"
	"strings"
	"time"
	"unicode"
)

const punctuation string = ".!?"

func isCapital(s string) bool {
	r := []rune(s)

	if unicode.IsUpper(r[0]) && !strings.ContainsAny(s, punctuation) {
		return true
	}
	return false
}

func (g *Generator) getRandomKey() string {
	for k := range g.dict {
		return k
	}

	return ""
}

func (g *Generator) getInitKey() string {
	k := g.getRandomKey()
	for {
		if isCapital(k) {
			return k
		}

		k = g.getRandomKey()
	}
}

// Generate sentences
func (g *Generator) Generate(count int) string {
	var allSentences []string
	rand.Seed(time.Now().UTC().UnixNano())

	for i := 0; i < count; i++ {
		sentence := strings.Split(g.getInitKey(), " ")

		for i := 0; i < g.max; i++ {
			search := strings.Join(sentence[len(sentence)-2:], " ")
			if strings.ContainsAny(search, punctuation) {
				break
			}

			choices := g.dict[search]
			sentence = append(sentence, choices[rand.Intn(len(choices))])
		}

		allSentences = append(allSentences, strings.Join(sentence, " "))
	}

	return strings.Join(allSentences, " ") + "\n"
}
