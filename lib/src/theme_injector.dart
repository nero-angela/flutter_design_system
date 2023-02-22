import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme_service.dart';

class ThemeInjector extends StatelessWidget {
  const ThemeInjector({
    super.key,
    this.themeService,
    required this.child,
  });

  final ThemeService? themeService;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => themeService ?? ThemeService(),
      child: child,
    );
  }
}
