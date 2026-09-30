import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

/// Inline error box: icon + dark text on the error surface (never red body text on white).
class ErrorBox extends StatelessWidget {
  const ErrorBox(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      liveRegion: true,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: AppTokens.red100, borderRadius: BorderRadius.circular(8)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.error_outline, color: AppTokens.black, size: 20),
            const SizedBox(width: 8),
            Expanded(child: Text(message, style: const TextStyle(color: AppTokens.black))),
          ],
        ),
      ),
    );
  }
}

/// Inline success box: what happened and when (say when it happened, not just "success").
class SuccessBox extends StatelessWidget {
  const SuccessBox(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      liveRegion: true,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: AppTokens.green100, borderRadius: BorderRadius.circular(8)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.check_circle_outline, color: AppTokens.black, size: 20),
            const SizedBox(width: 8),
            Expanded(child: Text(message, style: const TextStyle(color: AppTokens.black))),
          ],
        ),
      ),
    );
  }
}
