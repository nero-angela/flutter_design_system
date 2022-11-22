import 'package:flutter/material.dart';

import '../theme_service.dart';

class BaseToast extends StatelessWidget {
  const BaseToast({
    super.key,
    required this.msg,
  });

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.toastContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      margin: const EdgeInsets.all(16),
      child: Text(
        msg,
        style: context.font.headline6.copyWith(
          color: context.color.onToastContainer,
        ),
      ),
    );
  }
}
