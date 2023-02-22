import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme_service.dart';

class AssetIcon extends StatelessWidget {
  const AssetIcon(
    this.icon, {
    super.key,
    this.color,
    this.size,
    this.package,
  });

  final String icon;
  final Color? color;
  final double? size;
  final String? package;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon.contains('/') ? icon : 'assets/icons/$icon.svg',
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(
        color ?? context.color.text,
        BlendMode.srcIn,
      ),
      package: package ?? 'flutter_design_system',
    );
  }
}
