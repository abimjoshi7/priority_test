import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/core/res/res.dart';
import 'package:test_project/core/routes/routes.dart';
import 'package:test_project/features/features.dart';

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
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<FilterCubit, FilterState>(
          builder: (context, state) {
            return Badge(
              isLabelVisible: context.read<FilterCubit>().getCount() > 0,
              child: SvgPicture.asset(
                DrawableRes.kIconSettings,
              ),
            );
          },
        ),
      ),
      label: Text(
        StringRes.kFilter.toUpperCase(),
      ),
    );
  }
}
