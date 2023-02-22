import 'package:flutter/material.dart';

import '../../../theme_service.dart';
import '../asset_icon.dart';

part 'button_size.dart';
part 'button_type.dart';

class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.onPressed,
    this.text,
    this.icon,
    this.color,
    this.backgroundColor,
    this.borderColor,
    this.width,
    ButtonType? type,
    ButtonSize? size,
    bool? isInactive,
  })  : type = type ?? ButtonType.fill,
        size = size ?? ButtonSize.medium,
        isInactive = isInactive ?? false;

  /// 클릭 이벤트
  final void Function() onPressed;

  /// Button 타입 & 크기
  final ButtonType type;
  final ButtonSize size;

  /// 비활성화 여부
  final bool isInactive;

  /// 텍스트 & 아이콘
  final String? text;
  final String? icon;

  /// 폭
  final double? width;

  /// 커스텀 색상
  final Color? color;
  final Color? backgroundColor;
  final Color? borderColor;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  /// 버튼이 눌려있는지 여부
  bool isPressed = false;

  /// 비활성화 여부
  bool get isInactive => isPressed || widget.isInactive;

  /// [ButtonType]에 따른 텍스트 & 아이콘 색상
  Color get color => widget.type.getColor(
        context,
        isInactive,
        widget.color,
      );

  /// [ButtonType]에 따른 배경 색상
  Color get backgroundColor => widget.type.getBackgroundColor(
        context,
        isInactive,
        widget.backgroundColor,
      );

  /// [ButtonType]에 따른 테두리
  Border? get border {
    return widget.type.getBorder(
      context,
      isInactive,
      widget.borderColor,
    );
  }

  /// 버튼 클릭 이벤트
  void onPressed(bool newIsPressed) {
    if (isPressed == newIsPressed) return;
    setState(() {
      isPressed = newIsPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /// 클릭 이벤트
      onTapUp: (details) {
        onPressed(false);
        if (!widget.isInactive) {
          widget.onPressed();
        }
      },
      onTapDown: (details) => onPressed(true),
      onTapCancel: () => onPressed(true),

      /// 컨테이너
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: widget.width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: border,
        ),
        padding: EdgeInsets.all(widget.size.padding),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// 아이콘
            if (widget.icon != null)
              AssetIcon(
                widget.icon!,
                color: color,
              ),
            if (widget.icon != null && widget.text != null)
              const SizedBox(width: 8),

            /// 텍스트
            if (widget.text != null)
              Text(
                widget.text!,
                style: widget.size.getTextStyle(context).copyWith(
                      color: color,
                      fontWeight: context.typo.semiBold,
                    ),
              ),
          ],
        ),
      ),
    );
  }
}
