import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

/// Page title + one-line description + trailing actions (ux-01 "page-head").
class PageHead extends StatelessWidget {
  const PageHead({super.key, required this.title, required this.description, this.actions = const []});

  final String title;
  final String description;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontFamily: AppTokens.fontFamily,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppTokens.black)),
              const SizedBox(height: 4),
              Text(description, style: const TextStyle(fontSize: 16, color: AppTokens.grey700)),
            ],
          ),
        ),
        ...actions,
      ],
    );
  }
}

/// Page heading with breadcrumb + one-line description (ux-07/08 pattern), for screens whose
/// nav position is deeper (e.g. Settings › Certificate numbering).
class BreadcrumbPageHead extends StatelessWidget {
  const BreadcrumbPageHead(
      {super.key, required this.breadcrumb, required this.title, required this.description});

  final String breadcrumb;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(breadcrumb, style: const TextStyle(color: AppTokens.grey700, fontSize: 13)),
        const SizedBox(height: 4),
        Semantics(
          header: true,
          child: Text(title,
              style: const TextStyle(
                  fontFamily: AppTokens.fontFamily, fontSize: 24, fontWeight: FontWeight.w600)),
        ),
        const SizedBox(height: 2),
        Text(description, style: const TextStyle(color: AppTokens.grey700, fontSize: 14)),
      ],
    );
  }
}
