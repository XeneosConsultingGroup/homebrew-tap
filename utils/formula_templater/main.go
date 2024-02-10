package main

import (
	_ "embed"
	"fmt"
	"io"
	"os"
	"strings"
	"text/template"
)

//go:embed templates/private.tmpl
var privateTemplate string

//go:embed templates/public.tmpl
var publicTemplate string

type Formula struct {
	Product    string
	Name       string
	ReleaseUrl string
	SHA256     string
	Version    string
	Visibility string
}

func printFormula(
	product string,
	releaseUrl string,
	sha string,
	version string,
	visibility string,
	out io.Writer,
) error {
	formulaName := strings.ToUpper(
		strings.Split(product, "")[0],
	) + strings.Join(
		strings.Split(product, "")[1:],
		"",
	)
	formulaConfig := Formula{
		Product:    product,
		Name:       formulaName,
		ReleaseUrl: releaseUrl,
		SHA256:     sha,
		Version:    version,
		Visibility: visibility,
	}

	t := template.Must(template.New("Formula").Parse(privateTemplate))
	return t.Execute(out, formulaConfig)
}

func main() {
	i := 0
	product := os.Args[i+1]
	releaseUrl := os.Args[i+2]
	sha := os.Args[i+3]
	version := os.Args[i+4]
	visibility := os.Args[i+5]

	err := printFormula(product, releaseUrl, sha, version, visibility, os.Stdout)
	if err != nil {
		fmt.Println("Error: ", err)
		os.Exit(1)
	}
	os.Exit(0)
}
