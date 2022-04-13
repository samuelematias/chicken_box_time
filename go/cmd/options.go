package main

import (
	"github.com/go-flutter-desktop/go-flutter"
	shared_preferences "github.com/go-flutter-desktop/plugins/shared_preferences"
	share "github.com/lucasmafra/go-flutter-share"
)

var options = []flutter.Option{
	flutter.AddPlugin(&share.SharePlugin{}),
	flutter.AddPlugin(&shared_preferences.SharedPreferencesPlugin{
		VendorName:      "app",
		ApplicationName: "my-app",
	}),
}
