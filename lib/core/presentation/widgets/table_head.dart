import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

/// Header strip inside a results card: "All stockholders · 4 results".
class TableHead extends StatelessWidget {
  const TableHead({super.key, required this.label, required this.count, this.trailing});

  final String label;
  final int count;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppTokens.grey100)),
      ),
      // Two plain Text widgets rather than one rich span: the count is a separate piece of
      // information for a screen reader, and it stays findable in tests.
      child: Row(
        children: [
          Flexible(
            child: Text(label,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontFamily: AppTokens.fontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppTokens.black)),
          ),
          const SizedBox(width: 8),
          Text('· $count ${count == 1 ? 'result' : 'results'}',
              style: const TextStyle(fontSize: 14, color: AppTokens.grey700)),
          const Spacer(),
          ?trailing,
        ],
      ),
    );
  }
}
