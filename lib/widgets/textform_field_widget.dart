import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextformfieldWidget extends StatelessWidget {
  final String label;
  final Widget? prefixIcon;
  final TextEditingController? textFieldController;
  final Widget? suffixIcon;
  final bool isObscure;
  const TextformfieldWidget({
    super.key,
    required this.label,
    this.isObscure = false,
    this.prefixIcon,
    this.suffixIcon,
    this.textFieldController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        obscureText: isObscure,
        controller: textFieldController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label is required';
          }

          return null;
        },
      ),
    );
  }
}
