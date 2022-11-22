import 'package:flutter/material.dart';

import '../theme_service.dart';
import 'asset_icon.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
    required this.rating,
  });

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AssetIcon(
          'star-fill.svg',
          color: context.color.tertiary,
          size: 20,
        ),
        const SizedBox(width: 6),
        Text(
          rating,
          style: context.font.body1.copyWith(
            fontWeight: context.font.light,
          ),
        ),
      ],
    );
  }
}
