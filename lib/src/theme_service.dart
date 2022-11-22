import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../src/core/app_theme.dart';
import 'component/base_toast.dart';
import 'default_theme/default_dark_theme.dart';
import 'default_theme/default_light_theme.dart';
import 'responsive/responsive.dart';

class ThemeService with ChangeNotifier {
  ThemeService({
    Brightness? brightness,
    AppTheme? lightTheme,
    AppTheme? darkTheme,
  })  : brightness = brightness ?? Brightness.light,
        lightTheme = lightTheme ?? DefaultLightTheme(),
        darkTheme = darkTheme ?? DefaultDarkTheme();

  AppTheme get theme => brightness == Brightness.light ? lightTheme : darkTheme;
  Brightness brightness;
  AppTheme lightTheme;
  AppTheme darkTheme;

  /// Change Theme
  void toggleTheme() {
    if (theme.brightness == Brightness.light) {
      brightness = Brightness.dark;
    } else {
      brightness = Brightness.light;
    }
    notifyListeners();
  }

  /// Material ThemeData
  ThemeData get themeData {
    return ThemeData(
      /// Scaffold
      scaffoldBackgroundColor: theme.color.surface,

      /// AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: theme.color.surface,
        titleSpacing: 0,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(
          color: theme.color.text,
        ),
        titleTextStyle: theme.font.headline2.copyWith(
          color: theme.color.text,
        ),
      ),

      /// BottomSheet
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        constraints: BoxConstraints(
          maxWidth: ResponsiveConfig.bottomSheetMaxWidth,
        ),
      ),
    );
  }
}

extension BuildContextThemeNanagerExt on BuildContext {
  ThemeService get rThemeManager => read<ThemeService>();
  ThemeService get themeManager => watch<ThemeService>();
  AppTheme get theme => themeManager.theme;
  AppColor get color => theme.color;
  AppDeco get deco => theme.deco;
  AppFont get font => theme.font;

  /// Toast
  void toast(String msg) {
    FToast()
      ..init(this)
      ..showToast(
        toastDuration: const Duration(seconds: 2),
        child: BaseToast(msg: msg),
        positionedToastBuilder: (context, child) {
          Size deviceSize = MediaQuery.of(context).size;
          return Positioned(
            bottom: deviceSize.height * 0.2,
            left: 0,
            right: 0,
            child: child,
          );
        },
      );
  }
}
