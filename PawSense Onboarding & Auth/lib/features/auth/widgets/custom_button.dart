import 'package:flutter/material.dart';
import 'package:task1/core/utils/constants.dart';
import 'package:task1/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onTap, this.trailingIcon});
  final String text;
  final void Function()? onTap;
  final Icon? trailingIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            begin: AlignmentGeometry.topCenter,
            end: AlignmentGeometry.bottomCenter,
            colors: [kMainColor, Color(0xFF33214E)],
          ),
        ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: Styles.textStyle22.copyWith(color: Colors.white),
              ),
              if (trailingIcon != null) ...[SizedBox(width: 20,), trailingIcon!]
            ],
        ),
      ),
    );
  }
}
