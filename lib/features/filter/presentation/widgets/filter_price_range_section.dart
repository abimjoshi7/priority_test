import 'package:flutter/material.dart';

import 'package:test_project/core/core.dart';
import 'package:test_project/widgets/widgets.dart';

class FilterPriceRangeSection extends StatelessWidget {
  const FilterPriceRangeSection({
    super.key,
    required this.rangeValues,
    required this.minPrice,
    required this.maxPrice,
  });

  final ValueNotifier<RangeValues> rangeValues;
  final double minPrice;
  final double maxPrice;

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      label: StringRes.kPriceRange,
      child: Wrap(
        children: [
          RangeSlider(
            labels: RangeLabels(
              "\$${rangeValues.value.start.toStringAsFixed(0)}",
              "\$${rangeValues.value.end.toStringAsFixed(0)}",
            ),
            onChanged: (value) => rangeValues.value = value,
            min: minPrice,
            max: maxPrice,
            values: rangeValues.value,
          ),
        ],
      ),
    );
  }
}
