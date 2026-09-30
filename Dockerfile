# Multi-stage: build the Flutter web bundle, serve via nginx. Pin digests in CI (no :latest).
FROM ghcr.io/cirruslabs/flutter:stable AS build
WORKDIR /app
COPY pubspec.yaml pubspec.lock* ./
RUN flutter pub get
COPY . .
# Same-origin API in the container: nginx proxies /api to the backend.
RUN flutter build web --release --dart-define=API_BASE_URL=/api

FROM nginx:1.27-alpine AS runtime
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/build/web /usr/share/nginx/html
EXPOSE 80
