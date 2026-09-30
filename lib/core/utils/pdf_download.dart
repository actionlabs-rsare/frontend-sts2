/// Saves a generated PDF. On web it downloads through the browser; elsewhere (tests, desktop)
/// the stub reports that saving isn't supported.
library;

export 'pdf_download_stub.dart' if (dart.library.js_interop) 'pdf_download_web.dart';
