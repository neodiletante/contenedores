package main

import (
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestGetSystemInfo(t *testing.T) {
	info := getSystemInfo()
	if info.OS == "" {
		t.Errorf("Expected non-empty OS, got %s", info.OS)
	}
	if info.Arch == "" {
		t.Errorf("Expected non-empty Arch, got %s", info.Arch)
	}
	if info.CPUs <= 0 {
		t.Errorf("Expected CPUs greater than 0, got %d", info.CPUs)
	}
	if info.GoVersion == "" {
		t.Errorf("Expected non-empty GoVersion, got %s", info.GoVersion)
	}
	if info.TotalMemory <= 0 {
		t.Errorf("Expected TotalMemory greater than 0, got %d", info.TotalMemory)
	}
}

func TestSystemInfoHandler(t *testing.T) {
	req, err := http.NewRequest("GET", "/", nil)
	if err != nil {
		t.Fatal(err)
	}

	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(systemInfoHandler)
	handler.ServeHTTP(rr, req)

	if status := rr.Code; status != http.StatusOK {
		t.Errorf("handler returned wrong status code: got %v want %v", status, http.StatusOK)
	}

	expectedContentType := "application/json"
	if rr.Header().Get("Content-Type") != expectedContentType {
		t.Errorf("handler returned wrong content type: got %v want %v", rr.Header().Get("Content-Type"), expectedContentType)
	}
}
