# recurly app

flutter_getx_project/
│── android/ # Native Android code
│── ios/ # Native iOS code
│── lib/
│ ├── main.dart # App entry point
│ ├── app/ # Core application directory
│ │ ├── routes/ # Route management
│ │ │ ├── app_routes.dart # Route names
│ │ │ ├── app_pages.dart # GetX page bindings
│ │ ├── bindings/ # Dependency injection bindings
│ │ ├── controllers/ # GetX controllers for state management
│ │ ├── data/ # Data layer (Models, Repositories, Providers)
│ │ │ ├── models/ # Data models
│ │ │ ├── providers/ # API calls & local storage
│ │ │ ├── repositories/ # Handles data fetching
│ │ ├── services/ # Services (Auth, Database, etc.)
│ │ ├── utils/ # Utility functions, helpers
│ │ ├── themes/ # Light/Dark themes
│ │ ├── translations/ # Multi-language support
│ ├── presentation/ # UI layer
│ │ ├── screens/ # Screens
│ │ │ ├── home/ # Home module
│ │ │ │ ├── home_screen.dart
│ │ │ ├── auth/ # Authentication module
│ │ │ │ ├── login_screen.dart
│ │ ├── widgets/ # Reusable UI components
│── test/ # Unit and widget tests
│── integration_test/ # Integration tests
│── pubspec.yaml # Dependencies
│── README.md # Documentation
│── .gitignore # Ignore unnecessary files
