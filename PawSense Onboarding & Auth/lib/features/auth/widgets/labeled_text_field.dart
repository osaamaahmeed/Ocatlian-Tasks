import 'package:flutter/material.dart';
import 'package:task1/core/utils/styles.dart';
import 'package:task1/features/auth/widgets/custom_text_field.dart';

class LabeledTextField extends StatelessWidget {
  const LabeledTextField({super.key, required this.label, required this.hintText, required this.icon});
  final String hintText;
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Styles.textStyle20),
        const SizedBox(height: 15),
        CustomTextField(hintText: hintText, icon: icon,),
      ],
    );
  }
}