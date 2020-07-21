package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"strings"
)

func main() {
	去1A尾行 := false
	if len(os.Args) > 1 {

		data, err := ioutil.ReadFile(os.Args[1])
		if err != nil {
			fmt.Println(err)
		}

		s := strings.Split(string(data), "\r\n")

		if len(s[len(s)-1]) <= 1 {
			s = s[:len(s)-1]
			去1A尾行 = true
		}

		wd := ""
		for i, t := range s {
			wd += t
			if i < (len(s) - 1) {
				wd += "\r\n"
			}
		}
		werr := ioutil.WriteFile(os.Args[1], []byte(wd), 0644)
		if werr != nil {
			fmt.Println(werr)
		}
		if 去1A尾行 {
			fmt.Println("完成修正")
		}
	}
}
