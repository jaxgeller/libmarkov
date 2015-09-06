package libmarkov

import "io"

type dictionary map[string][]string

type prefix []string

// Generator for use with generating things
type Generator struct {
	dict dictionary
	text io.Reader
	max  int
}

// NewGenerator creates a new generator instance`
func NewGenerator(t io.Reader) *Generator {
	g := &Generator{text: t, dict: make(dictionary)}
	g.BuildDict()
	g.max = g.setMax()

	return g
}
