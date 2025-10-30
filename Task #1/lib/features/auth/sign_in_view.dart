import 'package:flutter/material.dart';
import 'package:task1/features/auth/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const String id = 'signInViewId';
  final bool LogedIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInViewBody()
    );
  }
}
