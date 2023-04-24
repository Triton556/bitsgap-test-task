import 'package:flutter/material.dart';

import '../../../../constants/text_theme_constants.dart';

class AuthFormField extends StatelessWidget {
  final String? hint;
  final void Function(String)? onChanged;
  final String? errorText;
  final TextEditingController controller;

  const AuthFormField(
      {super.key, this.hint = '', this.onChanged, this.errorText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        constraints: const BoxConstraints(maxHeight: 46),
        hintText: hint,
        hintStyle: ttNormsProTextTheme.labelMedium,
        errorText: errorText,
      ),
      textAlignVertical: TextAlignVertical.bottom,
    );
  }
}
