# lpdv_tv

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

1. ACHITECTURE

lib/
├── main_development.dart
├── main_staging.dart
├── main_production.dart
└── config/
    └── env.dart


2. Build APK Release par Flavor

# Development
fvm flutter build apk --release --flavor development --target lib/main_development.dart --split-per-abi

# Staging
fvm flutter build apk --release --flavor staging --target lib/main_staging.dart --split-per-abi

# Production
fvm flutter build apk --release --flavor production --target lib/main_production.dart --split-per-abi




# CMD : permet de gener une l'icon de l'application
dart run flutter_launcher_icons

