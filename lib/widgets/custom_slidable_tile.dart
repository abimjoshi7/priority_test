import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

import 'package:test_project/res/res.dart';
import 'package:test_project/util/util.dart';

class CustomSlidableTile extends StatelessWidget {
  const CustomSlidableTile({
    Key? key,
    required this.onPressed,
    required this.child,
    this.height,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const ScrollMotion(),
        children: [
          GestureDetector(
            onTap: onPressed,
            child: Container(
              height: height,
              padding: const EdgeInsets.all(
                26,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                color: context.errorColor,
              ),
              child: SvgPicture.asset(
                DrawableRes.kIconTrash,
              ),
            ),
          )
        ],
      ),
      child: child,
    );
  }
}
