import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

/// Generic "could not load" state with a retry button, used by every bloc-driven list screen.
class AsyncErrorView extends StatelessWidget {
  const AsyncErrorView({super.key, required this.message, this.hint, required this.onRetry});

  final String message;
  final String? hint;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, color: AppTokens.red400),
            const SizedBox(height: 8),
            Text(message, textAlign: TextAlign.center, style: const TextStyle(color: AppTokens.red400)),
            if (hint != null) ...[
              const SizedBox(height: 4),
              Text(hint!, textAlign: TextAlign.center, style: const TextStyle(color: AppTokens.grey700)),
            ],
            const SizedBox(height: 12),
            OutlinedButton(onPressed: onRetry, child: const Text('Try again')),
          ],
        ),
      ),
    );
  }
}

/// Shows what happened and when (never a bare "Success").
void showActionSnack(BuildContext context, String what) {
  final now = TimeOfDay.fromDateTime(DateTime.now()).format(context);
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$what at $now')));
}
