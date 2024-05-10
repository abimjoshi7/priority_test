import 'package:flutter/material.dart';

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
    return Container(
      decoration: BoxDecoration(
        shape: boxShape ?? BoxShape.rectangle,
      ),
      child: child,
    );
  }
}
