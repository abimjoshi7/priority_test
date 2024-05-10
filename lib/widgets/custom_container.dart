import 'package:flutter/material.dart';
import 'package:test_project/util/util.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    this.boxShape,
    required this.child,
  }) : super(key: key);

  final BoxShape? boxShape;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        shape: boxShape ?? BoxShape.rectangle,
        color: context.containerColor,
        borderRadius: BorderRadius.circular(
          24,
        ),
      ),
      child: child,
    );
  }
}
