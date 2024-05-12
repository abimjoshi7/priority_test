import 'package:flutter/material.dart';
import 'package:test_project/util/util.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.boxShape,
    required this.child,
    this.height,
    this.width,
  });

  final BoxShape? boxShape;
  final Widget child;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: boxShape ?? BoxShape.rectangle,
        color: context.containerColor,
        borderRadius: boxShape == BoxShape.circle
            ? null
            : BorderRadius.circular(
                24,
              ),
      ),
      child: child,
    );
  }
}
