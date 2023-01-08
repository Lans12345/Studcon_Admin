import 'package:consultation_system/constant/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextformfieldWidget extends StatelessWidget {
  final String label;
  final Widget? prefixIcon;
  final TextEditingController? textFieldController;
  final Widget? suffixIcon;
  final bool isObscure;
  final bool? isForStudentReg;
  const TextformfieldWidget({
    super.key,
    required this.label,
    this.isObscure = false,
    this.prefixIcon,
    this.suffixIcon,
    this.textFieldController,
    this.isForStudentReg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: greyColor, borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        obscureText: isObscure,
        controller: textFieldController,
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            labelText: '    $label',
            suffixIcon: suffixIcon),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label is required';
          }

          if (label == 'Email') {
            if (isForStudentReg != null) {
              return isForStudentReg!
                  ? (validateStudentEmail(value)
                      ? null
                      : 'Use a valid institutional email')
                  : (validateInstructorEmail(value)
                      ? null
                      : 'Use a valid institutional email');
            }
          }

          return null;
        },
      ),
    );
  }
}

bool validateStudentEmail(String email) {
  RegExp regex = RegExp(r'^\d{10}@student.buksu.edu.ph$');
  return regex.hasMatch(email);
}

bool validateInstructorEmail(String email) {
  return email.endsWith('@buksu.edu.ph');
}
