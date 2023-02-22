import 'package:flutter/material.dart';

import 'toast_builder.dart';

abstract class Toast {
  static GlobalKey<NavigatorState>? _navigatorKey;

  static Widget init(GlobalKey<NavigatorState> navigatorKey, Widget? child) {
    _navigatorKey = navigatorKey;
    return Overlay(
      initialEntries: [
        OverlayEntry(builder: (context) => child!),
      ],
    );
  }

  static void show(
    String text, {
    Duration duration = const Duration(seconds: 3),
  }) async {
    assert(_navigatorKey != null, 'Should call "Toast.init(navigatorKey)."');
    BuildContext? context = _navigatorKey!.currentContext;
    if (context == null) return;

    /// Insert
    GlobalKey<ToastBuilderState> toastKey = GlobalKey();
    final overlay = Overlay.of(context);
    final toast = OverlayEntry(
      builder: (context) => ToastBuilder(
        key: toastKey,
        context: context,
        text: text,
      ),
    );
    overlay.insert(toast);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      toastKey.currentState?.isShow = true;
    });

    /// Remove
    await Future.delayed(duration);
    toastKey.currentState?.isShow = false;
    await Future.delayed(toastKey.currentState?.animDuration ?? duration);
    toast.remove();
  }
}
