import 'package:alpha/Constants/app_colors.dart';
import 'package:alpha/common_components/loading.dart';
import 'package:alpha/helpers/shared_prefs.dart';
import 'package:alpha/modules/login/views/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool loading = true;
  @override
  void initState() {
    SharedPreferencesHelper.checkOnBoardingViewed().then((onBoardingViewed) {
      if (onBoardingViewed) {
        SharedPreferencesHelper.checkUserIsAuthenticated()
            .then((isAuthenticated) {
          SharedPreferencesHelper.setBoardingViewed(true).then((_) =>
              Get.offAll(
                  () => isAuthenticated ? Container() : const LoginScreen()));
        });
      }
      setState(() => loading = false);
    });
    super.initState();
  }

  final List<Introduction> list = [
    Introduction(
      title: '',
      subTitle: '',
      imageUrl: '',
      subTitleTextStyle: TextStyle(
          fontSize: 40, fontWeight: FontWeight.w700, color: AppColors.primary),
    ),
    Introduction(
      title: '',
      subTitle: '',
      imageUrl: '',
      subTitleTextStyle: TextStyle(
          fontSize: 40, fontWeight: FontWeight.w700, color: AppColors.primary),
    ),
    Introduction(
      title: '',
      subTitle: '',
      imageUrl: '',
      subTitleTextStyle: TextStyle(
          fontSize: 40, fontWeight: FontWeight.w700, color: AppColors.primary),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return loading
        ? const Scaffold(body: Loading())
        : IntroScreenOnboarding(
            introductionList: list,
            foregroundColor: AppColors.primary,
            backgroudColor: Colors.transparent,
            skipTextStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.primary),
            onTapSkipButton: () => Get.offAll(() => const LoginScreen()));
  }
}
