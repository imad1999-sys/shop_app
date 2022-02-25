import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool isPassword;
  final void Function(String)? onchange;
  final String? Function(String?)? onValidate;
  final String hint;
  final Widget prefix;
  final Widget suffix;

  const DefaultTextField({
    required this.controller,
    required this.textInputType,
    required this.isPassword,
    required this.onchange,
    required this.onValidate,
    required this.hint,
    required this.prefix,
    required this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: isPassword,
      onChanged: onchange,
      validator: onValidate,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(),
        prefixIcon: prefix,
        suffixIcon: suffix != null ? suffix : null,
      ),
    );
    ;
  }
}
