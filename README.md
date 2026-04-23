# Shu

A Flutter fashion e-commerce application for browsing and purchasing clothing — including Abayas, Gowns, and Occasion Wear.

## Features

- **Home** — Landing page showcasing featured collections
- **Catalogue** — Browse products with category filtering
- **Cart** — Add and manage items before checkout

## Tech Stack

| Package | Purpose |
|---|---|
| [Flutter](https://flutter.dev) | Cross-platform UI framework (iOS, Android, Web) |
| [Riverpod](https://riverpod.dev) + `riverpod_generator` | Reactive state management & dependency injection |
| [GoRouter](https://pub.dev/packages/go_router) | Declarative navigation and deep linking |
| [Freezed](https://pub.dev/packages/freezed) | Immutable data classes with `copyWith` and pattern matching |
| [cached_network_image](https://pub.dev/packages/cached_network_image) | Efficient network image loading and caching |
| [google_fonts](https://pub.dev/packages/google_fonts) | Custom typography |

## Project Structure

The project follows a **feature-first** architecture with a shared `core` layer.

```
lib/
├── core/
│   ├── design_system/      # App theme, colours, and typography
│   ├── router/             # GoRouter configuration and route definitions
│   └── widgets/            # Shared widgets (ProductCard, StoreButton, AppShell)
├── features/
│   ├── home/               # Home page
│   ├── catalogue/          # Product listing, category filter, and product model
│   └── cart/               # Cart item model and cart state provider
└── main.dart               # App entry point (ProviderScope → MyApp)
```

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) ≥ 3.x  
  Run `flutter doctor` to verify your setup.

### Installation

1. Clone the repository
   ```sh
   git clone https://github.com/your_username/shu.git
   cd shu
   ```

2. Install dependencies
   ```sh
   flutter pub get
   ```

3. Run code generation (Riverpod, Freezed, JSON serialisation)
   ```sh
   dart run build_runner build --delete-conflicting-outputs
   ```

4. Run the app
   ```sh
   flutter run
   ```

### Running on a specific platform

```sh
flutter run -d chrome      # Web
flutter run -d ios         # iOS simulator
flutter run -d android     # Android emulator
```

## Code Generation

This project uses `build_runner` for generating boilerplate. Re-run generation whenever you modify annotated files (`@riverpod`, `@freezed`, `@JsonSerializable`):

```sh
dart run build_runner watch --delete-conflicting-outputs
```

## Running Tests

```sh
flutter test
```
