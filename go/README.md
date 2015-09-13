This one was tricky. Having a mulit-language project does not play well with go what-so-ever.

I ended up using the [gb tool](http://getgb.io/) so I could have a prject based `$GOROOT`. This worked decently well, but definitely has some drawbacks.

Making the libmarkov.go cmd go gettable wont be possible for a while. Stil figuring it out. So for now if you want to use a binary, use the bin folder.

As for using the lib programatically you can get it by running

```bash
$ go get github.com/jaxgeller/libmarkov/go/src/libmarkov
```

Then in go

```go
import "github.com/jaxgeller/libmarkov/go/src/libmarkov"
```

It's not elegant, and Im on the lookout for another solution. But for now, it works.
