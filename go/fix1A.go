package main

import (
	"fmt"
	"io/ioutil"
	"os"
)

func main() {
	if len(os.Args) > 1 {
		data, err := ioutil.ReadFile(os.Args[1])
		if err != nil {
			fmt.Println(err)
		}
		if data[len(data)-1] == 26 {
			data = data[:len(data)-3]
			werr := ioutil.WriteFile(os.Args[1], data, 0644)
			if werr != nil {
				fmt.Println(werr)
			}
			println("ok")
		}
	}
}
