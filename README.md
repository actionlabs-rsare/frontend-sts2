# Stock Transfer System — Web Frontend

Flutter web frontend for the AP Stock Transfer System. It talks to a Spring Boot +
PostgreSQL backend over a REST API.

## Tech stack

| Concern            | Choice                                             |
| ------------------ | -------------------------------------------------- |
| State management   | [flutter_bloc](https://pub.dev/packages/flutter_bloc) (Cubits) |
| Dependency injection | [get_it](https://pub.dev/packages/get_it) (`lib/core/di/injection.dart`) |
| Routing            | [go_router](https://pub.dev/packages/go_router) (`lib/core/router/app_router.dart`) |
| Networking         | [dio](https://pub.dev/packages/dio) (`lib/core/network/dio_client.dart`) |
| Models / DTOs      | [freezed](https://pub.dev/packages/freezed) + [json_serializable](https://pub.dev/packages/json_serializable) |
| Responsive layout  | [responsive_framework](https://pub.dev/packages/responsive_framework) |
| i18n               | [slang](https://pub.dev/packages/slang) (`lib/i18n/`) |

State/DI/routing are wired together in `lib/main.dart`.

## Project layout

```
lib/
├── main.dart                 # App entry: DI setup, router, ResponsiveBreakpoints, i18n provider
├── core/                     # Cross-feature building blocks
│   ├── config/               # AppConfig (API base URL)
│   ├── di/                   # get_it registration (injection.dart)
│   ├── error/                # AppException + Dio error mapping
│   ├── network/              # Shared Dio client + auth interceptor
│   ├── presentation/widgets/ # Shared UI (app shell, page head, tables, status pills, ...)
│   ├── router/               # go_router config + route paths
│   ├── theme/                # Design tokens + ThemeData (Roboto)
│   └── utils/                # Formatters, PDF download (web/stub)
├── features/                 # One folder per feature, each with data/domain/presentation
│   ├── auth/                 # Dev sign-in + session
│   ├── companies/
│   ├── shares/
│   ├── stockholders/         # Stockholders + family groups + maintenance tab host
│   ├── transactions/
│   └── certificates/
└── i18n/                     # Slang translations (en.i18n.json -> strings.g.dart)
```

Each feature follows clean architecture:

- `domain/` — entities, repository interfaces, use cases (no Flutter or Dio imports)
- `data/` — freezed models, Dio data sources, repository implementations
- `presentation/` — Cubits/states, pages and widgets

## Prerequisites

- Flutter SDK `>=3.44.0` (Dart `>=3.13.0`). Check with `flutter --version`.
- Chrome (for `flutter run -d chrome`).
- The backend running locally (see [Backend](#backend)).

## Getting started

First-time setup (fetch packages + generate code):

```bash
make create
```

or without make:

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

> `build_runner` generates the freezed/json_serializable model code and the slang
> translations (`*.g.dart`, `*.freezed.dart`). Re-run it after changing any model or
> translation file — or use `make watch` to regenerate on save.

Run the app in Chrome:

```bash
make run
```

or without make:

```bash
flutter run -d chrome --web-port=8081 --dart-define=API_BASE_URL=http://localhost:8080/api
```

The app is served at http://localhost:8081. It expects the backend at
`http://localhost:8080/api` — override with `--dart-define=API_BASE_URL=<url>` if yours
differs. The dev port is pinned to `8081` so it matches the backend's CORS allowlist.

## Make targets

| Command        | What it does                                                        |
| -------------- | ------------------------------------------------------------------- |
| `make create`  | `pub get` + run `build_runner` once (first-time setup)              |
| `make get`     | `flutter pub get`                                                   |
| `make gen`     | Run `build_runner` once (freezed, json_serializable, slang)         |
| `make watch`   | Run `build_runner` in watch mode (regenerate on save)              |
| `make clean`   | `flutter clean`, then re-fetch packages                             |
| `make analyze` | `flutter analyze` (should report no issues)                         |
| `make format`  | `dart format lib test`                                              |
| `make run`     | Run in Chrome on port 8081 against `http://localhost:8080/api`      |
| `make build`   | Release web build against `http://localhost:8080/api`              |
| `make test`    | `flutter test`                                                      |
| `make doctor`  | `flutter doctor -v`                                                 |

Run `make help` to print this list.

> **Windows note:** `make` isn't installed by default. Install it with
> `choco install make`, use MSYS2/MinGW, or run through WSL. Otherwise copy the raw
> `flutter ...` commands from the table above (see the `Makefile` for each one).

## Building for production

```bash
make build
```

or:

```bash
flutter build web --release --dart-define=API_BASE_URL=http://localhost:8080/api
```

Output lands in `build/web/`. The included `Dockerfile` builds the web bundle and serves
it via nginx (with `/api` proxied to the backend — see `nginx.conf`).

## Backend

The Spring Boot backend lives under `backend/`. Run it locally against PostgreSQL:

```bash
cd backend
SPRING_PROFILES_ACTIVE=dev ./gradlew bootRun
```

Notes for local development:

- Dev sign-in (the role picker on the login screen) is only enabled when the backend runs
  with `sts.dev-auth.enabled=true` (the `dev` profile). Without it, `/api/auth/dev-login`
  returns 403.
- CORS for the dev server is configured in
  `backend/src/main/java/com/ap/sts/shared/config/WebConfig.java`. It allows any
  `localhost` / `127.0.0.1` port, so `make run` works regardless of the port Chrome uses.
- See `backend/README.md` and `backend/application.yml.note.md` for build/JDK details.

## Internationalization

Translations live in `lib/i18n/en.i18n.json`. After editing them, regenerate the typed
accessors:

```bash
make gen
```

Strings are accessed type-safely via `Translations.of(context)` (see any page under
`lib/features/**/presentation/`).
