import 'package:flutter/material.dart';

/// Scrolls a wide results table in both directions.
///
/// These tables carry many BRD columns and can be wider than a narrow window. Clipped columns are
/// content the user cannot reach, so the table scrolls sideways instead — while still stretching
/// to fill a wide screen.
class ScrollableTable extends StatelessWidget {
  const ScrollableTable({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: constraints.maxWidth),
          child: SingleChildScrollView(child: child),
        ),
      ),
    );
  }
}
