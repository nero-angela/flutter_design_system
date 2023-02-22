import 'package:flutter/material.dart';

import '../../../theme_service.dart';

class ToastBuilder extends StatefulWidget {
  const ToastBuilder({
    super.key,
    required this.context,
    required this.text,
  });

  final String text;
  final BuildContext context;

  @override
  State<ToastBuilder> createState() => ToastBuilderState();
}

class ToastBuilderState extends State<ToastBuilder> {
  bool _isShow = false;

  bool get isShow => _isShow;

  set isShow(bool value) {
    setState(() {
      _isShow = value;
    });
  }

  final Duration animDuration = const Duration(milliseconds: 333);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Positioned(
      bottom: screenSize.height * 0.25,
      left: 0,
      right: 0,
      child: Center(
        child: AnimatedOpacity(
          duration: animDuration,
          opacity: isShow ? 1 : 0,
          child: Container(
            decoration: BoxDecoration(
              color: context.color.toastContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(12),
            child: DefaultTextStyle(
              style: context.typo.headline6.copyWith(
                color: context.color.onToastContainer,
              ),
              child: Text(widget.text),
            ),
          ),
        ),
      ),
    );
  }
}
