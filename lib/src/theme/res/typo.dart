import 'package:flutter/material.dart';

abstract class Typo {
  const Typo({
    required this.name,
    required this.light,
    required this.regular,
    required this.semiBold,
  });

  final String name;
  final FontWeight light;
  final FontWeight regular;
  final FontWeight semiBold;
}

class NotoSans extends Typo {
  const NotoSans()
      : super(
          name: 'noto_sans',
          light: FontWeight.w300,
          regular: FontWeight.w400,
          semiBold: FontWeight.w600,
        );
}
