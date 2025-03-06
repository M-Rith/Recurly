# Flutter GetX Project

A Flutter project structured using **GetX** for state management, dependency injection, and routing. This project follows a modular approach to ensure scalability and maintainability.

## 📂 Project Structure

```
flutter_getx_project/
│── android/              # Native Android code
│── ios/                  # Native iOS code
│── lib/
│ ├── main.dart           # App entry point
│ ├── app/                # Core application directory
│ │ ├── routes/           # Route management
│ │ │ ├── app_routes.dart # Route names
│ │ │ ├── app_pages.dart  # GetX page bindings
│ │ ├── bindings/         # Dependency injection bindings
│ │ ├── controllers/      # GetX controllers for state management
│ │ ├── data/             # Data layer (Models, Repositories, Providers)
│ │ │ ├── models/         # Data models
│ │ │ ├── providers/      # API calls & local storage
│ │ │ ├── repositories/   # Handles data fetching
│ │ ├── services/         # Services (Auth, Database, etc.)
│ │ ├── utils/            # Utility functions, helpers
│ │ ├── themes/           # Light/Dark themes
│ │ ├── translations/     # Multi-language support
│ ├── presentation/       # UI layer
│ │ ├── screens/          # Screens
│ │ │ ├── home/           # Home module
│ │ │ │ ├── home_screen.dart
│ │ │ ├── auth/           # Authentication module
│ │ │ │ ├── login_screen.dart
│ │ ├── widgets/          # Reusable UI components
│── test/                 # Unit and widget tests
│── integration_test/      # Integration tests
│── pubspec.yaml          # Dependencies
│── README.md             # Documentation
│── .gitignore            # Ignore unnecessary files
```

## 🚀 Getting Started

### 1️⃣ Prerequisites

Ensure you have the following installed:

- Flutter SDK (latest stable version) - [Download](https://flutter.dev/docs/get-started/install)
- Dart SDK (included with Flutter)
- Android Studio / VS Code (for IDE)
- Emulator or physical device

### 2️⃣ Installation

Clone the repository:

```sh
git clone https://github.com/your-repo/flutter_getx_project.git
cd flutter_getx_project
```

Install dependencies:

```sh
flutter pub get
```

Run the project:

```sh
flutter run
```

## 📌 Key Features

- **GetX for State Management**: Efficient and lightweight state management solution.
- **Modular Architecture**: Separation of concerns for better scalability.
- **GetX Routing**: Fast and easy-to-use route navigation.
- **Dependency Injection**: GetX Bindings for better lifecycle management.
- **REST API Integration**: Using Providers & Repositories pattern.
- **Theming**: Supports both Light and Dark themes.
- **Multi-Language Support**: Localization using GetX Translations.
- **Unit & Integration Testing**: Testing setup included.

## 🛠️ Dependencies

Key dependencies used:

```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.5  # GetX for state management & routing
  http: ^0.13.4  # API requests
  shared_preferences: ^2.0.13  # Local storage
  flutter_localizations:
    sdk: flutter  # Multi-language support
  cupertino_icons: ^1.0.4  # iOS style icons
```

## 📄 License

This project is licensed under the **MIT License**. Feel free to use and modify as needed.

---

### 👨‍💻 Author

Developed by [Your Name] - Feel free to contribute!

For any issues, feel free to open a GitHub issue or reach out. 🚀
