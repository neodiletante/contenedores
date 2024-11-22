package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
)

func listFiles(w http.ResponseWriter, r *http.Request) {
	files, err := ioutil.ReadDir("/uploads")
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	for _, f := range files {
		fmt.Fprintf(w, "%s\n", f.Name())
	}
}

func main() {
	http.HandleFunc("/list", listFiles)
	http.ListenAndServe(":6000", nil)
}
