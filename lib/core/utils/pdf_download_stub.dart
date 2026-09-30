import 'dart:typed_data';

/// Non-web fallback: nothing to download into. Returns false so the UI can say so.
Future<bool> savePdf(Uint8List bytes, String fileName) async => false;
