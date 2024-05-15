import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:test_project/core/core.dart';
import 'package:test_project/features/features.dart';
import 'package:test_project/widgets/widgets.dart';

class FilterFooterSection extends StatelessWidget {
  const FilterFooterSection({
    super.key,
    required this.selectedBrand,
    required this.selectedSort,
    required this.selectedGender,
    required this.selectedColor,
    required this.rangeValues,
  });

  final ValueNotifier<ShoesBrands?> selectedBrand;
  final ValueNotifier<SortOptions?> selectedSort;
  final ValueNotifier<Gender?> selectedGender;
  final ValueNotifier<int?> selectedColor;
  final ValueNotifier<RangeValues?> rangeValues;

  @override
  Widget build(BuildContext context) {
    final nullList = [
      selectedBrand,
      selectedColor,
      selectedSort,
      selectedGender,
    ].where((element) => element.value != null).length;

    return Footer(
      btnText: StringRes.kApply.toUpperCase(),
      leading: OutlinedButton(
        onPressed: () {
          context.read<FilterCubit>().resetFilter();
          Navigator.pop(context);
        },
        child: Text.rich(
          TextSpan(
            text: StringRes.kReset.toUpperCase(),
            children: [
              if (nullList >= 1) TextSpan(text: "($nullList)"),
            ],
          ),
        ),
      ),
      onPressed: () async {
        context.read<FilterCubit>().applyFilter(
              selectedSort.value == SortOptions.Price,
              selectedSort.value == SortOptions.Review,
              selectedSort.value == SortOptions.Recent,
              selectedGender.value?.index,
              selectedColor.value,
              rangeValues.value?.start,
              rangeValues.value?.end,
            );
        Navigator.pop(context);
      },
    );
  }
}
