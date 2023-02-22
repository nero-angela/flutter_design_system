import 'package:flutter/material.dart';

import 'foundation/app_theme.dart';
import 'res/palette.dart';
import 'res/typo.dart';

class DarkTheme implements AppTheme {
  @override
  Brightness brightness = Brightness.dark;

  @override
  AppColor color = AppColor(
    surface: Palette.grey800,
    background: Palette.black.withOpacity(0.55),
    text: Palette.grey100,
    subtext: Palette.grey500,
    toastContainer: Palette.grey100.withOpacity(0.85),
    onToastContainer: Palette.grey800,
    hint: Palette.grey600,
    hintContainer: Palette.grey770,
    onHintContainer: Palette.grey350,
    inactive: Palette.grey500,
    inactiveContainer: Palette.grey700,
    onInactiveContainer: Palette.grey400,
    primary: Palette.green,
    onPrimary: Palette.white,
    secondary: Palette.red,
    onSecondary: Palette.white,
    tertiary: Palette.yellow,
    onTertiary: Palette.white,
  );

  @override
  late AppTypo typo = AppTypo(
    typo: const NotoSans(),
    fontColor: color.text,
  );

  @override
  AppDeco deco = AppDeco(
    shadow: [
      BoxShadow(
        color: Palette.black.withOpacity(0.35),
        blurRadius: 35,
      ),
    ],
  );
}
