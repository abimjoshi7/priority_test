import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/core/core.dart';
import 'package:test_project/features/features.dart';
import 'package:test_project/widgets/widgets.dart';

class FilterBrandSection extends StatelessWidget {
  const FilterBrandSection({
    super.key,
    required this.label,
    required this.selectedBrand,
  });

  final String label;
  final ValueNotifier<ShoesBrands?> selectedBrand;

  @override
  Widget build(BuildContext context) {
    return CustomSection(
      label: label,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: ShoesBrands.values
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () => selectedBrand.value = e,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: context.width * 0.06,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: SvgPicture.asset(
                                  e.icon,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            if (selectedBrand.value == e)
                              const Positioned(
                                bottom: 1,
                                right: 1,
                                child: Icon(
                                  size: 16,
                                  Icons.check_circle,
                                ),
                              )
                          ],
                        ),
                        Text(
                          e.name,
                          style: context.titleLarge,
                        ),
                        Text(
                          context
                              .read<ProductCubit>()
                              .getItemCount(
                                e.name,
                              )
                              .toString(),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
