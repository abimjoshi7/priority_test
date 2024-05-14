import 'package:flutter/material.dart';
import 'package:test_project/res/res.dart' show StringRes;
import 'package:test_project/util/util.dart';

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
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(
            8,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                theme.colorScheme.primary.withOpacity(0.4),
                theme.colorScheme.primaryContainer.withOpacity(
                  0.8,
                ),
              ],
            ),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.5), // Shadow color
            //     spreadRadius: 2,
            //     blurRadius: 4,
            //     offset: const Offset(0, 3),
            //   ),
            // ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 16,
          ),
          child: Row(
            children: [
              Expanded(
                child: leading ??
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(leadingLabel ?? "Price"),
                        Text(
                          "\$${leadingprice ?? 235.00}",
                          style: context.headlineMedium,
                        ),
                      ],
                    ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text(btnText ?? StringRes.kAddToCart),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
