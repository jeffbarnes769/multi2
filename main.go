package main

import (
	"fmt"
	"net/http"
)

func helloHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Simple Web Server")
}

func main() {
	http.HandleFunc("/", helloHandler)

	fmt.Println("Started, serving at 8500")
	err := http.ListenAndServe(":8500", nil)
	if err != nil {
		panic("ListenAndServe: " + err.Error())
	}
}
