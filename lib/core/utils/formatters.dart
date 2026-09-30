/// Peso amounts and share counts with thousands separators, as the mockups show them.
/// Works in centavos so a value like 100.75 keeps both digits instead of rounding to 101.
String formatPeso(double amount) {
  final totalCentavos = (amount * 100).round();
  final whole = totalCentavos ~/ 100;
  final centavos = (totalCentavos % 100).abs();
  return '₱${formatCount(whole)}.${centavos.toString().padLeft(2, '0')}';
}

String formatCount(int value) {
  final digits = value.abs().toString();
  final buffer = StringBuffer(value < 0 ? '-' : '');
  for (var i = 0; i < digits.length; i++) {
    if (i > 0 && (digits.length - i) % 3 == 0) buffer.write(',');
    buffer.write(digits[i]);
  }
  return buffer.toString();
}

/// "HH:mm" for success/status messages (say when it happened).
String formatTimeOfDay(DateTime t) =>
    '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';

/// Shows only the last four characters of a TIN, matching how the backend masks it in logs.
String maskTin(String tin) {
  if (tin.isEmpty) return '—';
  if (tin.length <= 4) return '***';
  return '***${tin.substring(tin.length - 4)}';
}
