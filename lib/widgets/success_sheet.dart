import 'package:flutter/material.dart';
import 'package:test_project/core/core.dart';

class SuccessSheet extends StatelessWidget {
  const SuccessSheet({
    super.key,
    required this.label,
    required this.info,
    required this.left,
    required this.right,
  });

  final String label;
  final String info;
  final Widget left;
  final Widget right;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: context.onPrimary,
              width: 2,
            ),
          ),
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          child: Icon(
            Icons.check,
            size: 32,
            color: context.onContainerColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            label,
            style: context.headlineSmall,
          ),
        ),
        Text(info),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: left,
              ),
              const SizedBox(
                width: 24,
              ),
              Expanded(
                child: right,
              ),
            ],
          ),
        )
      ],
    );
  }
}
