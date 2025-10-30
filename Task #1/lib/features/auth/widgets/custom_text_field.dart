import 'package:flutter/material.dart';
import 'package:task1/core/utils/constants.dart';
import 'package:task1/core/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, required this.icon});
  final String hintText;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: kMainColor, width: 1), // 2?
    );
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Styles.textStyle17.copyWith(color: Colors.black),
        suffixIcon: Icon(icon, color: kMainColor),
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        disabledBorder: outlineInputBorder,
      ),
    );
  }
}
