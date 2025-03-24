import 'package:final_projects/core/utils/app_assets.dart';
import 'package:final_projects/core/utils/app_color.dart';
import 'package:final_projects/features/get_started/get_started.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const OnBoardingPage());
  }
}

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => GetStarted()));
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColor.gray,
      ),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 30, top: 20),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return GetStarted();
                  },
                ),
              );
            },
            child: Text(
              "Skip",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),

      pages: [
        PageViewModel(
          title: "Choose Products",
          body:
              "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
          image: SvgPicture.asset(AppAssets.onboardingpath1),
          decoration: pageDecoration.copyWith(
            safeArea: 100,
            bodyFlex: 8,
            imageFlex: 8,
          ),
        ),

        PageViewModel(
          title: "Make Payment",
          body:
              "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
          image: SvgPicture.asset(AppAssets.onboardingpath2),
          decoration: pageDecoration.copyWith(
            bodyFlex: 6,
            imageFlex: 8,
            safeArea: 100,
          ),
        ),
        PageViewModel(
          image: SvgPicture.asset(AppAssets.onboardingpath3),
          title: "Get Your Order",

          body:
              "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
          decoration: pageDecoration.copyWith(
            bodyFlex: 6,
            imageFlex: 8,
            safeArea: 100,
          ),
        ),
      ],
      onDone: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return GetStarted();
            },
          ),
        );
      },
      onSkip: () {}, // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Text(
        "Prev",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColor.gray,
          fontSize: 18,
        ),
      ),
      skip: const Text(
        'Skip',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          backgroundColor: AppColor.red,
          fontSize: 18,
        ),
      ),
      next: const Text(
        "Next",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColor.red,
          fontSize: 18,
        ),
      ),
      done: const Text(
        'Done',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: AppColor.red,
        ),
      ),
      curve: Curves.slowMiddle,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding:
          kIsWeb
              ? const EdgeInsets.all(12.0)
              : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(10.0, 10.0),
        activeColor: Colors.black,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
