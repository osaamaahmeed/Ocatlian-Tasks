import 'package:flutter/material.dart';
import 'package:task1/core/utils/constants.dart';
import 'package:task1/core/utils/styles.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({
    super.key,
    required this.title,
    required this.body,
    required this.imagePath,
  });
  final String title;
  final String body;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Text(title, style: Styles.textStyle32.copyWith(color: kMainColor), textAlign: TextAlign.center,),
          const SizedBox(height: 40),
          Text(
            body,
            style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 45),
          Image.asset(imagePath),
        ],
      ),
    );
  }
}
