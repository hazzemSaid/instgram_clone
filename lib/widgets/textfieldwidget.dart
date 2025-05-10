import 'package:flutter/material.dart';

class TextFormFieldwidget extends StatelessWidget {
  final String? Function(String?)? validate;
  final TextEditingController controller;
  final String? hintText;
  final TextInputType keyboardType;
  const TextFormFieldwidget({
    super.key,
    required this.controller,
    required this.validate,
    required this.hintText,
    this.keyboardType = TextInputType.emailAddress,
  });

  @override
  Widget build(BuildContext context) {
    const outlineInputBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    );
    InputDecoration decoration = InputDecoration(
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      border: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      errorBorder: outlineInputBorder,
      focusedErrorBorder: outlineInputBorder,
      errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
      hintStyle: const TextStyle(color: Colors.white, fontSize: 12),
      filled: true,
    );
    return TextFormField(
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      cursorHeight: 20,
      cursorWidth: 2,
      validator: validate,
      autocorrect: true, // Enables autocorrect
      enableSuggestions: true, // Enables keyboard suggestions
      controller: controller,
      decoration: decoration,
    );
  }
}
