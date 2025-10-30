import 'package:flutter/material.dart';
import 'package:task1/features/auth/sign_in_view.dart';
import 'package:task1/features/auth/sign_up_view.dart';
import 'package:task1/features/startup/on_borading_view.dart';
import 'package:task1/features/startup/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Quicksand'),
      debugShowCheckedModeBanner: false,
      routes: {
        SignInView.id: (context) => const SignInView(),
        SignUpView.id: (context) => const SignUpView(),
        OnBoardingView.id: (context) => const OnBoardingView(),
        SplashView.id: (context) => const SplashView(),

      },
      initialRoute: SplashView.id,
    );
  }
}
