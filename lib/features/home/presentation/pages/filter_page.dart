import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_project/features/home/presentation/pages/product_detail_page.dart';
import 'package:test_project/models/product.dart';
import 'package:test_project/res/res.dart';
import 'package:test_project/widgets/custom_container.dart';
import 'package:test_project/widgets/widgets.dart';

class FilterPage extends HookWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CustomSection(
            label: "Brands",
            child: Row(
              children: ShoesBrands.values
                  .map(
                    (e) => Column(
                      children: [
                        CustomContainer(
                          child: Image.asset(
                            DrawableRes.kLogoAdidas,
                          ),
                        ),
                        Text(e.name),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
          CustomSection(
            label: "Price Range",
            child: Slider.adaptive(
              value: 0,
              onChanged: (value) {},
            ),
          ),
          CustomSection(
            label: "Sort By",
            child: Row(
              children: [],
            ),
          ),
          CustomSection(
            label: "Gender",
            child: Row(),
          ),
          CustomSection(
            label: "Color",
            child: Row(),
          ),
          Footer(
            btnText: "Apply",
            leading: OutlinedButton(
              onPressed: () {},
              child: Text(
                "RESET",
              ),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
