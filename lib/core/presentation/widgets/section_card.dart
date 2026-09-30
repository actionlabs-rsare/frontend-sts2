import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

/// White card with an AP-blue accent header strip (ux-01/04/08 results tables).
class SectionCard extends StatelessWidget {
  const SectionCard({super.key, required this.title, required this.child, this.trailing});

  final String title;
  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration:
                const BoxDecoration(border: Border(left: BorderSide(color: AppTokens.blue700, width: 4))),
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(title,
                      style: const TextStyle(
                          fontFamily: AppTokens.fontFamily, fontWeight: FontWeight.w600, fontSize: 16)),
                ),
                ?trailing,
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.fromLTRB(16, 0, 16, 16), child: child),
        ],
      ),
    );
  }
}

/// Modal section heading with the yellow left bar (dialog forms with distinct sub-sections).
class YellowSectionBar extends StatelessWidget {
  const YellowSectionBar(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      padding: const EdgeInsets.only(left: 10),
      decoration:
          const BoxDecoration(border: Border(left: BorderSide(color: AppTokens.sunshine700, width: 4))),
      child: Text(label,
          style: const TextStyle(fontFamily: AppTokens.fontFamily, fontWeight: FontWeight.w600, fontSize: 15)),
    );
  }
}
