import 'package:flutter/material.dart';

import '../theme_service.dart';
import 'button.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    this.hint,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
  });

  final String? hint;
  final TextEditingController? controller;
  final void Function(String text)? onChanged;
  final void Function(String text)? onSubmitted;
  final void Function()? onClear;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late final TextEditingController controller =
      widget.controller ?? TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        setState(() {});
        widget.onChanged?.call(value);
      },
      onSubmitted: widget.onSubmitted,
      style: context.font.headline5.copyWith(
        color: context.color.text,
      ),
      cursorColor: context.color.primary,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: context.color.hintContainer,
        hintStyle: context.font.headline5.copyWith(
          fontWeight: context.font.light,
          color: context.color.onHintContainer,
        ),
        hintText: widget.hint,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 11.5,
          horizontal: 16,
        ),
        suffixIcon: controller.text.isEmpty
            ? null
            : Button(
                icon: 'close-outline.svg',
                type: ButtonType.flat,
                onPressed: () {
                  setState(() {
                    controller.clear();
                    widget.onClear?.call();
                  });
                },
              ),
      ),
    );
  }
}
