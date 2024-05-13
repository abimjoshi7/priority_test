import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fpdart/fpdart.dart';
import 'package:test_project/enums.dart';
import 'package:test_project/features/home/domain/domain.dart';
import 'package:test_project/features/home/presentation/presentation.dart';
import 'package:test_project/features/review/presentation/cubit/review_cubit.dart';
import 'package:test_project/res/res.dart';
import 'package:test_project/util/util.dart';
import 'package:test_project/widgets/widgets.dart';

import '../../../review/domain/domain.dart';

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
      const RangeValues(
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
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
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
                                      // CustomContainer(
                                      //   boxShape: BoxShape.circle,
                                      //   child: ,
                                      // ),
                                      Text(
                                        e.name,
                                        style: context.titleLarge,
                                      ),
                                      FutureBuilder<int>(
                                        initialData: 0,
                                        future: context
                                            .read<ProductCubit>()
                                            .getItemCount(e.brandType),
                                        builder: (context, snapshot) => Text(
                                          (snapshot.data ?? 0).toString(),
                                        ),
                                      ),
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
                  ),
                  CustomSection(
                    label: label2,
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
                  ),
                  CustomSection(
                    label: label5,
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
                                                    color:
                                                        context.outlinedColor,
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
                                  onSelected: (value) =>
                                      selectedColor.value = e.colorType,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Footer(
            btnText: btnText,
            leading: OutlinedButton(
              onPressed: () {
                for (int i = 0; i < 10; i++) {
                  context.read<ReviewCubit>().insertReview(
                        Review(
                          createdDate: DateTime.now(),
                          productId: randomInt(1, 11).run(),
                          rating: randomInt(1, 6).run().toDouble(),
                          userId: randomInt(1, 5).run(),
                          comment:
                              "Noice ${i.hashCode.toStringAsExponential()}",
                        ),
                      );
                }
                // add 10 products
                // for (int i = 0; i < 10; i++) {
                //   context.read<ProductCubit>().insertProduct(
                //         Product(
                //           brandType: randomInt(0, 5).run(),
                //           colors: [1, 2, 3, 4],
                //           description: "description",
                //           genderType: randomInt(0, 3).run(),
                //           image: "assets/images/${i + 1}.png",
                //           id: i + 1,
                //           name: "Jordan 1 Retro High Tie Dye",
                //           price: randomInt(200, 2000).run().toDouble(),
                //           size: [44, 46, 48, 50],
                //           brandName: "Adidas",
                //           reviewsCount: randomInt(200, 2000).run(),
                //         ),
                //       );
                // }
              },
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
