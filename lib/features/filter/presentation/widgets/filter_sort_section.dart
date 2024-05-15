import 'package:flutter/material.dart';
import 'package:test_project/core/core.dart';
import 'package:test_project/widgets/widgets.dart';

class FilterSortSection extends StatelessWidget {
  const FilterSortSection({
    super.key,
    required this.selectedSort,
  });

  final ValueNotifier<SortOptions?> selectedSort;

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      label: StringRes.kSortBy,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: SortOptions.values
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FilterChip(
                    selected: e == selectedSort.value,
                    label: Text(
                      e.label,
                      style: context.titleLarge?.copyWith(
                        color: e == selectedSort.value
                            ? context.primary
                            : context.onPrimary,
                      ),
                    ),
                    onSelected: (value) => selectedSort.value = e,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
