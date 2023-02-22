import 'package:flutter/material.dart';

import 'button/button.dart';
import 'counter_badge.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
    required this.count,
    required this.onPressed,
  });

  final int count;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CounterBadge(
      label: "$count",
      isShow: count > 0,
      child: Button(
        icon: 'basket',
        type: ButtonType.flat,
        onPressed: onPressed,
      ),
    );
  }
}
