# chicken_box_time

A new Flutter project.

## Flavor's 🍨

- [x] Android
- [x] iOS

### For building `development` environment :

```sh
flutter run --flavor development -t lib/main_development.dart
```

### For building `staging` environment :

```sh
flutter run --flavor staging -t lib/main_staging.dart
```

### For building `production` environment :

```sh
flutter run --flavor production -t lib/main_production.dart
```
### Run Flavor's in debug mode

In VsCode, add this config in your `.vscode/launch.json`:

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "development",
            "request": "launch",
            "type": "dart",
            "args": [
                "-t",
                "lib/main_development.dart",
                "--flavor",
                "development"
            ]
        },
        {
            "name": "staging",
            "request": "launch",
            "type": "dart",
            "args": [
                "-t",
                "lib/main_staging.dart",
                "--flavor",
                "staging"
            ]
        },
        {
            "name": "production",
            "request": "launch",
            "type": "dart",
            "args": [
                "-t",
                "lib/main_production.dart",
                "--flavor",
                "production"
            ]
        }
    ]
}
```

---

## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:very_good_example_app/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>pt</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_pt.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_pt.arb`

```arb
{
    "@@locale": "pt",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado na AppBar da Counter Page"
    }
}
```

[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
