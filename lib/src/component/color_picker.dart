import 'package:flutter/material.dart';

import '../theme_service.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({
    super.key,
    required this.colorIndex,
    required this.colorList,
    required this.onSelected,
  });

  final int colorIndex;
  final List<Color> colorList;
  final void Function(int index) onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: colorList.asMap().entries.map<Widget>((entry) {
        int index = entry.key;
        Color color = entry.value;
        bool isSelected = index == colorIndex;
        return GestureDetector(
          onTap: () => onSelected(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 222),
            decoration: BoxDecoration(
              boxShadow: context.deco.shadow,
              border: isSelected
                  ? Border.all(
                      color: context.color.primary,
                      width: 3,
                    )
                  : null,
              borderRadius: BorderRadius.circular(99),
            ),
            padding: EdgeInsets.all(isSelected ? 1 : 4),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: color,
            ),
          ),
        );
      }).toList(),
    );
  }
}
