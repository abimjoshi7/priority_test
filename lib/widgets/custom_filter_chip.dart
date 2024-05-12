import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomFilterChip extends HookWidget {
  const CustomFilterChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  final Widget label;
  final void Function(bool)? onSelected;
  final ValueNotifier<bool> selected;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      selected: selected.value,
      label: label,
      onSelected: onSelected,
    );
  }
}
