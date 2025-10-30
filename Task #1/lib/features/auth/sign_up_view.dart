import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task1/core/utils/constants.dart';
import 'package:task1/core/utils/styles.dart';
import 'package:task1/features/auth/sign_in_view.dart';
import 'package:task1/features/auth/widgets/custom_button.dart';
import 'package:task1/features/auth/widgets/custom_icon_button.dart';
import 'package:task1/features/auth/widgets/labeled_text_field.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String id = 'signUpView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 60),
              Center(
                child: Text(
                  "Sign Up",
                  style: Styles.textStyle32.copyWith(color: kMainColor),
                ),
              ),
              const SizedBox(height: 50),
              LabeledTextField(
                label: "Email",
                hintText: "Enter your email",
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 8,),
              LabeledTextField(
                label: "Password",
                hintText: "Enter your password",
                icon: Icons.visibility_off_outlined,
              ),
              const SizedBox(height: 8),
              LabeledTextField(
                label: "Confirm Password",
                hintText: "Confirm  your password",
                icon: Icons.visibility_off_outlined,
              ),
              const SizedBox(height: 8),
              Align(
                alignment: AlignmentGeometry.centerRight,
                child: Text(
                  // too small ?
                  "Forget Password?",
                  style: Styles.textStyle15.copyWith(
                    color: kMainColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 50), // 140 too much ?
              Center(
                child: CustomButton(text: "Sign up ", onTap: () {}),
              ),
              const SizedBox(height: 60),
              Align(
                alignment: AlignmentGeometry.center,
                child: Text(
                  "OR\nSign in with",
                  style: Styles.textStyle17.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                    child: Icon(
                      FontAwesomeIcons.facebook,
                      color: Color(0xFF1877F2),
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 16),
                  CustomIconButton(
                    child: SvgPicture.asset(
                      'assets/icons/google-logo.svg',
                      width: 28,
                      height: 28,
                    ),
                  ),
                  SizedBox(width: 16),
                  CustomIconButton(
                    child: Icon(
                      FontAwesomeIcons.apple,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: Styles.textStyle17.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, SignInView.id);
                    },
                    child: Text(
                      "Sign in",
                      style: Styles.textStyle17.copyWith(
                        fontWeight: FontWeight.w600,
                        color: kMainColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
