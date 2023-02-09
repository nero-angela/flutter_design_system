import 'package:flutter/material.dart';

import '../theme_service.dart';

class RoundBadge extends StatelessWidget {
  const RoundBadge({
    super.key,
    required this.child,
    required this.label,
    bool? isShow,
  }) : isShow = isShow ?? true;

  final Widget child;
  final String label;
  final bool isShow;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        /// Child widget
        child,

        /// Badge
        Positioned(
          top: 10,
          right: 6,
          child: IgnorePointer(
            ignoring: true,
            child: CircleAvatar(
              backgroundColor: context.color.secondary,
              radius: isShow ? 10 : 0,
              child: Text(
                label,
                style: context.font.body2.copyWith(
                  color: context.color.onSecondary,
                  fontWeight: context.font.light,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
