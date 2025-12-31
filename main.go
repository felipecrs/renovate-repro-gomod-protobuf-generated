package main

import (
	"fmt"

	"example.com/repro/api"
	"github.com/pkg/errors"
)

func main() {
	msg := &api.HelloRequest{Name: "World"}
	fmt.Println(msg)
	err := errors.New("an error")
	fmt.Println(err)
}
