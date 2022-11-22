import 'package:flutter/material.dart';

import '../theme_service.dart';
import 'asset_icon.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({
    super.key,
    required this.count,
    required this.onChanged,
  });

  final int count;
  final Function(int count) onChanged;

  bool get isMinusActive => count > 1;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        /// Minus
        GestureDetector(
          onTap: () {
            if (!isMinusActive) return;
            onChanged(count - 1);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 222),
            decoration: BoxDecoration(
              color: context.color.surface,
              boxShadow: isMinusActive ? context.deco.shadow : null,
              borderRadius: BorderRadius.circular(99),
            ),
            padding: const EdgeInsets.all(8),
            child: AssetIcon(
              'minus-outline.svg',
              color: isMinusActive
                  ? context.color.primary
                  : context.color.inactive,
            ),
          ),
        ),

        /// Counter
        Text(
          '$count',
          style: context.font.headline4.copyWith(
            fontWeight: context.font.semiBold,
          ),
        ),

        /// Plus
        GestureDetector(
          onTap: () {
            onChanged(count + 1);
          },
          child: Container(
            decoration: BoxDecoration(
              color: context.color.surface,
              boxShadow: context.deco.shadow,
              borderRadius: BorderRadius.circular(99),
            ),
            padding: const EdgeInsets.all(8),
            child: AssetIcon(
              'plus-outline.svg',
              color: context.color.primary,
            ),
          ),
        ),
      ],
    );
  }
}
