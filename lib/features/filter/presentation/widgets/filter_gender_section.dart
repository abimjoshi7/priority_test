import 'package:flutter/material.dart';
import 'package:test_project/core/core.dart';
import 'package:test_project/widgets/widgets.dart';

class FilterGenderSection extends StatelessWidget {
  const FilterGenderSection({
    super.key,
    required this.selectedGender,
  });

  final ValueNotifier<Gender?> selectedGender;

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      label: StringRes.kGender,
      child: Row(
        children: Gender.values
            .map(
              (e) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: FilterChip(
                  showCheckmark: false,
                  selected: e == selectedGender.value,
                  label: Text(
                    e.name,
                    style: context.titleLarge?.copyWith(
                      color: e == selectedGender.value
                          ? context.primary
                          : context.onPrimary,
                    ),
                  ),
                  onSelected: (value) => selectedGender.value = e,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
