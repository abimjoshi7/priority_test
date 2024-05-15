import 'package:flutter/material.dart';
import 'package:test_project/core/core.dart';

class CustomSection extends StatelessWidget {
  const CustomSection({
    super.key,
    this.label,
    required this.child,
  });

  final String? label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Text(
              label!,
              style: context.titleLarge,
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: child,
          ),
        ],
      ),
    );
  }
}
