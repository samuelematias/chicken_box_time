package main

import (
	"fmt"
	"image"
	_ "image/png"
	"os"
	"path/filepath"
	"strconv"
	"strings"

	"github.com/go-flutter-desktop/go-flutter"
	"github.com/pkg/errors"
)

// vmArguments may be set by hover at compile-time
var vmArguments string

func main() {
	// DO NOT EDIT, add options in options.go

	mainOptions := []flutter.Option{
		flutter.OptionVMArguments(strings.Split(vmArguments, ";")),
		flutter.WindowIcon(iconProvider),
		getSizeFromEnv(),
	}
	err := flutter.Run(append(options, mainOptions...)...)
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}

func getSizeFromEnv() flutter.Option {
	h, err := strconv.Atoi(os.Getenv("HOVER_HEIGHT"))
	if err != nil {
		h = 720
		fmt.Printf("[WARNING] 'HOVER_HEIGHT' not set or set to an invalid value. Using default value %d.\n", h)
	}
	w, err := strconv.Atoi(os.Getenv("HOVER_WIDTH"))
	if err != nil {
		w = 380
		fmt.Printf("[WARNING] 'HOVER_WIDTH' not set or set to an invalid value. Using default value %d.\n", w)
	}

	return flutter.WindowInitialDimensions(w, h)
}

func iconProvider() ([]image.Image, error) {
	execPath, err := os.Executable()
	if err != nil {
		return nil, errors.Wrap(err, "failed to resolve executable path")
	}
	execPath, err = filepath.EvalSymlinks(execPath)
	if err != nil {
		return nil, errors.Wrap(err, "failed to eval symlinks for executable path")
	}
	imgFile, err := os.Open(filepath.Join(filepath.Dir(execPath), "assets", "icon.png"))
	if err != nil {
		return nil, errors.Wrap(err, "failed to open assets/icon.png")
	}
	img, _, err := image.Decode(imgFile)
	if err != nil {
		return nil, errors.Wrap(err, "failed to decode image")
	}
	return []image.Image{img}, nil
}
