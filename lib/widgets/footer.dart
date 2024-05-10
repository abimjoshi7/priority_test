import 'package:flutter/material.dart';
import 'package:test_project/res/res.dart' show StringRes;

class Footer extends StatelessWidget {
  final Widget? leading;
  final String? leadingLabel;
  final String? leadingprice;
  final String? btnText;
  final VoidCallback onPressed;

  const Footer({
    required this.onPressed,
    super.key,
    this.leading,
    this.leadingLabel,
    this.leadingprice,
    this.btnText,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.grey.withOpacity(0.2),
            theme.scaffoldBackgroundColor,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          leading ??
              Column(
                children: [
                  Text(leadingLabel ?? "Price"),
                  Text("\$${leadingprice ?? 235.00}"),
                ],
              ),
          ElevatedButton(
            onPressed: onPressed,
            child: const Text(StringRes.kAddToCart),
          )
        ],
      ),
    );
  }
}
