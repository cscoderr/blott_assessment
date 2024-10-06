# Blott Assessment

## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production


Change the .env.example file to .env and add the required apikey
To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart --dart-define-from-file .env

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart --dart-define-from-file .env

# Production
$ flutter run --flavor production --target lib/main_production.dart --dart-define-from-file .env
```

_\*Blott Assessment works on iOS, Android._