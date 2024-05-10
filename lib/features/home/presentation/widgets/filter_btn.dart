import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/res/res.dart';
import 'package:test_project/routes/routes.dart';

class FliterBtn extends StatelessWidget {
  const FliterBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => Navigator.pushNamed(
        context,
        RouteRes.kFilterPage,
      ),
      icon: SvgPicture.asset(
        DrawableRes.kIconSettings,
      ),
      label: const Text(
        StringRes.kFilter,
      ),
    );
  }
}
