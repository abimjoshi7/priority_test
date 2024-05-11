import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/features/home/presentation/pages/product_detail_page.dart';
import 'package:test_project/models/product.dart';
import 'package:test_project/res/res.dart';
import 'package:test_project/style/style.dart';
import 'package:test_project/util/util.dart';
import 'package:test_project/widgets/widgets.dart';

class FilterPage extends HookWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var label = "Brands";

    final selectedBrand = useState<ShoesBrands?>(null);
    final selectedSort = useState(SortOptions.Recent);
    final selectedGender = useState(Gender.Man);
    final selectedColor = useState(0);
    final rangeValues = useState(
      RangeValues(
        0,
        1,
      ),
    );

    var label2 = "Gender";
    var label3 = "Sort By";
    var label4 = "Price Range";
    var label5 = "Color";
    var btnText = "Apply";
    var data = "Reset";
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSection(
                  label: label,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: ShoesBrands.values
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 16,
                              ),
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
                                              DrawableRes.kLogoNike,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        if (selectedBrand.value == e)
                                          Positioned(
                                            bottom: 1,
                                            right: 1,
                                            child: Icon(
                                              size: 16,
                                              Icons.check_circle,
                                            ),
                                          )
                                      ],
                                    ),
                                    // CustomContainer(
                                    //   boxShape: BoxShape.circle,
                                    //   child: ,
                                    // ),
                                    Text(
                                      e.name,
                                      style: context.titleLarge,
                                    ),
                                    Text("item count"),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                CustomSection(
                  label: label4,
                  child: RangeSlider(
                    values: rangeValues.value,
                    onChanged: (value) => rangeValues.value = value,
                    labels: RangeLabels(
                      rangeValues.value.start.toString(),
                      rangeValues.value.end.toString(),
                    ),
                  ),
                ),
                CustomSection(
                  label: label3,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: SortOptions.values
                          .map(
                            (e) => FilterChip(
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
                          )
                          .toList(),
                    ),
                  ),
                ),
                CustomSection(
                  label: label2,
                  child: Row(
                    children: Gender.values
                        .map(
                          (e) => FilterChip(
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
                        )
                        .toList(),
                  ),
                ),
                CustomSection(
                  label: label5,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        4,
                        (index) => FilterChip(
                          side: BorderSide(
                            color: index == selectedColor.value
                                ? context.onPrimary
                                : AppPalette.kClrOutlinedGrey,
                          ),
                          label: Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 16,
                              ),
                              SizedBox(width: 8),
                              Text("Black"),
                            ],
                          ),
                          // labelPadding: EdgeInsets,
                          onSelected: (value) => selectedColor.value = index,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Footer(
            btnText: btnText,
            leading: OutlinedButton(
              onPressed: () {},
              child: Text(
                data,
              ),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

enum Gender {
  Man,
  Woman,
  Unisex,
}

enum SortOptions {
  Recent("Most recent"),
  Price("Lowest price"),
  Review("Highest reviews"),
  Gender("Gender"),
  Color("Color"),
  ;

  final String label;
  const SortOptions(this.label);
}
