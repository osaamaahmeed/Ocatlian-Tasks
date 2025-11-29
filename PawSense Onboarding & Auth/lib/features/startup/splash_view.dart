import 'package:flutter/material.dart';
import 'package:task1/features/startup/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const String id = 'splashViewId';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const Center(child: SplashViewBody(),),
      ),
    );
  }
}