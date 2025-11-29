import 'package:flutter/material.dart';
import 'package:task1/core/utils/constants.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
    {
    this.onPressed,
    required this.child,
    super.key,
  });
  final Widget child;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      customBorder: const CircleBorder(),
      child: Ink(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: kMainColor, width: 1.5),
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.all(12),
          child: child,
        ),
      ),
    );
  }
}