# chicken_box_time

A new Flutter project.

## Flavor's

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