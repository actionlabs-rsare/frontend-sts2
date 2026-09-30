# Stock Transfer System — Flutter web frontend
#
# Run with GNU Make (`make <target>`). On Windows, install make via Chocolatey
# (`choco install make`), MSYS2/MinGW, or run these commands from WSL.

.PHONY: help create get gen watch clean analyze format run build test doctor

help:
	@echo "Available targets:"
	@echo "  make create   - Fetch packages and generate freezed/json_serializable/slang code"
	@echo "  make get      - flutter pub get"
	@echo "  make gen      - Run build_runner once (freezed, json_serializable, slang)"
	@echo "  make watch    - Run build_runner in watch mode"
	@echo "  make clean    - flutter clean, then re-fetch packages"
	@echo "  make analyze  - flutter analyze (fails on any issue, including infos)"
	@echo "  make format   - dart format lib/ test/"
	@echo "  make run      - flutter run -d chrome against http://localhost:8080/api"
	@echo "  make build    - flutter build web (release) against http://localhost:8080/api"
	@echo "  make test     - flutter test"
	@echo "  make doctor   - flutter doctor"

# Bring a freshly cloned checkout to a runnable state.
create: get gen

get:
	flutter pub get

gen:
	dart run build_runner build --delete-conflicting-outputs

watch:
	dart run build_runner watch --delete-conflicting-outputs

clean:
	flutter clean
	flutter pub get

analyze:
	flutter analyze

format:
	dart format lib test

run:
	flutter run -d chrome --web-port=8081 --dart-define=API_BASE_URL=http://localhost:8080/api

build:
	flutter build web --release --dart-define=API_BASE_URL=http://localhost:8080/api

test:
	flutter test

doctor:
	flutter doctor -v
