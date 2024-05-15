import 'package:flutter/material.dart';
import 'package:test_project/core/core.dart';
import 'package:test_project/widgets/widgets.dart';

class FilterColorSection extends StatelessWidget {
  const FilterColorSection({
    super.key,
    required this.selectedColor,
  });

  final ValueNotifier<int?> selectedColor;

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      label: StringRes.kColor,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: ShoeColor.values
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FilterChip(
                    side: BorderSide(
                      color: e.colorType == selectedColor.value
                          ? context.onPrimary
                          : context.outlinedColor,
                    ),
                    label: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: e == ShoeColor.White
                                  ? Border.all(
                                      color: context.outlinedColor,
                                    )
                                  : null),
                          child: Icon(
                            Icons.circle,
                            size: 16,
                            color: e.color,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(e.name),
                      ],
                    ),
                    // labelPadding: EdgeInsets,
                    onSelected: (value) => selectedColor.value = e.colorType,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
