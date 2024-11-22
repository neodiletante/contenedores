package main

import (
    "bytes"
    "io"
    "os"
    "testing"
)

func TestMain(t *testing.T) {
    expected := "hello, world\n"
    result := captureOutput(main)
    if result != expected {
        t.Errorf("Expected %v, but got %v", expected, result)
    }
}

// captureOutput captura la salida de la función main para comparar en las pruebas
func captureOutput(f func()) string {
    r, w, _ := os.Pipe()
    original := os.Stdout
    os.Stdout = w

    f()

    w.Close()
    os.Stdout = original
    var buf bytes.Buffer
    io.Copy(&buf, r)
    return buf.String()
}

