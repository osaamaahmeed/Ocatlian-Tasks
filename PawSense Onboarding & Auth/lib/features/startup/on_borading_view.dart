import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task1/core/utils/constants.dart';
import 'package:task1/core/utils/styles.dart';
import 'package:task1/features/auth/sign_in_view.dart';
import 'package:task1/features/auth/widgets/custom_button.dart';
import 'package:task1/features/startup/widgets/on_borading_view_body.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});
  static const String id = "onBoardingId";

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int index = 0;
  var controller = PageController();
  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      OnBoardingViewBody(
        title: 'Smarter Care Starts With AI',
        body:
            'Track health, behavior, and emotions - powered by intelligent insights.',
        imagePath: 'assets/images/img1.png',
      ),
      OnBoardingViewBody(
        title: 'Your One-Stop Pet Shop',
        body:
            'Track health, behavior, and emotions - powered by intelligent insights.',
        imagePath: 'assets/images/img2.png',
      ),
      OnBoardingViewBody(
        title: 'Connect with the Pet-Loving World',
        body:
            'Meet other pet parents, explore services, and share joyful moments.',
        imagePath: 'assets/images/img3.png',
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (i) => setState(() {
                  index = i;
                }),
                children: pages,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: SmoothPageIndicator(
                controller: controller,
                count: pages.length,
                effect: const WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  dotColor: Color.fromRGBO(131, 103, 199, 0.5),
                  activeDotColor: kMainColor,
                ),
              ),
            ),
            const SizedBox(height: 22),
            Padding(
              padding: EdgeInsetsGeometry.only(left: 16, right: 16, bottom: 50),
              child: index < pages.length - 1
                  ? Row(
                      children: [
                        TextButton(
                          onPressed: finish,
                          child: Text(
                            'Skip',
                            style: Styles.textStyle22.copyWith(
                              color: kMainColor,
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 130,
                          child: CustomButton(
                            text: "Next",
                            onTap: () {
                              controller.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeOut,
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  : CustomButton(
                      text: "Get Started",
                      trailingIcon: Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
                        size: 32,
                      ),
                      onTap: () {
                        finish();
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> finish() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('splash', true);
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, SignInView.id);
  }
}
