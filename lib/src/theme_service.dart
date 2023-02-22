import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme/dark_theme.dart';
import 'theme/foundation/app_theme.dart';
import 'theme/light_theme.dart';
import 'theme/res/layout.dart';

class ThemeService with ChangeNotifier {
  ThemeService({
    Brightness? brightness,
    AppTheme? theme,
    AppTheme? lightTheme,
    AppTheme? darkTheme,
  })  : brightness = brightness ?? Brightness.light,
        lightTheme = lightTheme ?? LightTheme(),
        darkTheme = darkTheme ?? DarkTheme();

  /// Current Theme
  Brightness brightness;
  AppTheme get theme => brightness == Brightness.light ? lightTheme : darkTheme;
  AppTheme lightTheme;
  AppTheme darkTheme;

  /// Change Theme
  void toggleTheme() {
    brightness = theme.brightness == Brightness.light
        ? Brightness.dark
        : Brightness.light;
    notifyListeners();
  }

  /// Material ThemeData Customize
  ThemeData get themeData {
    return ThemeData(
      /// Scaffold
      scaffoldBackgroundColor: theme.color.surface,

      /// AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: theme.color.surface,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(
          color: theme.color.text,
        ),
        titleTextStyle: theme.typo.headline2.copyWith(
          color: theme.color.text,
        ),
      ),

      /// BottomSheet
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        constraints: BoxConstraints(
          maxWidth: Breakpoints.bottomSheet,
        ),
      ),
    );
  }
}

extension ThemeServiceExt on BuildContext {
  ThemeService get readThemeService => read<ThemeService>();
  ThemeService get themeService => watch<ThemeService>();
  AppTheme get theme => themeService.theme;
  AppColor get color => theme.color;
  AppDeco get deco => theme.deco;
  AppTypo get typo => theme.typo;
}
