import 'package:flutter/material.dart';

class CustomDotDivider extends StatelessWidget {
  const CustomDotDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 8,
      child: Center(
        child: Text("."),
      ),
    );
  }
}
