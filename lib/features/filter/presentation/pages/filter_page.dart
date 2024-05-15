import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_project/core/core.dart';
import 'package:test_project/features/filter/presentation/widgets/widgets.dart';
import 'package:test_project/features/home/presentation/presentation.dart';

class FilterPage extends HookWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var label = "Brands";

    final selectedBrand = useState<ShoesBrands?>(null);
    final selectedSort = useState<SortOptions?>(null);
    final selectedGender = useState<Gender?>(null);
    final selectedColor = useState<int?>(null);
    const minPrice = 0.0;
    final maxPrice = context.read<ProductCubit>().getExpensiveProduct().price;
    final rangeValues = useState(
      RangeValues(minPrice, maxPrice),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          StringRes.kFilter,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FilterBrandSection(
                      label: label, selectedBrand: selectedBrand),
                  FilterPriceRangeSection(
                    rangeValues: rangeValues,
                    minPrice: minPrice,
                    maxPrice: maxPrice,
                  ),
                  FilterSortSection(selectedSort: selectedSort),
                  FilterGenderSection(selectedGender: selectedGender),
                  FilterColorSection(selectedColor: selectedColor),
                ],
              ),
            ),
          ),
          FilterFooterSection(
              selectedBrand: selectedBrand,
              selectedSort: selectedSort,
              selectedGender: selectedGender,
              selectedColor: selectedColor,
              rangeValues: rangeValues)
        ],
      ),
    );
  }
}
