package main

import (
	"encoding/json"
	"fmt"
	"net/http"
	"runtime"
)

type SystemInfo struct {
	OS           string `json:"os"`
	Arch         string `json:"arch"`
	CPUs         int    `json:"cpus"`
	GoVersion    string `json:"go_version"`
	TotalMemory  uint64 `json:"total_memory"`
}

func getSystemInfo() SystemInfo {
	return SystemInfo{
		OS:        runtime.GOOS,
		Arch:      runtime.GOARCH,
		CPUs:      runtime.NumCPU(),
		GoVersion: runtime.Version(),
		TotalMemory: getTotalMemory(),
	}
}

func getTotalMemory() uint64 {
	var mem runtime.MemStats
	runtime.ReadMemStats(&mem)
	return mem.Sys
}

func systemInfoHandler(w http.ResponseWriter, r *http.Request) {
	info := getSystemInfo()
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(info)
}

func main() {
	http.HandleFunc("/", systemInfoHandler)
	fmt.Println("Server is running on port 8080...")
	http.ListenAndServe(":8080", nil)
}
