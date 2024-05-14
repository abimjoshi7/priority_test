// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:test_project/res/res.dart';
import 'package:test_project/style/style.dart';

enum Gender {
  Man,
  Woman,
  Unisex,
}

enum SortOptions {
  Recent("Most recent"),
  Price("Lowest price"),
  Review("Highest reviews"),
  ;

  final String label;
  const SortOptions(this.label);
}

enum ReviewNumbers {
  All("All"),
  Five("5 stars"),
  Four("4 stars"),
  Three("3 stars"),
  Two("2 stars"),
  One("1 star");

  final String label;
  const ReviewNumbers(this.label);
}

enum ShoesBrands {
  Adidas(1, DrawableRes.kLogoAdidas),
  Jordan(2, DrawableRes.kLogoJordan),
  Nike(3, DrawableRes.kLogoNike),
  Reebok(4, DrawableRes.kLogoReebok),
  Vans(5, DrawableRes.kLogoVans);

  final int brandType;
  final String icon;

  const ShoesBrands(this.brandType, this.icon);
}

enum ShoeColor {
  White(AppPalette.kClrWhite, 1),
  Black(AppPalette.kClrBlack, 2),
  Green(AppPalette.kClrGreen, 3),
  Blue(AppPalette.kClrBlue, 4);

  final Color color;
  final int colorType;

  const ShoeColor(this.color, this.colorType);
}

enum DummyUser {
  A(1, "James Hetfield"),
  B(2, "Kirk Hammett"),
  C(3, "Lars Ulrich"),
  D(4, "Dave Mustaine");

  final int id;
  final String name;

  const DummyUser(this.id, this.name);
}

enum PaymentMethod {
  Cash("Cash"),
  Card("Credit Card"),
  Online1("Paypal"),
  Online2("Stripe");

  final String label;

  const PaymentMethod(this.label);
}

enum Location {
  NewYork("New York, USA"),
  London("London, UK"),
  Paris("Paris, France"),
  Milan("Milan, Italy"),
  Tokyo("Tokyo, Japan");

  final String label;

  const Location(this.label);
}
