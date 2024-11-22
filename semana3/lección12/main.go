package main

import (
	"fmt"
	"net/http"
	"os"
	"path/filepath"
	"strings"
)

func main() {
	// Define el directorio donde se encuentran las imágenes
	imageDir := "./imagenes"

	// Crea un handler para servir archivos estáticos desde el directorio de imágenes
	fs := http.FileServer(http.Dir(imageDir))

	// Asigna el handler al servidor web
	http.Handle("/imagenes/", http.StripPrefix("/imagenes/", fs))

	// Crea un handler para listar las imágenes en la página principal
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		files, err := os.ReadDir(imageDir)
		if err != nil {
			http.Error(w, "No se pueden listar las imágenes", http.StatusInternalServerError)
			return
		}

		fmt.Fprintln(w, "<html><body>")
		fmt.Fprintln(w, "<h1>Imágenes de prototipos</h1>")
		for _, file := range files {
			if !file.IsDir() && isImage(file.Name()) {
				imgPath := filepath.Join("/imagenes", file.Name())
				fmt.Fprintf(w, `<div><a href="%s"><img src="%s" style="max-width:200px;"/></a></div>`, imgPath, imgPath)
				fmt.Fprintln(w, "<hr>")
			}
		}
		fmt.Fprintln(w, "</body></html>")
	})

	// Inicia el servidor web en el puerto 8080
	fmt.Println("Servidor iniciado en http://localhost:8080")
	http.ListenAndServe(":8080", nil)
}

// isImage verifica si un archivo tiene una extensión de imagen válida
func isImage(filename string) bool {
	ext := strings.ToLower(filepath.Ext(filename))
	switch ext {
	case ".jpg", ".jpeg", ".png", ".gif", ".bmp", ".webp":
		return true
	default:
		return false
	}
}
