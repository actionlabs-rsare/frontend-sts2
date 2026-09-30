import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

/// Yellow section bar inside a modal (ux-05/ux-06 sectioned modals).
class ModalSectionBar extends StatelessWidget {
  const ModalSectionBar({super.key, required this.label, this.note});

  final String label;
  final String? note;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 8, bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      color: AppTokens.sunshine200,
      child: Row(
        children: [
          Text(label,
              style: const TextStyle(
                  fontFamily: AppTokens.fontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppTokens.black)),
          if (note != null) ...[
            const SizedBox(width: 8),
            Expanded(
              child: Text(note!, style: const TextStyle(fontSize: 13, color: AppTokens.grey700)),
            ),
          ],
        ],
      ),
    );
  }
}
