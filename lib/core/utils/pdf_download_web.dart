import 'dart:async';
import 'dart:js_interop';
import 'dart:typed_data';

// Minimal browser bindings with dart:js_interop (package:web is not a direct dependency).

@JS('Blob')
extension type _Blob._(JSObject _) implements JSObject {
  external factory _Blob(JSArray<JSAny> parts, JSObject options);
}

@JS('URL')
extension type _Url._(JSObject _) implements JSObject {
  external static JSString createObjectURL(JSObject blob);
  external static void revokeObjectURL(JSString url);
}

extension type _Anchor._(JSObject _) implements JSObject {
  external set href(JSString value);
  external set download(JSString value);
  external set rel(JSString value);
  external void click();
}

extension type _Document._(JSObject _) implements JSObject {
  external _Anchor createElement(JSString tag);
}

@JS('document')
external _Document get _document;

/// Downloads the PDF bytes as [fileName] via a temporary object URL.
Future<bool> savePdf(Uint8List bytes, String fileName) async {
  final options = <String, String>{'type': 'application/pdf'}.jsify()! as JSObject;
  final blob = _Blob(<JSAny>[bytes.toJS].toJS, options);
  final url = _Url.createObjectURL(blob);
  final anchor = _document.createElement('a'.toJS)
    ..href = url
    ..download = fileName.toJS
    ..rel = 'noopener'.toJS;
  anchor.click();
  // Give the browser time to start the download before releasing the blob.
  Timer(const Duration(seconds: 30), () => _Url.revokeObjectURL(url));
  return true;
}
