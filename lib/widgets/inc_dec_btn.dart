import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_project/core/core.dart';

class IncDecBtn extends HookWidget {
  const IncDecBtn({
    super.key,
    required this.number,
    required this.onChanged,
  });

  final int number;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final numberState = useState(number);

    return Row(
      children: [
        IconButton(
          onPressed: () {
            numberState.value--;
            onChanged(numberState.value);
          },
          icon: Icon(
            Icons.remove_circle_outline_outlined,
            color: context.outlinedColor,
          ),
        ),
        Text(
          numberState.value.toString(),
          style: context.titleLarge,
        ),
        IconButton(
          onPressed: () {
            numberState.value++;
            onChanged(numberState.value);
          },
          icon: const Icon(
            Icons.add_circle_outline_rounded,
          ),
        ),
      ],
    );
  }
}
