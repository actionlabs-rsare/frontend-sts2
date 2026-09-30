import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

/// Tab strip under the page head (ux-05/ux-06). Plain text tabs with an AP-blue active underline.
class MasterDataTabs extends StatelessWidget {
  const MasterDataTabs(
      {super.key, required this.labels, required this.activeIndex, required this.onSelect});

  final List<String> labels;
  final int activeIndex;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppTokens.grey100)),
      ),
      child: Row(
        children: [
          for (var i = 0; i < labels.length; i++)
            InkWell(
              onTap: () => onSelect(i),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: i == activeIndex ? AppTokens.blue700 : Colors.transparent,
                      width: 3,
                    ),
                  ),
                ),
                child: Text(labels[i],
                    style: TextStyle(
                        fontFamily: AppTokens.fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: i == activeIndex ? AppTokens.blue700 : AppTokens.grey700)),
              ),
            ),
        ],
      ),
    );
  }
}
