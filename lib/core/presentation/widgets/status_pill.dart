import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

/// A single status-pill style used across stockholders, transactions and certificates
/// (previously three near-duplicate widgets — consolidated here).
///
/// Dark text on a light fill, with an icon, so status never depends on colour alone (design
/// system §5 and the WCAG AA note in §2.4).
class StatusPill extends StatelessWidget {
  const StatusPill({super.key, required this.label, required this.fill, required this.icon, this.textColor = AppTokens.black});

  final String label;
  final Color fill;
  final Color textColor;
  final IconData icon;

  /// Stockholder lifecycle (OI-19): records are deactivated, never deleted.
  factory StatusPill.stockholder({required bool active, required String activeLabel, required String inactiveLabel}) =>
      active
          ? StatusPill(label: activeLabel, fill: AppTokens.green100, icon: Icons.check_circle_outline)
          : StatusPill(label: inactiveLabel, fill: AppTokens.grey100, icon: Icons.pause_circle_outline);

  /// Transaction lifecycle statuses (OI-16), styled per the AP design system §5.
  factory StatusPill.transaction(String status, String label) {
    final (fill, text) = switch (status) {
      'Submitted' => (const Color(0xFFEFEFF4), AppTokens.grey700),
      'PendingFirstApproval' || 'PendingSecondApproval' => (AppTokens.sunshine200, const Color(0xFF7A5B00)),
      'Approved' => (AppTokens.green100, AppTokens.black),
      'Posted' => (AppTokens.blue700, AppTokens.white),
      'Rejected' => (AppTokens.red100, const Color(0xFF7A1A1D)),
      _ => (const Color(0xFFEFEFF4), AppTokens.grey700),
    };
    final icon = switch (status) {
      'Approved' => Icons.task_alt,
      'Posted' => Icons.verified_outlined,
      'Rejected' => Icons.close,
      _ => Icons.pending_outlined,
    };
    return StatusPill(label: label, fill: fill, textColor: text, icon: icon);
  }

  /// Certificate lifecycle statuses (U6, WCAG 1.4.1).
  factory StatusPill.certificate(String status, String label) {
    final (fill, icon) = switch (status) {
      'Posted' => (AppTokens.blue700, Icons.verified_outlined),
      'Issued' => (AppTokens.green100, Icons.check_circle_outline),
      'Voided' => (AppTokens.red100, Icons.block),
      'Transferred' => (AppTokens.grey300, Icons.swap_horiz),
      'Replaced' => (AppTokens.grey300, Icons.autorenew),
      'Cancelled' => (AppTokens.grey300, Icons.cancel_outlined),
      'Approved' => (AppTokens.green100, Icons.task_alt),
      _ => (AppTokens.grey100, Icons.pending_outlined),
    };
    final text = status == 'Posted' ? AppTokens.white : AppTokens.black;
    return StatusPill(label: label, fill: fill, textColor: text, icon: icon);
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Status: $label',
      excludeSemantics: true,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(color: fill, borderRadius: BorderRadius.circular(9999)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: textColor),
            const SizedBox(width: 6),
            Text(label, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: textColor)),
          ],
        ),
      ),
    );
  }
}
