package main

import (
	"fmt"
	// "github.com/davecgh/go-spew/spew"
	"strings"
	"unicode"
)

type Prefix []string

var s_test = "Detective Allen Gamble is a mild-mannered forensic accountant. Hot-tempered detective Terry 'Yankee Clipper' Hoitz is partnered with Allen ever since he mistakenly shot Derek Jeter during the World Series. Allen and Terry receive no respect from the other officers, particularly detectives Martin and Fosse. Allen and Terry receive no discipline from the few other officers Danson and Highsmith. All but Terry idolize cocky detectives Chris Danson and PK Highsmith, who are considered the city's best policemen even though they frequently cause millions of dollars in property damage catching petty criminals. During a pursuit, Danson and Highsmith leap to their deaths after misjudging their ability to survive a fall, which causes the precinct to wonder why they did it and who will take their place. Allen and Terry investigate a scaffolding permit violation by multi-billionaire David Ershon but wind up uncovering a much bigger plot by Ershon to cover his losses to his client Lendl Global. Lendl CEO Pamela Boardman hires a team of mercenaries led by Roger Wesley to make sure Ershon pays her back. During their investigation, Allen confides in Terry about how he ran a college dating service, though he disputes that he was a pimp. When Allen's life spiraled out of control, he was sent to the hospital where he met his future wife Sheila, and he promised Sheila that he would never get out of control again. When Sheila tells Allen that she's pregnant, Allen reverts to his old dark personality, and she kicks him out. Meanwhile, Terry unsuccessfully attempts to reconnect with his ex-fiance Francine, who walked out on him due to his temper. Their investigation comes to a halt when Ershon's attorney, Don Beaman, learns of his plan to cover his losses, leading Wesley to kill him and make it look like a suicide."

func get_random_key(m map[string][]string) string {
	for k := range m {
		return k
	}
	return ""
}

func is_capital(s string) bool {
	r := []rune(s)
	if unicode.IsUpper(r[0]) {
		return true
	} else {
		return false
	}
}

func main() {
	r := strings.NewReader(s_test)
	p := make(Prefix, 2)
	c := make(map[string][]string)
	var s string

	// generate chain
	for {
		if _, err := fmt.Fscan(r, &s); err != nil {
			break
		}

		key := strings.Join(p, " ")

		c[key] = append(c[key], s)
		copy(p, p[1:])
		p[1] = s
	}

	// get starting key
	k := get_random_key(c)
	for {

		if is_capital(k) {
			break
		} else {
			k = get_random_key(c)
		}
	}

	init := strings.Split(k, " ")

	var sentence []string
	sentence = append(sentence, init[0])
	sentence = append(sentence, init[1])

	for i := 0; i < 10; i++ {
		// get last two elements
		search := strings.Join(sentence[len(sentence)-2:], " ")
		sentence = append(sentence, c[search][0])
	}
	fmt.Println(sentence)

}
